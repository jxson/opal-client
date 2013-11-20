
VERSION = patch
MODULE_BIN = node_modules/.bin
MOCHA = $(MODULE_BIN)/mocha

clean:
	@$(RM) -fr node_modules
	@$(RM) -fr npm-debug.log

test: node_modules
	@$(MOCHA) tests/test-*.js

node_modules: package.json
	@npm prune
	@npm install

release:
	npm version $(VERSION)
	git push && git push --tags
	npm publish

.PHONY: release clean test
