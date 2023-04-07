all: build

build: draft-ietf-cloud-dnssd-support.html draft-ietf-cloud-dnssd-support.txt

draft-ietf-cloud-dnssd-support-compiled.md: draft-ietf-cloud-dnssd-support.md draft-ietf-cloud-dnssd-support.json
	@echo Converting from .md to -compiled.md
	cp draft-ietf-cloud-dnssd-support.md draft-ietf-cloud-dnssd-support-compiled.md

draft-ietf-cloud-dnssd-support.xml:	draft-ietf-cloud-dnssd-support-compiled.md
	@echo Converting from -compiled.md to .xml
	kramdown-rfc2629 $< > $@

draft-ietf-cloud-dnssd-support.html: draft-ietf-cloud-dnssd-support.xml
	@echo Converting from .xml to .html
	xml2rfc --html $<

draft-ietf-cloud-dnssd-support.txt: draft-ietf-cloud-dnssd-support.xml
	@echo Converting from .xml to .txt
	xml2rfc $<

clean:
	rm -rf *.xml *.txt *.html *-compiled.md .refcache

prereqs-fedora:
	sudo dnf install xml2rfc
