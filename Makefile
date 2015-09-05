REPORTER = spec
test:
	@echo TRAVIS_JOB_ID $(TRAVIS_JOB_ID)
	@NODE_ENV=test ./node_modules/.bin/mocha -b --reporter --compilers js:babel/register --recursive $(REPORTER)

test-cov:
	$(MAKE) lint
	@NODE_ENV=test ./node_modules/.bin/istanbul cover \
	./node_modules/mocha/bin/_mocha -- -R spec

test-coveralls:
	@NODE_ENV=test ./node_modules/.bin/istanbul cover \
	./node_modules/mocha/bin/_mocha --report lcovonly -- -R spec && \
		cat ./coverage/lcov.info | ./bin/coveralls.js --verbose

.PHONY: test
