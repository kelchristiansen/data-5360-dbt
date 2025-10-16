{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
customerid as customer_key,
customerid,
firstname,
lastname,
email,
phone,
state
FROM {{ source('oliver_landing', 'customer') }}