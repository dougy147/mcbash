.POSIX:

ifndef PREFIX
  PREFIX = /usr/local
endif

ifndef MANPREFIX
  MANPREFIX = $(PREFIX)/man
endif

.PHONY: install uninstall build

build:
	bash build.sh

install: build
	sudo mkdir -p $(DESTDIR)$(PREFIX)/bin
	sudo cp -f ./bin/mcbash $(DESTDIR)$(PREFIX)/bin/
	sudo chmod 755 $(DESTDIR)$(PREFIX)/bin/mcbash
	sudo mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sudo cp -f mcbash.1 $(DESTDIR)$(MANPREFIX)/man1/mcbash.1
	sudo chmod 644 $(DESTDIR)$(MANPREFIX)/man1/mcbash.1
	sudo cp -f mcbash.conf /etc/mcbash.conf
	sudo chmod 644 /etc/mcbash.conf

	mkdir -p $${HOME}/.config/mcbash
	cp -f mcbash.conf $${HOME}/.config/mcbash/mcbash.conf
	chmod 777 $${HOME}/.config/mcbash/mcbash.conf

uninstall:
	sudo rm -f $(DESTDIR)$(PREFIX)/bin/mcbash
	sudo rm -rf $(DESTDIR)$(PREFIX)/share/mcbash
	sudo rm -f $(DESTDIR)$(MANPREFIX)/man1/mcbash.1
