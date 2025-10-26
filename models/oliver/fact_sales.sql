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
FROM {{ source('oliver_landing','orderline') }} f

LEFT JOIN {{ ref('dim_customer') }} c
    ON f.customer_key = c.customer_key

LEFT JOIN {{ ref('dim_date') }} d
    ON f.date_key = d.date_key

LEFT JOIN {{ ref('dim_employee') }} e
    ON f.employee_key = e.employee_key

LEFT JOIN {{ ref('dim_product') }} p
    ON f.product_key = p.product_key

LEFT JOIN {{ ref('dim_store') }} s
    ON f.store_key = s.store_key