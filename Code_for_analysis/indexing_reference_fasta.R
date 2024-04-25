# Index_reference file (guideRNAs of a specific library) to align your fastq.gz file to get
# frequency_count of each guideRNA of the library. 


index_reference_fasta <- function(reference_fasta){
  buildindex(gsub(".fa", "_indexed", reference_fasta), reference_fasta)
}

# index_reference_fasta("hsb90b1.fa")