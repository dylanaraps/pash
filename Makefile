PREFIX ?= /usr

all:
	@echo Run \'make install\' to install pash.

install:
	@install -Dm755 pash $(DESTDIR)$(PREFIX)/bin/pash

uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/pash
