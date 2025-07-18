# Guides

<ul>
    {% for guide in site.guides %}
        <li>
            <a href="{{ site.baseurl }}{{ guide.url }}">{{ guide.title }}</a>
        </li>
    {% endfor %}
</ul>
