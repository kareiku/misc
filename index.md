# Guides

<ul>
    {% for guide in site.guides %}
        <li><a href="/misc/{{ guide.url }}">{{ guide.title }}</a></li>
    {% endfor %}
</ul>
