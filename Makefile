PREFIX = /usr/local

CDEBUGFLAGS = -Os -g -Wall

DEFINES = $(PLATFORM_DEFINES)

CFLAGS = $(CDEBUGFLAGS) $(DEFINES) $(EXTRA_DEFINES)

all: generate-ipv6-address

generate-ipv6-address: generate-ipv6-address.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o generate-ipv6-address generate-ipv6-address.o $(LDLIBS)

.SUFFIXES: .man .html

.man.html:
	rman -f html $< | \
	sed -e "s|<a href='babel.8'|<a href=\"../babel/babel.html\"|" \
            -e "s|<a href='\\(ahcp[-a-z]*\\).8'|<a href=\"\1.html\"|" \
	    -e "s|<a href='[^']*8'>\\(.*(8)\\)</a>|\1|" \
	> $@

generate-ipv6-address.html: generate-ipv6-address.man

.PHONY: install.minimal install

install.minimal: all
	mkdir -p $(TARGET)$(PREFIX)/bin/
	-rm -f $(TARGET)$(PREFIX)/bin/generate-ipv6-address
	cp generate-ipv6-address $(TARGET)$(PREFIX)/bin/
	chmod +x $(TARGET)$(PREFIX)/bin/generate-ipv6-address

install: all install.minimal
	mkdir -p $(TARGET)$(PREFIX)/man/man8/
	cp -f generate-ipv6-address.man $(TARGET)$(PREFIX)/man/man8/generate-ipv6-address.8

.PHONY: uninstall

uninstall:
	-rm -f $(TARGET)$(PREFIX)/bin/generate-ipv6-address
	-rm -f $(TARGET)$(PREFIX)/man/man8/generate-ipv6-address.8

.PHONY: clean

clean:
	-rm -f generate-ipv6-address
	-rm -f *.o *~ core TAGS gmon.out
	-rm -f generate-ipv6-address.html
