<nav>
    <p>Chapters:
        {% if chapterID > 0 and outline.chapters.length > 1 -%}
            <a class="back" href="/chapter/{{ outline.chapters[chapterID-1].id }}">Back</a>
        {%- endif -%}
        {%- if chapterID > 0 and outline.chapters.length > 1 and chapterID < outline.chapters.length - 1 %}
            -
        {% endif -%}
        {% if chapterID < outline.chapters.length - 1 -%}
            <a class="next" href="/chapter/{{ outline.chapters[chapterID--1].id }}">Next</a>
        {%- endif %}
    </p>
    {% if pageID %}
        <p>Pages:
            {% if pageID > 0 and chapter.pages.length > 1 -%}
                <a class="back" href="/chapter/{{ chapter.id }}/{{ chapter.pages[pageID-1].id }}">Back</a>
            {%- endif -%}
            {%- if pageID > 0 and chapter.pages.length > 1 and pageID < chapter.pages.length - 1 %}
                -
            {% endif -%}
            {% if pageID < chapter.pages.length - 1 -%}
                <a class="next" href="/chapter/{{ chapter.id }}/{{ chapter.pages[pageID--1].id }}">Next</a>
            {%- endif %}
        </p>
    {% endif %}
</nav>