# iskovpin.ru

[![Netlify Status](https://api.netlify.com/api/v1/badges/18857aed-f64f-40df-b882-26cdc39ed39a/deploy-status)](https://app.netlify.com/sites/iskovpin/deploys)

Personal static website, powered by HUGO and based on hugo-coder theme.

## Local development

Requires Hugo 0.170.1 or later and [Dart Sass](https://gohugo.io/functions/css/sass/#dart-sass).
On macOS, with Homebrew and Node.js/npm installed:

```sh
brew install hugo
npm install --global sass-embedded@1.108.2
```

Initialize the theme submodule after cloning, then start the development server:

```sh
make init
make serve
```

Open <http://localhost:1313/>. Build the production site into `public/` with:

```sh
make build
```

Run `make` to list the available commands:

| Command | Purpose |
| --- | --- |
| `make init` | Initialize the theme submodule. |
| `make serve` | Start the development server with live reload. |
| `make drafts` | Start the server including draft content. |
| `make build` | Build and minify the production site into `public/`. |
| `make check` | Build the site and fail on warnings. |
| `make clean` | Remove `public/`, `resources/_gen/`, and `.hugo_build.lock`. |

Use `make serve PORT=1314` to change the port, or pass extra Hugo flags with
`HUGO_ARGS`, for example `make drafts HUGO_ARGS="--buildFuture"`.

The templates in `layouts/_default/` and `layouts/partials/` override the pinned
hugo-coder theme to support current Hugo APIs.

## Netlify

The root `netlify.toml` pins Hugo and Node.js to the tested versions and publishes
`public/`. Its build command uses `npm exec` to install Dart Sass 1.108.2 for the
build, then runs `make build` with warnings treated as errors.

These file-based settings override the corresponding settings in the Netlify UI.
Commit and push `netlify.toml` to apply them to the next deploy.
