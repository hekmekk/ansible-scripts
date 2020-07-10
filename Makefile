prefix :=
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	prefix:=/usr/local
endif
ifeq ($(UNAME_S),Linux)
	prefix:=/usr
endif

exec_prefix := $(prefix)
bindir := $(exec_prefix)/bin
datarootdir := $(prefix)/share
bash_completion_dir := $(datarootdir)/bash-completion/completions
zsh_completion_dir := $(datarootdir)/zsh/site-functions

install:
	mkdir -p $(bindir)
	install -m 755 bin/* $(bindir)/

bash_completion zsh_completion:
	mkdir -p $($@_dir)
	install -m 644 $(@).d/* $($@_dir)/

uninstall:
	rm -f $(bindir)/ansible-{environments,groups,hosts}
	rm -f $(bash_completion_dir)/ansible-{environments,groups,hosts}
	rm -f $(zsh_completion_dir)/_ansible-{environments,groups,hosts}

