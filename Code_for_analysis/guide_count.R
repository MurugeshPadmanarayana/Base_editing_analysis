# Once we have a indexed reference file, now we can align the fastq file using subjunc algorithm from Rsubread package in R. 
# arguments include processed_fastq_file, indexed_reference_file, gene_name, total no of guides;  Output includes read frequency and also count table if any guides are missing:
guide_count <- function(fastq_file, indexed_file, gene_name, total_guides){
  align(indexed_file, fastq_file, output_file = gsub(".fastq.gz", ".bam", fastq_file))
  aligned_reads <- readGAlignments(gsub(".fastq.gz", ".bam", fastq_file))
  aligned_reads <- as.data.frame(aligned_reads)
  write.xlsx(aligned_reads, "aligned_reads.xlsx")
  read_frequency <- table(aligned_reads$seqnames)
  read_frequency <- as.data.frame(read_frequency)
  colnames(read_frequency) <- c("ids", "frequency")
  read_frequency <- read_frequency %>% mutate(gene = rep(gene_name,total_guides))
  read_frequency <- read_frequency %>% mutate(category = ifelse(frequency == 0, "No", "Yes"))
  counts_table <- read_frequency %>% group_by(category) %>% summarize(n = n()) %>% data.frame()
  write.xlsx(read_frequency, "final_read_counts.xlsx")
  write.xlsx(counts_table, "guide_count_table.xlsx")
  
}