


#!/bin/bash

awk -F "\t" '$3 == "gene" {print $9}' data/gencode.v28.annotation.gtf | \
tr -d ";\"" | \
awk -F " " '{print $2, $6}'


