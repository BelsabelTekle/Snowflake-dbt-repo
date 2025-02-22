


{{ config(
    materialized = 'table'
) }}

SELECT * FROM {{ source("bels_sources",'ORDERS') }} t1

{% if is_incremental() %}
WHERE
t1.date > (SELECT MAX(DATE) FROM {{ this }})  -- `{{ this }}` refers to the table being updated
{% endif %}
