# Makefile

# If you change destination of executables, remember to change
# startup script (init.d/sms3) too.
BINDIR=/usr/local/bin
NUMBER_OF_MODEMS=64
MAKEFLAGS=static
LDFLAGS=-static

VERSION=$(shell grep package_version src/version.h | cut -f2)

compile: 
	cd src && $(MAKE) -$(MAKEFLAGS) 

install: compile
	./install.sh $(BINDIR)

uninstall: 
	./uninstall.sh $(BINDIR)

clean:
	cd src && $(MAKE) -$(MAKEFLAGS) clean

package: compile clean
	./package.sh
