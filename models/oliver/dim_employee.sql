{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
employeeid as employee_key,
employeeid,
firstname,
lastname,
email,
phone,
hire_date,
position
FROM {{ source('oliver_landing', 'employee') }}