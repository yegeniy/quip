SHELL: /bin/bash

## <nbdev>
init:
	brew install nbdev
	nbdev_install_hooks

all: build

build:
	for f in *.ipynb; do nbdev_export $f quip; done
## </nbdev>


# Interpolated Prompts
ips/%.txt: FORCE template.html
	@content=$$(cat template.html); \
	before=$${content%%__QUIP__*}; \
	after=$${content##*__QUIP__}; \
	echo "$$before$$(cat $@)$$after" > $*

FORCE: