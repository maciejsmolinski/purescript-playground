install-globals:
	@npm install -g purescript pulp pscid chokidar-cli bower

install-local:
	bower install purescript-maybe

install: install-globals install-local

watch:
	@chokidar src/*.purs -c 'clear && pulp run'

.PHONY: install install-globals install-local watch
