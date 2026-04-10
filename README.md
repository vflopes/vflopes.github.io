# vflopes.github.io

## Bilingual Content (EN/PT)

This blog now supports English and Portuguese pages with language routes:

- `/en/` for English
- `/pt/` for Portuguese

### Post front matter convention

Every post should include:

```yaml
lang: en # or pt
translation_key: unique-post-key
```

Use the same `translation_key` for both language versions of the same article.

Example:

- English post: `lang: en`, `translation_key: docker-setup`
- Portuguese post: `lang: pt`, `translation_key: docker-setup`

### Mirrored post workflow

1. Create one post in EN and one post in PT.
2. Keep both with the same `translation_key`.
3. Keep each post in its language (`lang: en` or `lang: pt`).
4. Use language-specific pages (`/en/*`, `/pt/*`) to browse by language.

### i18n pair checker

You can check mirrored EN/PT coverage locally:

```bash
ruby scripts/check_i18n_pairs.rb
```

Strict mode (fails when a pair is missing):

```bash
STRICT_I18N=true ruby scripts/check_i18n_pairs.rb
```