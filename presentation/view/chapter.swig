{% extends 'layout/default.swig' %}

{% block body %}
    {% include 'modules/nav.swig' %}

    <h1>{{ chapter.title }}</h1>
    <h2>Pages:</h2>
    <ul>
        {% for page in chapter.pages %}
        <li><a href="/chapter/{{ chapter.id }}/{{ page.id }}">{{ page.title }}</a></li>
        {% endfor %}
    </ul>
{% endblock %}
