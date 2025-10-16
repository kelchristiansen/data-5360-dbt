{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("1990-01-01", "2050-12-31") }}
)

SELECT
date_id as date_key,
date_id,
dayofweek,
month,
quarter,
year
from cte_date