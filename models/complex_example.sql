

-- select
-- order_id,
-- sum(case when payment_mode = 'CASH' then sales end) as cash_amount,
-- sum(case when payment_mode = 'UPI' then sales end) as upi_amount,
-- sum(case when payment_mode = 'CC' then sales end) as cc_amount,
-- sum(sales) as total_amount
-- from {{source("bels_sources","PAYMENT_MODES")}}
-- group by 1

-- But, what if new methods are added, upi, cash, amazon coupon
    -- You will need to write couple of lines, copy paste your code

-- DBT Way of using variables, for loops
-- {% set payment_modes=dbt_utils.get_column_values(source("bels_sources",'PAYMENT_MODES'),'PAYMENT_MODE') %} 
-- SELECT
-- {% for i in payment_modes %}
-- SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i}}_sales {%- if not loop.last -%},{% endif %}
-- {% endfor %}
-- FROM {{source("bels_sources",'PAYMENT_MODES')}}


-- {% set payment_modes=dbt_utils.get_column_values(source("bels_sources",'PAYMENT_MODES'),'PAYMENT_MODE') %} 
-- SELECT
-- {% for i in payment_modes %}
-- {%- if not loop.first -%},{% endif %} SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i}}_sales 
-- {% endfor %}
-- FROM {{source("bels_sources",'PAYMENT_MODES')}}


-- -- index of dbt starts from 1 not 0
-- {% set payment_modes=dbt_utils.get_column_values(source("bels_sources",'PAYMENT_MODES'),'PAYMENT_MODE') %} 
-- SELECT
-- {% for i in payment_modes %}
-- {%- if loop.index>1 -%},{% endif %} SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i}}_sales 
-- {% endfor %}
-- FROM {{source("bels_sources",'PAYMENT_MODES')}}


-- -- index of dbt starts from 1 not 0
-- {% set payment_modes=dbt_utils.get_column_values(source("bels_sources",'PAYMENT_MODES'),'PAYMENT_MODE') %} 
-- SELECT
-- {% for i in payment_modes %}
-- SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i | lower}}_sales {%- if loop.index < loop.length -%},{% endif %}
-- {{loop.index}}
-- {% endfor %}
-- FROM {{source("bels_sources",'PAYMENT_MODES')}}

SELECT
 SUM(CASE WHEN PAYMENT_MODE='CASH' THEN SALES END) AS CASH_sales 
, SUM(CASE WHEN PAYMENT_MODE='CC' THEN SALES END) AS CC_sales 
, SUM(CASE WHEN PAYMENT_MODE='UPI' THEN SALES END) AS UPI_sales 
, SUM(CASE WHEN PAYMENT_MODE='VOUCHER' THEN SALES END) AS VOUCHER_sales 
, SUM(CASE WHEN PAYMENT_MODE='DR' THEN SALES END) AS DR_sales 
, SUM(CASE WHEN PAYMENT_MODE='CAHSH' THEN SALES END) AS CAHSH_sales 

FROM DB_ECOMM.SC_ECOMM.PAYMENT_MODES