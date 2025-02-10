SHELL := /bin/bash

all: build index

build:
	make ips/*.txt

index:
	for f in $$(ls *.html); do \
	  echo "<li><a href=\"$$f\">$$f</a></li>"; \
	done > index.html

# ips -> Interpolated Prompts
ips/%.txt: FORCE ips/template.html
	@content=$$(cat ips/template.html); \
	before=$${content%%__QUIP__*}; \
	after=$${content##*__QUIP__}; \
	echo "$$before$$(cat $@)$$after" > $*.html

FORCE:
