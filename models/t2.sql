{{
    config(
        tags=['daily']
    )
}}

Select * 
from {{source("bels_sources","USERS"
)}}