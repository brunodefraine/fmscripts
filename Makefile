
.PHONY: install

FMS= \
	/Developer/Applications/Utilities/FileMerge.app/Contents/MacOS/FileMerge \
	/Applications/Xcode.app/Contents/Applications/FileMerge.app/Contents/MacOS/FileMerge

DESTDIR=/usr/local/bin

filemerge:
	$(foreach FM,$(FMS),{ test -x $(FM) && ln -s $(FM) filemerge; } ||) false

install: filemerge fmdiff fmdiff3 fmresolve fmmerge
	install -d $(DESTDIR)
	ln -sf $$(readlink filemerge) $(DESTDIR)/filemerge
	install fmdiff $(DESTDIR)/fmdiff
	install fmdiff3 $(DESTDIR)/fmdiff3
	install	fmresolve $(DESTDIR)/fmresolve
	install fmmerge $(DESTDIR)/fmmerge
