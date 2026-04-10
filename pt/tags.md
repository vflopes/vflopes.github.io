---
layout: page
title: Tags
lang: pt
translation_key: tags
permalink: /pt/tags/
excerpt: Artigos agrupados por tags.
---

<div class="archive-tags">
    <a class="tag-item" href="#">todos</a>
    {%- assign current_lang = page.lang | default: site.default_lang | default: site.lang | default: "en" -%}
    {%- for tag in site.tags -%}
    {% capture name %}{{ tag | first }}{% endcapture %}
    {%- assign posts_in_lang = site.tags[name] | where: "lang", current_lang -%}
    {%- if posts_in_lang.size > 0 -%}
    <a class="tag-item" href="#{{name}}">{{ name }}</a>
    {%- endif -%}
    {%- endfor -%}
</div>

{%- for tag in site.tags -%}
{%- capture name -%}{{ tag | first }}{%- endcapture -%}
{%- assign posts_in_lang = site.tags[name] | where: "lang", current_lang -%}
{%- if posts_in_lang.size > 0 -%}
<h2 id="{{ name }}">{{ name | upcase }}</h2>
{%- for post in posts_in_lang -%}
{%- capture localized_date -%}{% include date_localized.html date=post.date lang=current_lang %}{%- endcapture -%}
<article class="post-item" id="results-container">
    <span class="post-item-date">{{ localized_date | strip }}</span>
    <h3 class="post-item-title">
        <a href="{{ post.url }}">{{ post.title | escape }}</a>
    </h3>
</article>
{%- endfor -%}
{%- endif -%}
{%- endfor -%}
