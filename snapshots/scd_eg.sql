{% snapshot scd_table %}

{{ config
(target_schema= 'random',
 strategy='check',
 unique_key='ID',
 check_cols=['FIRSTNAME','LASTNAME'],
)


}}

-- updated ay strategy
{{ config
(target_schema= 'random',
 strategy='check',
 unique_key='ID',
 updated_at= 'updated_at'
)


}}


SELECT * FROM {{source("bels_sources","SCD_EG")}}

{% endsnapshot %}


