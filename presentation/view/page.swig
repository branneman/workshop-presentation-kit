{% extends 'layout/default.swig' %}

{% block body %}

    {% include 'modules/nav.swig' %}

    {{ content|safe }}

{% endblock %}
