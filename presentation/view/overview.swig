{% extends 'layout/default.swig' %}

{% block body %}
    <h1>{{ outline.main.title }}</h1>
    <h2>Chapters:</h2>
    <ul class="chapters">
        {% for chapter in outline.chapters %}
        <li><a href="/chapter/{{ chapter.id }}">{{ chapter.title }}</a></li>
        {% endfor %}
    </ul>
{% endblock %}
