# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A Hugo-based personal academic website for César Garro-Marín ([cesargarromarin.com](https://www.cesargarromarin.com/)), built on the [Wowchemy](https://wowchemy.com/) v5 theme. Deployed on Netlify. Supports English (default) and Spanish.

## Commands

```bash
# Local development server
hugo server

# Production build (matches Netlify)
hugo --gc --minify

# Build with future-dated content (matches Netlify deploy previews)
hugo --gc --minify --buildFuture
```

Hugo version: **0.120.4** (pinned in `netlify.toml`).

## Architecture

### Content and bilingual structure

All content lives in `content/`. Spanish versions use the `.es.md` suffix alongside the English original (e.g., `_index.md` / `_index.es.md`). English is always the authoritative master; Spanish files mirror the same frontmatter fields and structure.

Key content files:
- `content/_index.md` — homepage (landing page with avatar, welcome text, news sections)
- `content/research/_index.md` — research page (publications, working papers, work in progress)
- `content/teaching/_index.md` — teaching page
- `content/authors/admin/_index.md` — profile data (name, role, social links)

### Research page pattern

The research page (`content/research/_index.md`) is written as raw HTML embedded in Markdown. Each paper uses a `<div class="media stream-item">` block with:
- An anchor `id` on the title div (used for deep links from the homepage news section)
- A `showHideText(id)` onclick button to toggle abstract visibility
- Abstract in a `<p>` with `style="display: none"` (the `.hidden` class is set via `<head>` inline styles at the top of the file)

### Configuration layout

Config is split across `config/_default/`:
- `config.yaml` — languages, modules, Hugo settings
- `params.yaml` — appearance (theme, font), header/footer, feature toggles
- `menus.yaml` / `menus.es.yaml` — navigation links per language

Custom color theme: `data/themes/custom.toml`.

### GitHub agents and skills

`.github/agents/bilingual-content-auditor.agent.md` — an agent that audits bilingual content quality and sync without modifying files.

`.github/skills/` — two skills:
- `proofread` — runs proofreading and saves reports to `quality_reports/`
- `bilingual-sync` — checks EN/ES document synchronization

Quality reports from these skills are stored in `quality_reports/`.
