
{% test new_test(model,column_name)%}
select * from {{model}}
where {{column_name}} < 3
{% endtest %}