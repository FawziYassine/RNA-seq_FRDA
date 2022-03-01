# Bioinformatic analysis of RNA-seq data to find Differentially Expressed Genes (DEGs) between Friedreich's Ataxia (FRDA) Patients and Unaffected Individuals

In this project I report the bioinformatic analysis of RNA-seq data collected by ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)) from 35 individuals (18 FRDA and 17 unaffected individuals) to find DEGs between FRDA patients and unaffected individuals. I have used an [AWS Linux instance](https://aws.amazon.com/amazon-linux-ami/) for running the analysis. Instructions for the analysis can be found at [analysis_instructions.md](analysis_instructions.md).

---
Analysis Instructions are provided [here](analysis_instructions.md).
---

---
You might want to visit the [Bioinformatics Analysis Results](Results.md) page next.
---

P.S: The RNA sequencing experiment was conducted in ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)). Moreover, the authors in ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)) have conducted the analysis of RNA-seq data they had collected. However, I have used a **pipeline of analysis tools** and a **Reference Genome** that are newer than those used by ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)).  
I have used:
* [hg38](https://genome.ucsc.edu/cgi-bin/hgTables?hgsid=709643787_uDDcng0XNxj8vtnLm1SAaz9BwRky&clade=mammal&org=&db=hg38&hgta_group=genes&hgta_track=refSeqComposite&hgta_table=ncbiRefSeq&hgta_regionType=genome&position=&hgta_outputType=primaryTable&hgta_outFileName=) Reference Genome.
* Pipeline:
   1. [HISAT2 (version 2.1.0)](http://ccb.jhu.edu/software/hisat2/dl/hisat2-2.1.0-Linux_x86_64.zip) for aligning the sequencing reads to the reference genome.
   2. [HTSeq (version 0.11.1)](https://htseq.readthedocs.io/en/release_0.11.1/) for counting how many sequencing reads overlap each gene.
   3. [DESeq2 (version 1.22.2)](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) for differential expression analysis.  
Whereas, the authors in ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)) have used:
* hg19 Reference Genome.
* Pipeline:
   1. TopHat (version 2.0.7) for aligning sequencing reads to the reference genome.
   2. HTSeq (version 0.5.3) for counting how many sequencing reads overlap each gene.
   3. DESeq2 (version 1.10.1) for differential expression analysis.

# References:

- Napierala, J. S., Li, Y., Lu, Y., Lin, K., Hauser, L. A., Lynch, D. R., & Napierala, M. (2017). Comprehensive analysis of gene expression patterns in Friedreich’s ataxia fibroblasts by RNA sequencing reveals altered levels of protein synthesis factors and solute carriers. Disease Models & Mechanisms, 10(11), 1353–1369. https://doi.org/10.1242/dmm.030536
