# Makefile to create documentation
# Patrick Ben Koetter, p@sys4.de
#
# Copyright (C) 2015, sys4 AG
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

SHELL = /bin/sh
SOURCES = loganon.1.txt

# Substitutions
# HTMLS= $(patsubst %.txt,%.html,$(SOURCES))
MANS= $(patsubst %.txt,%.man,$(SOURCES))

# Build Targets
all:	man
#html:	$(HTMLS)
man:	$(MANS)

# Build commands
%.html: %.txt
	asciidoc -b html5 $<

%.man: %.txt
	a2x --doctype manpage --format manpage $<

# Defaults
.PHONY:	clean

clean:	
	rm -f *.html *.1 *.5 *.8

