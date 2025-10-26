{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    d.date_day,
    e.employee_id,
    c.certification_name,
    c.certification_cost
from 
    {{ ref('stg_employee_certifications') }} c
inner join {{ ref('dim_date') }} d
    on d.date_day = c.certification_awarded_date
inner join {{ ref('dim_employee') }} e
    on e.employee_id = c.employee_id