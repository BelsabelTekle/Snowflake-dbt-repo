{{config(materialized="table")}}


SELECT * FROM DB_ECOMM.SC_ECOMM.USERS
UNION ALL
SELECT * FROM DB_ECOMM.SC_ECOMM.USERS

