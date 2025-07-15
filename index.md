# Guides

<ul>
    {% for guide in site.guides %}
        <li><a href="{{ guide.url }}">{{ guide.title | guide.name }}</a></li>
    {% endfor %}
</ul>
