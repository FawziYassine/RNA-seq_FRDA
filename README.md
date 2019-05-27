# Bioinformatic analysis of RNA-seq data to find Differentially Expressed Genes (DEGs) between Friedreich's Ataxia (FRDA) patients and unaffected individuals (re-analyis)


In this project I report the bioinformatic analysis of RNA-seq data collected from 35 individuals (18 FRDA and 17 unaffected controls) to find DEGs between FRDA patients and unaffected individuals. The RNA sequencing experiment was conducted in ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)).
Actually, the authors in ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)) have conducted bioinformatic analysis of RNA-seq data they had collected. 

However, I have used a **pipeline of analysis tools** and a **Reference Genome** that  are newer than the ones that they have used. 

I have used:

* [hg38](https://genome.ucsc.edu/cgi-bin/hgTables?hgsid=709643787_uDDcng0XNxj8vtnLm1SAaz9BwRky&clade=mammal&org=&db=hg38&hgta_group=genes&hgta_track=refSeqComposite&hgta_table=ncbiRefSeq&hgta_regionType=genome&position=&hgta_outputType=primaryTable&hgta_outFileName=) Reference Genome.

*  Pipeline:
   1. [HISAT2 (version 2.1.0)](http://ccb.jhu.edu/software/hisat2/dl/hisat2-2.1.0-Linux_x86_64.zip) for aligning sequencing reads to the reference genome.
   2. [HTSeq (version 0.11.1)](https://htseq.readthedocs.io/en/release_0.11.1/) for counting how many sequencing reads overlap each gene.
   3. [DESeq2 (version 1.22.2)](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) for differential expression analysis.

Whereas, the authors in ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)) have used:

* hg19 Reference Genome.

* Pipeline:
   1. TopHat (version 2.0.7) for aligning sequencing reads to the reference genome.
   2. HTSeq (version 0.5.3) for counting how many sequencing reads overlap each gene.
   3. DESeq2 (version 1.10.1) for differential expression analysis.

In my bioinformatic analysis, other than using newer tools and reference genome, I have implemented the bioinformatic analysis specifications mentioned in (Napierala et al., 2017) as closely as possible.

