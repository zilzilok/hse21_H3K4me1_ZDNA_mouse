source('lib.R')

###

#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")
#BiocManager::install("ChIPseeker")
#BiocManager::install("clusterProfiler")
#BiocManager::install("org.Mm.eg.db")

library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(ChIPseeker)
library(clusterProfiler)
library(org.Mm.eg.db)

###

#NAME <- 'mouseZ-DNA1'
#NAME <- 'H3K4me1_ES-E14.ENCFF147SYC.mm10.filtered'
#NAME <- 'H3K4me1_ES-E14.ENCFF158GBZ.mm10.filtered'
NAME <- 'H3K4me1_ES-E14.intersect_with_mouseZ-DNA1'

OUT_DIR <- '../results/chip_seeker/'
DATA_DIR <- '../data/'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Mm.eg.db")

pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

peak <- readPeakFile(BED_FN)
pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
covplot(peak, weightCol="V5")
dev.off()