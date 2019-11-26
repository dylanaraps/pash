PREFIX ?= /usr

all:
	@echo Run \'make install\' to install pash \(POSIX sh\).
	@echo Run \'make install-bash\' to install pash \(bash\).

install:
	@install -Dm755 pash $(DESTDIR)$(PREFIX)/bin/pash

install-bash:
	@install -Dm755 pash.bash $(DESTDIR)$(PREFIX)/bin/pash

uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/pash
