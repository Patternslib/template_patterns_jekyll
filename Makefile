SASS        ?= bundle


# Add help text after each target name starting with ' \#\# '
help:
	@grep " ## " $(MAKEFILE_LIST) | grep -v MAKEFILE_LIST | sed 's/\([^:]*\).*##/\1    /'

patternslib::  ## Get patternslib and build it
	@if [ ! -d "patternslib" ]; then \
		git clone https://github.com/Patternslib/Patterns.git patternslib; \
		cd patternslib && npm install && ./node_modules/.bin/bower update && cd ..; \
	 fi;

bundle patternslib/bundle.js:  ## update the patternslib js bundle
	@cd patternslib && make bundle && cd ..;
		
jekyll-serve::  ## run jekyll, serve and watch
	bundle exec jekyll serve --watch

jekyll-serve-blank::  ## run jekyll, serve and watch (ignoring the baseurl and host settings)
	bundle exec jekyll serve  --baseurl "" --host "0.0.0.0" --watch

designerhappy:: patternslib bundle serve-designer  ## make the designer happy by running all together

.PHONY: serve designerhappy clean
