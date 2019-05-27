


#!/bin/bash

DATADIR=/home/fawzi/sequencing/projects/RNA-seq_FRDA/data

date

for i in `seq 0 34`
do
	A=$((6078274 + i))
        printf "\n***** Downloading the reads SRR%d from SRA to %s/sra ...\n\n" $A $DATADIR
	printf "\nfastq-dump --split-files SRR%d -O %s/sra\n" $A $DATADIR
	fastq-dump --split-files SRR$A -O $DATADIR/sra
done

printf "\n"

date

