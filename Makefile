install-globals:
	@npm install -g purescript pulp pscid chokidar-cli bower minify

install-local:
	@bower install purescript-maybe purescript-random

install: install-globals install-local

build:
	@pulp browserify --to dest/main.js && minify dest/main.js > dest/main.min.js

watch:
	@chokidar src/*.purs src/**/*.purs -c 'clear && pulp run'

.PHONY: install install-globals install-local watch build
