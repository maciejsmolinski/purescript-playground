install-globals:
	@npm install -g purescript pulp pscid bower minify

install-local:
	@bower install && npm install --no-progress

install: install-globals install-local

watch:
	@pulp --watch browserify --optimise --to dest/main.js

build:
	@pulp browserify --optimise --to dest/main.js

release: build
	@minify dest/main.js > dest/main.min.js && mv dest/main.min.js dest/main.js

.PHONY: install install-globals install-local watch build release
