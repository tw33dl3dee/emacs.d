##

CONFD=$(wildcard conf.d/*.el)
SITELISP=site-lisp

all: byte-recompile conf.el 

conf.el: $(CONFD)
	@echo ">>> Recaching configuration..."
	@cat $^ > $@

byte-recompile:
	@echo ">>> Byte-compiling..."
	@emacs --batch --eval '(byte-recompile-directory "$(SITELISP)")' --kill

.PHONY: byte-recompile
