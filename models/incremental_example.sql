{{ config(materialized='incremental') }}

SELECT * FROM {{ source("bels_sources", "DIM_SALES") }}

