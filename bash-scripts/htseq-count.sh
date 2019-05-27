#!/bin/bash

DATADIR=/home/fawzi/sequencing/projects/RNA-seq_FRDA/data
ANNOT=/home/fawzi/sequencing/projects/RNA-seq_FRDA/data/gencode.v28.annotation.gtf
HTSEQDIR=/home/fawzi/sequencing/projects/RNA-seq_FRDA/htseq-count
HISAT2DIR=/home/fawzi/sequencing/projects/RNA-seq_FRDA/hisat2-sorted-bam

date

mkdir -p $HTSEQDIR
rm -f $HTSEQDIR/*

for i in `seq 0 34`
do
        A=$((6078274 + i))
        printf "\n***** Assembling the transcripts for sample SRR%d ...\n\n" $A
        htseq-count -f bam -s reverse -r name -m union --nonunique all $HISAT2DIR/SRR$A.bam $ANNOT > $HTSEQDIR/SRR${A}_counts.txt
done

printf "\n"

date
