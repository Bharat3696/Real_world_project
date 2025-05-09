{% macro compute_lookback(DAYS_PARAM = "P_LOOK_BACK_DAYS", DATE_PARAM = "P_LOOK_BACK_FROM_DATE") %}
    {% set date_param = var(DATE_PARAM, none) %}
    {% set days_param = var(DAYS_PARAM, none) %}

    {% if date_param %}
        {% if '-' in date_param %}
            '{{ date_param }}'
        {% else %}
            to_date('{{ date_param }}', 'YYYYMMDD')
        {% endif %}
    {% elif days_param %}
        current_date - {{ days_param }}
    {% else %}
        current_date
    {% endif %}
{% endmacro %}
