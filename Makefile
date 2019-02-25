PREFIX ?= /usr
# MANDIR ?= $(PREFIX)/share/man
DOCDIR ?= $(PREFIX)/share/doc/pash

all:
	@echo Run \'make install\' to install pash.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	# @mkdir -p $(DESTDIR)$(MANDIR)/man1
	@mkdir -p $(DESTDIR)$(DOCDIR)
	@cp -p pash $(DESTDIR)$(PREFIX)/bin/pash
	# @cp -p pash.1 $(DESTDIR)$(MANDIR)/man1
	@cp -p README.md $(DESTDIR)$(DOCDIR)
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/pash

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/pash
	# @rm -rf $(DESTDIR)$(MANDIR)/man1/pash.1
	@rm -rf $(DESTDIR)$(DOCDIR)
