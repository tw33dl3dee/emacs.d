##

CONFD=$(sort $(wildcard conf.d/*.el))
SITELISP=site-lisp
PRELOAD=base.el

all: byte-recompile autoloads conf.el 

conf.el: conf.d $(CONFD)
	@echo ">>> Recaching configuration..."
	@cat $(CONFD) > $@

byte-recompile:
	@echo ">>> Byte-compiling..."
	@emacs --batch --script $(PRELOAD) --eval '(user-byte-recompile)' --kill

autoloads:
	@echo ">>> Updating autoloads..."
	@emacs --batch --script $(PRELOAD) --eval '(user-update-autoloads)' --kill
	@$(RM) autoloads.el~

.PHONY: byte-recompile autoloads
