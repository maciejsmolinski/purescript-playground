install:
	@npm install -g purescript pulp pscid chokidar-cli

watch:
	@chokidar src/*.purs -c 'pulp run'

.PHONY: install watch
