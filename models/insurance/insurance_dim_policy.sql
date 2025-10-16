{{ config(
    materialized = 'table',
    schema = 'dw_insurance'
)}}

SELECT
    policyid as policy_key,
    policyid,
    policytype
from {{ source('insurance_landing', 'policies')}}