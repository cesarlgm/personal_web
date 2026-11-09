# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A Hugo-based personal academic website for César Garro-Marín ([cesargarromarin.com](https://www.cesargarromarin.com/)), built on [Hugo Blox Kit](https://hugoblox.com/) (Tailwind CSS v4, `blox` module, Academic CV template). Deployed on Netlify. Supports English (default) and Spanish.

## Commands

Needs Hugo Extended **0.162.0** (pinned in `netlify.toml` and `hugoblox.yaml`; newer Hugo releases
block the Tailwind CLI under their default security policy), Go, Node 22+ and pnpm.

```bash
pnpm install                 # Tailwind CLI and Pagefind (first time, or after package.json changes)
hugo server                  # local preview
hugo --gc --minify           # production build (matches Netlify)
pnpm run pagefind            # build the search index after a production build
```

On César's PC, Hugo 0.162.0 is at `C:\Users\thecs\tools\hugo-0.162.0\hugo.exe` (the `hugo` on PATH is newer).

## Architecture

### Content and bilingual structure

All content lives in `content/`. Spanish versions use the `.es.md` suffix alongside the English original (e.g., `_index.md` / `_index.es.md`). English is always the authoritative master; Spanish files mirror the same front matter fields and structure.

Key files:
- `content/_index.md`: homepage. Hugo Blox blocks in the `sections:` front matter list: `resume-biography` (centered hero: photo, name, role, affiliation, links; bio hidden), a centered `markdown` block with the welcome text, and a two-column `markdown` block for News (`design.columns: '2'`, see below).
- `content/research/_index.md`: research page (raw HTML, see below)
- `content/teaching/_index.md`: teaching page (raw HTML, same classes)
- `content/contact.md`: `contact-info` block
- `data/authors/cesar.yaml`: profile (name, role, affiliation, links, interests, education). Spanish overrides in `data/es/authors/cesar.yaml` (only the translated fields). Photo: `assets/media/authors/cesar.jpg`.
- `content/blogs/`: published non-technical summaries, linked from the research page (`authors: [cesar]`).

### Research and teaching pages

Both are raw HTML embedded in Markdown, kept from the Wowchemy site. Each paper is a `<div class="media stream-item">` with:
- An anchor `id` on the title div (deep links from the homepage News; Spanish anchors end in `_es`)
- A `showHideText(id)` onclick button to toggle the abstract (`<p class="hidden" style="display: none">`); the script is at the top of the research page
- A paper image from `content/research/images/` (the `_blue.png` variant is the one linked)

The Bootstrap-era classes (`media`, `stream-item`, `btn btn-outline-primary`, ...) are styled in
`assets/css/custom.css`, which also widens these pages. Do not add a global `.hidden` rule: it
overrides Tailwind's `lg:flex` and hides the navbar menu.

### Configuration layout

`config/_default/`:
- `hugo.yaml`: Hugo settings (URL, outputs, taxonomies, imaging)
- `params.yaml`: Hugo Blox settings (`hugoblox:` identity, theme, header, footer, search)
- `languages.yaml`: en and es
- `menus.yaml` / `menus.es.yaml`: navigation per language
- `module.yaml`: Hugo Blox modules

Colors: `data/themes/cgm.yaml` (navy `#0B0C6B` header, red-orange `#dd2c00` primary; light and dark).
Fonts: `data/fonts/rose.yaml` (Lora headings and menu, Roboto body; same as the Wowchemy "rose" pack).

### Local markdown block

`layouts/_partials/hbx/blocks/markdown/block.html` overrides the theme's markdown block to add
`design.columns: '2'` (title in a left column, text on the right; the Wowchemy layout). One column is
unchanged from the theme.

### Local overrides of theme bugs

- `layouts/_partials/functions/typography.html`: line 145 joins font weights with `;` instead of `,`.
  With `,` Google Fonts rejects the request (HTTP 400) and no web fonts load.
- `layouts/_partials/functions/build_links.html`: see below.

`layouts/_partials/functions/build_links.html` is a copy of the theme file without the line
`{{ $seen.Set "set" (dict) }}`, which fails on Hugo 0.161+ ("assignment to entry in nil map").
Delete the override once the upstream `blox` module fixes it (check after `hugo mod get -u`).

### Blog drafts

`content/research/blog/` (if present) holds non-technical explainer drafts marked `draft: true`; they are never published or linked.

### Claude skills and agents

This repo is managed from the parent folder `profile_documents/` (see `../CLAUDE.md`). Its skills and
agents live in `../.claude/`: `/review-website` (proofreading + EN/ES sync), `/draft-blog`, `/edit-blog`,
`/edit-file` (bracket and TODO notes), and `/sync-repo` for pushing. Facts about César come from
`../document_generation/experience_master/`; run Claude from `profile_documents/` so those skills load.

Quality reports from these skills are stored in `quality_reports/`.
