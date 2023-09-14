.POSIX:

OS = $(shell uname -s)
ifndef PREFIX
  PREFIX = /usr/local
endif
ifndef MANPREFIX
  MANPREFIX = $(PREFIX)/man
endif


install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	sh build.sh
	cp -f ./bin/mcbash $(DESTDIR)$(PREFIX)/bin/
	chmod 755 $(DESTDIR)$(PREFIX)/bin/mcbash
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f mcbash.1 $(DESTDIR)$(MANPREFIX)/man1/mcbash.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/mcbash.1
	cp -f mcbash.conf /etc/mcbash.conf; \
	chmod 644 /etc/mcbash.conf; \
	for users in /home/*; do \
		if mkdir -p /$$users/.config/mcbash; then \
			cp -f mcbash.conf /$$users/.config/mcbash/mcbash.conf; \
			chmod 777 /$$users/.config/mcbash/mcbash.conf; \
		fi;\
	done

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/mcbash
	rm -rf $(DESTDIR)$(PREFIX)/share/mcbash
	rm -f $(DESTDIR)$(MANPREFIX)/man1/mcbash.1

.PHONY: install uninstall
