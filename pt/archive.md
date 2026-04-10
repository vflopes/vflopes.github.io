---
layout: page
title: Arquivo
lang: pt
translation_key: archive
permalink: /pt/archive/
excerpt: Todos os posts.
comments: false
---

<div class="search-article">
    <label for="search-input" aria-hidden="true">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
            stroke="rgba(128,128,128,0.8)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
            class="feather feather-search">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
        </svg>
    </label>
    <input type="search" id="search-input" placeholder="Procure artigos aqui" aria-label="Search">
</div>

<ul id="search-results"></ul>

{%- assign current_lang = page.lang | default: site.default_lang | default: site.lang | default: "en" -%}
{%- assign visible_posts = site.posts | where: "lang", current_lang -%}
{%- for post in visible_posts -%}
{%- capture current_year -%}{{ post.date | date: "%Y" }}{%- endcapture -%}
{%- unless current_year == previous_year -%}
<h2>{{ current_year }}</h2>
{%- assign previous_year = current_year -%}
{%- endunless -%}
<article class="post-item">
    <h3 class="post-item-title">
        <a href="{{ post.url }}">{{ post.title | escape }}</a>
    </h3>
</article>
{%- endfor -%}
