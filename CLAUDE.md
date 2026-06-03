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

### Homepage vs research page structure

The **homepage** (`content/_index.md`) uses Wowchemy's block system: content is declared as a `sections:` list in the YAML frontmatter, each entry being a named block type (e.g., `block: about.avatar`, `block: markdown`). No raw HTML.

The **research page** (`content/research/_index.md`) is written as raw HTML embedded in Markdown — a deliberate workaround because Wowchemy's standard publication blocks didn't meet the design requirements. Each paper uses a `<div class="media stream-item">` block with:
- An anchor `id` on the title div (used for deep links from the homepage news section)
- A `showHideText(id)` onclick button to toggle abstract visibility
- Abstract in a `<p>` with `style="display: none"` (the `.hidden` class is set via `<head>` inline styles at the top of the file)
- A paper image from `content/research/images/`; images come in pairs — a default and a `_blue.png` variant (the blue variant is the one linked in the HTML)

### Configuration layout

Config is split across `config/_default/`:
- `config.yaml` — languages, modules, Hugo settings
- `params.yaml` — appearance (theme, font), header/footer, feature toggles
- `menus.yaml` / `menus.es.yaml` — navigation links per language

Custom color theme: `data/themes/custom.toml`.

### Blog posts

`content/research/blog/` contains non-technical explainers for each paper (one `.md` per paper). All are marked `draft: true` and are never published. They exist as reference material and are not linked from anywhere on the site.

### GitHub agents and skills

`.github/agents/bilingual-content-auditor.agent.md` — audits bilingual content quality and EN/ES sync; read-only, never edits files.

`.github/agents/proofreader.md` — sub-agent invoked by the `proofread` skill to review a single file for grammar, typos, and consistency.

`.claude/skills/` — five skills (invoke via `/skill-name`):
- `proofread [filename|all]` — runs proofreading and saves reports to `quality_reports/`
- `bilingual-sync [base_name]` — checks EN/ES synchronization for a given content file
- `plan-work [start-of-day|end-of-day|review]` — manages `workplan.md` in the repo root as a daily task tracker
- `draft-blog <paper-id>` — drafts a VoxEU-style general-audience blog post for a paper; `paper-id` is the anchor ID from `content/research/_index.md` (e.g., `akm`, `amenities`, `idn-secondary`)
- `edit-blog <filename>` — reviews a blog post in `content/research/blog/` and suggests revisions for clarity, grammar, flow, and VoxEU audience alignment; never edits the file directly

Quality reports from these skills are stored in `quality_reports/`.
