
.PHONY=install

install: fmdiff fmdiff3 fmresolve
	install fmdiff /usr/local/bin/fmdiff
	install fmdiff3 /usr/local/bin/fmdiff3
	install	fmresolve /usr/local/bin/fmresolve
