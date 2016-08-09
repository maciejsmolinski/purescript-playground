install-globals:
	@npm install -g purescript pulp pscid bower minify

install-local:
	@bower install && npm install --no-progress

install: install-globals install-local

watch:
	@pulp --watch build --to dest/main.min.js

build:
	@pulp browserify --optimise --to dest/main.js && minify dest/main.js > dest/main.min.js

.PHONY: install install-globals install-local watch build
