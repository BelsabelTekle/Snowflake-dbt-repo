
{{config(materialized="table")}}


select * from {{source("bels_sources","SALES")}}
