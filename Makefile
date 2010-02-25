
.PHONY: install

DESTDIR=/usr/local/bin

install: fmdiff fmdiff3 fmresolve fmmerge
	install -d $(DESTDIR)
	install fmdiff $(DESTDIR)/fmdiff
	install fmdiff3 $(DESTDIR)/fmdiff3
	install	fmresolve $(DESTDIR)/fmresolve
	install fmmerge $(DESTDIR)/fmmerge
