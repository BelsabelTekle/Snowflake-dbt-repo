
{% macro convert_value(currency, value) %}
    {% if currency == 'Rupees' %}
        {{ value }}
    {% elif currency == 'Dollars' %}
        {{ value / 60 }}
    {% elif currency == 'Yen' %}
        {{ value / 80 }}
    {% elif currency == 'PAKR' %}
        {{ value / 20 }}
    {% else %}
        {{ value }}  {# Default case if an unknown currency is encountered #}
    {% endif %}
{% endmacro %}