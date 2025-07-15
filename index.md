# Guides

<ul>
    {% for guide in site.guides %}
        <li><a href="{{ guide.url }}">{{ guide.path }}</a></li>
    {% endfor %}
</ul>
