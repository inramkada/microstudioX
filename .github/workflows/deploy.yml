name: Deploy (Hakyll)

on:
  push:
    branches: [ "main" ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Haskell (GHC + Stack)
        uses: haskell-actions/setup@v2
        with:
          enable-stack: true
          stack-version: "latest"

      - name: Cache Stack
        uses: actions/cache@v4
        with:
          path: |
            ~/.stack
            .stack-work
          key: ${{ runner.os }}-stack-${{ hashFiles('stack.yaml', 'package.yaml', 'site.hs') }}

      - name: Build site generator
        run: stack build --no-terminal

      - name: Build static site
        run: stack exec site build

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: _site

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
