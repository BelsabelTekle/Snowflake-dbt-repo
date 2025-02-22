

{% macro perc_change(a, b) %}
    ({{ a | safe }} - {{ b | safe }}) / NULLIF({{ b | safe }}, 0) * 100
{% endmacro %}
