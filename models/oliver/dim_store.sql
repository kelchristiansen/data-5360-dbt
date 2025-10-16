{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
storeid as store_key,
storeid,
store_name,
street,
city,
state
FROM {{ source('oliver_landing', 'store') }}