# alexcbblog

A bilingual personal blog and scientific website built with two independent
[Quarto](https://quarto.org/) website projects.

- `en/` contains the English site.
- `es/` contains the Spanish site.
- `shared/` contains shared styling and language-switch behavior.
- `landing/` contains the root language chooser.
- `scripts/build-site.sh` assembles the complete static site in `_site/`.

## Prerequisites

Install Quarto. No Python, R, Julia, or Node dependencies are currently needed.

## Local development

Preview either language independently:

```bash
quarto preview en
quarto preview es
```

Build the complete bilingual site:

```bash
./scripts/build-site.sh
```

To inspect it locally:

```bash
python3 -m http.server 8000 --directory _site
```

Then open `http://localhost:8000/`.

## Writing posts

Put English posts under `en/posts/` and Spanish posts under `es/posts/`. A
translated pair must use the same directory slug in both trees so the language
switch can preserve the current page. For example:

```text
en/posts/2026-08-30-macos-to-omarchy/index.qmd
es/posts/2026-08-30-macos-to-omarchy/index.qmd
```

Executable posts may use Python, R, or Julia later. `freeze: auto` lets Quarto
reuse committed `_freeze` results rather than rerunning expensive computations
on every deployment.

## Deployment

Pushes to `main` run `.github/workflows/pages.yml`, build both projects, and
deploy `_site/` with GitHub Pages Actions. In the repository, select:

```text
Settings → Pages → Build and deployment → Source → GitHub Actions
```

No `gh-pages` branch is used.
