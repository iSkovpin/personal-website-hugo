HUGO ?= hugo
HUGO_ARGS ?=
PORT ?= 1313

.DEFAULT_GOAL := help
.PHONY: help init serve drafts build check clean

help:
	@printf '%s\n' \
	  'make init    Initialize the theme submodule' \
	  'make serve   Start the development server (localhost:1313)' \
	  'make drafts  Start the server with draft content' \
	  'make build   Build the production site into public/' \
	  'make check   Build and fail on warnings' \
	  'make clean   Remove generated output, asset cache, and build lock' \
	  '' \
	  'Options: PORT=1314, HUGO=/path/to/hugo, HUGO_ARGS="--buildFuture"'

init:
	git submodule update --init --recursive

serve:
	$(HUGO) server --port $(PORT) --disableFastRender $(HUGO_ARGS)

drafts:
	$(HUGO) server --port $(PORT) --disableFastRender --buildDrafts $(HUGO_ARGS)

build:
	$(HUGO) --minify $(HUGO_ARGS)

check:
	$(HUGO) --panicOnWarning $(HUGO_ARGS)

clean:
	rm -rf -- public resources/_gen .hugo_build.lock
