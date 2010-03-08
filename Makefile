##

CONFD=$(wildcard conf.d/*.el)
SITELISP=site-lisp

all: byte-recompile autoloads conf.el 

conf.el: $(CONFD)
	@echo ">>> Recaching configuration..."
	@cat $^ > $@

byte-recompile:
	@echo ">>> Byte-compiling..."
	@emacs --batch --script base.el --eval '(user-byte-recompile)' --kill

autoloads:
	@echo ">>> Updating autoloads..."
	@emacs --batch --script base.el --eval '(user-update-autoloads)' --kill
	@$(RM) autoloads.el~

.PHONY: byte-recompile autoloads
