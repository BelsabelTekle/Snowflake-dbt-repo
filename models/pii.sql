

{{config(
    materialized= 'table'
    )}}

select * from {{source("bels_sources","PII_RAM")}}