PREFIX ?= /usr
DOCDIR ?= $(PREFIX)/share/doc/pash

all:
	@echo Run \'make install\' to install pash.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(DOCDIR)
	@cp -p pash $(DESTDIR)$(PREFIX)/bin/pash
	@cp -p README.md $(DESTDIR)$(DOCDIR)
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/pash

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/pash
	@rm -rf $(DESTDIR)$(DOCDIR)
