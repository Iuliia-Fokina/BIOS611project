.PHONY: clean
.PHONY: init

init:
	mkdir -p derived_data
	mkdir -p figures
	mkdir -p logs

clean:
	rm -rf derived_data
	rm -rf figures
	mkdir -p derived_data
	mkdir -p figures

BIOS611PR.html: BIOS611PR.Rmd
	R -e "rmarkdown::render('BIOS611PR.Rmd', output_format='html_document')"