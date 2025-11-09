  {{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


SELECT
c.first_name as customer_first_name,
c.last_name as customer_last_name,
d.date_day,
p.product_id,
e.first_name as employee_first_name,
e.last_name as employee_last_name
FROM {{ source('oliver_landing','orderline') }} ol

LEFT JOIN {{ source('oliver_landing','orders') }} o
    ON ol.order_id = o.order_id

LEFT JOIN {{ ref('dim_customer') }} c
    ON o.customer_id = c.customer_id

LEFT JOIN {{ ref('dim_date') }} d
    ON o.order_date = d.date_key

LEFT JOIN {{ ref('dim_employee') }} e
    ON o.employee_id = e.employee_id

LEFT JOIN {{ ref('dim_product') }} p
    ON ol.product_id = p.product_id

LEFT JOIN {{ ref('dim_store') }} s
    ON o.store_id = s.store_id