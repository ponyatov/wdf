# var
MODULE  = $(notdir $(CURDIR))

# tool
CURL = curl -L -o
DC   = dmd
RUN  = dub run   --compiler=$(DC)
BLD  = dub build --compiler=$(DC)

# src
D += $(wildcard src/*.d*)

# all
.PHONY: all run
all: bin/$(MODULE)
bin/$(MODULE): $(D) dub.json
	$(BLD)

run: $(D) dub.json
	$(RUN)

# format
.PHONY: format
format: tmp/format_d
tmp/format_d: $(D)
	$(RUN) dfmt -- -i $? && touch $@

# doc
.PHONY: doc
doc: doc/yazyk_programmirovaniya_d.pdf doc/Programming_in_D.pdf \
	 doc/d-readthedocs-io-en-latest.pdf doc/BuildWebAppsinVibe.pdf

doc/yazyk_programmirovaniya_d.pdf:
	$(CURL) $@ https://www.k0d.cc/storage/books/D/yazyk_programmirovaniya_d.pdf
doc/Programming_in_D.pdf:
	$(CURL) $@ http://ddili.org/ders/d.en/Programming_in_D.pdf
doc/d-readthedocs-io-en-latest.pdf:
	$(CURL) $@ https://github.com/ponyatov/D/releases/download/071023-5009/d-readthedocs-io-en-latest.pdf
doc/BuildWebAppsinVibe.pdf:
	$(CURL) $@ https://raw.githubusercontent.com/reyvaleza/vibed/main/BuildWebAppsinVibe.pdf

