source('lib.R')

###

NAME <- 'mouseZ-DNA1'
#NAME <- 'H3K4me1_ES-E14.ENCFF147SYC.mm10'
#NAME <- 'H3K4me1_ES-E14.ENCFF158GBZ.mm10'

DATA_DIR <- '../data/'
OUT_DIR <- '../results/len_hist/'

###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)
