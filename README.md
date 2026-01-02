# MicrostudioX (Hakyll)

This repo builds a static site using **Hakyll** (Haskell) and deploys to **GitHub Pages** via GitHub Actions.

## Local run

```bash
stack build
stack exec site build
stack exec site watch
```

Then open: http://127.0.0.1:8000

## Deploy (GitHub Pages)

Push to `main`. The workflow builds `_site/` and deploys it to GitHub Pages.

### Custom domain
Set in **Repo Settings → Pages → Custom domain**:
`www.microstudiox.com`

A `CNAME` file is included (edit if needed).
