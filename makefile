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
	
derived_data/cleaned_data.csv: cleaned_data2.csv cleaned_data.R
	Rscript cleaned_data.R
derived_data/pca_plot_data.csv: derived_data/cleaned_data.csv pca_plot_data.R
	Rscript pca_plot_data.R
derived_data/pca_scores.csv: derived_data/cleaned_data.csv pca_scores.R
	Rscript pca_scores.R
figures/biplot.png: derived_data/cleaned_data.csv biplot.R
	Rscript biplot.R
figures/PC1vsPC2.png: derived_data/pca_plot_data.csv PC1vsPC2.R
	Rscript PC1vsPC2.R
figures/PC1vsPC3.png: derived_data/pca_plot_data.csv PC1vsPC3.R
	Rscript PC1vsPC3.R
figures/PC2vsPC3.png: derived_data/pca_plot_data.csv PC2vsPC3.R
	Rscript PC2vsPC3.R
derived_data/reduced_data.csv: derived_data/cleaned_data.csv reduced_data.R
	Rscript reduced_data.R
figures/K-means.png: derived_data/reduced_data.csv K-means.R
	Rscript K-means.R

BIOS611.html: BIOS611.Rmd
	R -e "rmarkdown::render('BIOS611PR.Rmd', output_format='html_document')"