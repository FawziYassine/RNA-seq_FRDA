

#!/bin/bash

DATADIR=/home/fawzi/sequencing/projects/RNA-seq_FRDA/data
HISAT2DIR=/home/fawzi/sequencing/projects/RNA-seq_FRDA/hisat2-sorted-bam

date

mkdir -p $HISAT2DIR
rm -f $HISAT2DIR/*

for i in `seq 0 34`
do
	A=$((6078274 + i))
	printf "\n****** Aligning the reads SRR%d to the genome hg38 ...\n\n" $A
	printf "hisat2 -p 8 --rna-strandness RF --dta -x %s/hg38_tran/genome_tran -1 %s/sra/SRR%s_1.fastq -2 %s/sra/SRR%s_2.fastq \
		| samtools sort -@ 8 -o %s/SRR%s.bam\n" $DATADIR $DATADIR $A $DATADIR $A $HISAT2DIR $A
	hisat2 -p 8 --rna-strandness RF --dta -x $DATADIR/hg38_tran/genome_tran -1 $DATADIR/sra/SRR${A}_1.fastq -2 $DATADIR/sra/SRR${A}_2.fastq \
		| samtools sort -@ 8 -n -o $HISAT2DIR/SRR$A.bam
done

printf "\n"

date


