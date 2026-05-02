.POSIX:

ifndef PREFIX
  PREFIX = /usr/local
endif

ifndef MANPREFIX
  MANPREFIX = $(PREFIX)/man
endif

.PHONY: build

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
	if [[ -f $${HOME}/.config/mcbash/mcbash.conf ]]; then                  \
		cp -f mcbash.conf $${HOME}/.config/mcbash/mcbash.conf.new ;        \
		echo "[INFO] You may need to manually update mcbash config file" ; \
		echo "[INFO] A newer version is available here: $${HOME}/.config/mcbash/mcbash.conf.new" ; \
	else                                                                   \
		cp -f mcbash.conf $${HOME}/.config/mcbash/mcbash.conf ;            \
	fi
	chmod 755 $${HOME}/.config/mcbash/mcbash.conf

uninstall:
	sudo rm -f $(DESTDIR)$(PREFIX)/bin/mcbash
	sudo rm -rf $(DESTDIR)$(PREFIX)/share/mcbash
	sudo rm -f $(DESTDIR)$(MANPREFIX)/man1/mcbash.1
