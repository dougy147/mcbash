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
	for script in bin/*; do \
		cp -f $$script $(DESTDIR)$(PREFIX)/bin/; \
		chmod 755 $(DESTDIR)$(PREFIX)/$$script; \
	done
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f mcbash.1 $(DESTDIR)$(MANPREFIX)/man1/mcbash.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/mcbash.1
	for users in /home/*; do \
		if [ ! test -w $$users ];then \
			continue; \
		fi; \
		mkdir -p /$$users/.mcbash; \
		cp -f mcbash.conf /$$users/.mcbash/mcbash.conf; \
		chmod 777 /$$users/.mcbash/mcbash.conf ; \
	done

uninstall:
	for script in bin/*; do \
		rm -f $(DESTDIR)$(PREFIX)/$$script; \
	done
	rm -rf $(DESTDIR)$(PREFIX)/share/mcbash
	rm -f $(DESTDIR)$(MANPREFIX)/man1/mcbash.1

.PHONY: install uninstall
