---
title: Setting Up Jekyll for Static Site Generation from Markdown
layout: default
---

# Setting Up Jekyll for Static Site Generation from Markdown

Jekyll transforms your Markdown files into an HTML representation statically.

Mixing base Markdown, HTML tags that Markdown allows and Jekyll looping
statements and themes, we can make a simple but good-looking website with ease.

## Generation of a List from a Directory Local to the Configuration File

{% raw %}
```liquid
<ul>
    {% for file in site.myCollection %}
        <li>
            <a href="{{ site.baseurl }}{{ file.url }}">{{ file.title }}</a>
        </li>
    {% endfor %}
</ul>
```
{% endraw %}

You can tweak the code however you like. This is just the way that worked best
for me.

## Site Configuration File

This list-like reading is based on Jekyll's collections. As we added the
`site.basedir` to the previous code, we'll be covering that as well.

```yml
baseurl: "/your-repo-name-here" # If you're building outside your main GitHub
                                # Pages repository, this will solve the issue
                                # with file path redirections.

output: true # Tells Jekyll to forcibly generate an HTML representation from the
             # root "index.md" (site object) Markdown file.

theme: "your-theme-name-here" # There are many themes available out there. For
                              # instance, this site uses jekyll-theme-hacker.

collections:
    myCollection:
        output: true # The same as before, but for each file of "_myCollection".
        permalink: "/myCollection/:path/"
```

Important:

- The name of the directory containing the collection files must be preceded by
  an underscore, `_`.
- In GitHub repositories, this file is usually called `_config.yml` and is
  placed at the root of the repository.

## Configuration Inside Each File in the Collection

For Jekyll to recognize collection files, these must start with a *front matter*
block. This consists of a couple of horizontal rules at the start of the file,
containing some dictionary values. Most Markdown visualizers will render this
part of the file. But worry not, Jekyll will fully ignore it and use it as file
mapping only.

```md
---
title: Your File Title Here
layout: default
---
```

---

Side note: This guide is just an example on how to build with Jekyll, mainly
aimed for GitHub Pages users. Thus the lack of device-local building statements.
