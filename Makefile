
.PHONY=install

install: fmdiff fmdiff3
	install fmdiff /usr/local/bin/fmdiff
	install fmdiff3 /usr/local/bin/fmdiff3
