DOXYGEN := doxygen

NAMES := armlib
NAMES += dbglib
NAMES += fxplib
NAMES += hdrlib
NAMES += stdlib
NAMES += s5l8930lib
NAMES += system
NAMES += bkptmod
NAMES += sdwmod 

DOCUMENTSDIR := ../documents

CP := cp

DOXYFILES := $(patsubst %,%.doxyfile,$(NAMES))
PDFFILES := $(patsubst %,$(DOCUMENTSDIR)/%.pdf,$(NAMES))


all:
	$(MAKE) -s clean
	$(MAKE) -s build
	
build: $(PDFFILES)

clean:
	rm -rf *lib
	rm -rf *mod
	rm -rf system
	rm -rf *~
	rm -f $(DOCUMENTSDIR)/*lib.pdf
	rm -f $(DOCUMENTSDIR)/system.pdf
	rm -f $(DOCUMENTSDIR)/*mod.pdf
	

$(DOCUMENTSDIR)/%.pdf: %.doxyfile
	echo "$<"
	$(DOXYGEN) $< > /dev/null
	$(MAKE) --directory $(subst .doxyfile,,$<)/latex > /dev/null
	$(CP) $(subst .doxyfile,,$<)/latex/refman.pdf $@ > /dev/null

	