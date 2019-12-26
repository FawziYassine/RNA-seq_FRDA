# R-script for differential expression analysis of Friedreichs_ataxia vs. Control groups.
# Done by Fawzi Yassine
# date: 01/02/2019

# install packages and load libraries                                                  
if(!requireNamespace("BiocManager"))
 install.packages("BiocManager")
BiocManager::install(c("DESeq2","genefilter","devtools", "geneplotter", "EnhancedVolcano",  "colorspace", "lazyeval", "tibble"))
BiocManager::install("ashr")
install.packages("gplots")
install.packages("RColorBrewer")
install.packages("pheatmap")
library(DESeq2)
library(genefilter)
library(geneplotter)
library(EnhancedVolcano)

# Read phenotype sample data
pheno_data = read.csv("data/frda_phenodata.csv")
table(pheno_data$genotype)

#  Read the gene count data
directory = "data/htseq-union-all"
sample_files = grep("_counts.txt", list.files(directory), value = TRUE)
sample_conditions = c(rep("Control", 17), rep("Friedreichs_ataxia", 18))
sample_table = data.frame(sampleName = sample_files, fileName = sample_files, condition = sample_conditions)
dds = DESeqDataSetFromHTSeqCount(sampleTable = sample_table, directory = directory, design = ~ condition)
colnames(dds)= gsub("\\_counts.txt$", "", colnames(dds))

# Check that the row names of pheno_data match column names of count_data 
all(pheno_data$ids == colnames(dds))

# Run the default analysis for DESeq2 and generate results table
dds = DESeq(dds)
res_deseq2 = results(dds)

# shrink the log fold changes
library(apeglm)
res_deseq2_shrunk = lfcShrink(dds=dds, coef = 2, res = res_deseq2, type = "apeglm")

# add gene symbols
gene_symbol = read.table("data/gencode.v28.symbols.txt", header = TRUE, na.strings = "n/a")
colnames(gene_symbol) = c("row", "symbol")
(FXN_index = which(gene_symbol$symbol == "FXN"))
gene_symbol[FXN_index, ]
res_deseq2_shrunk_data_frame = as.data.frame(res_deseq2_shrunk)
res_deseq2_shrunk_with_row = data.frame(res_deseq2_shrunk_data_frame, row = row.names(res_deseq2_shrunk))
merged_symbols_res_deseq2_shrunk = merge(res_deseq2_shrunk_with_row, gene_symbol, all.x = TRUE)

# What does our data tell us about tle log2FoldChange in FXN gene (the directly affected gene in Friedreich’s ataxia)?
(FXN_index = which(merged_symbols_res_deseq2_shrunk$symbol == "FXN"))
merged_symbols_res_deseq2_shrunk[FXN_index, ]

# identify genes with FDR < 0.05
significant_differ_res_deseq2_shrunk = subset(merged_symbols_res_deseq2_shrunk, merged_symbols_res_deseq2_shrunk$padj < 0.05)
dim(significant_differ_res_deseq2_shrunk)
sum(is.na(significant_differ_res_deseq2_shrunk$symbol))

# count how many genes are up_regulated and how many are down_regulated.
(up_regulated = sum(significant_differ_res_deseq2_shrunk$log2FoldChange > 0))
(down_regulated = sum(significant_differ_res_deseq2_shrunk$log2FoldChange < 0))

# check these anti-inflamatory and anti-oxidant genes
anti = match(c("FXN", "ANPNEP", "MMP9", "MME", "PI3", "CA1", "CA4", "NCF4", "DYSF", "STX3",
              "RPL14", "TTC4", "DDX47", "PROK2", "AQP9", "DYSF", "SYNCA", "NOX1", "NQO1", "GPX1", "GSR", "GCLC", "HMOX1", 
              "NFE2L2", "PPARGC1A", "FOXO1", "TFAM",
              "SOD1", "SOD2", "CAT", "GPX1", "TXN", "TXN2",
              "PRKAA1",  "PRKAA2", "PRKAB1", "PRKAB2", "PRKAG1", "PRKAG2", "PRKAG3"), 
            significant_differ_res_deseq2_shrunk$symbol)
significant_differ_res_deseq2_shrunk[anti, ]

# What does /our data tell us about tle log2FoldChange in FXN gene (the directly affected gene in Friedreich’s ataxia)?
(FXN_index = which(significant_differ_res_deseq2_shrunk$symbol == "FXN"))
significant_differ_res_deseq2_shrunk[FXN_index, ]

# Sort by adjusted p-value
ordered_significant_differ_res_deseq2_shrunk = significant_differ_res_deseq2_shrunk[order(significant_differ_res_deseq2_shrunk$padj),]

# What does our data tell us about tle log2FoldChange in FXN gene (the directly affected gene in Friedreich’s ataxia)?
dim(ordered_significant_differ_res_deseq2_shrunk)
(FXN_index = which(ordered_significant_differ_res_deseq2_shrunk$symbol == "FXN"))
ordered_significant_differ_res_deseq2_shrunk[FXN_index,]
ordered_significant_differ_res_deseq2_shrunk[1,]
# means that the Friedreichs_ataxia group shows a multiplicative change in observed gene expression level of \(2^{-1.53} = 0.35) compared to the Control group

# MA-plot: plot log2 fold-changes (on the y-axis) versus the mean of normalized counts (on the x-axis) for differentially expressed genes
pval_threshold = 10e-3
plotMA(res_deseq2, alpha = pval_threshold)

# Volcano plot
EnhancedVolcano(merged_symbols_res_deseq2_shrunk, FCcutoff = 1, pCutoff = pval_threshold, 
                lab = merged_symbols_res_deseq2_shrunk$symbol, 
                x = 'log2FoldChange', y = 'pvalue', xlim = c(-3, 4), ylim = c(0, 17),
                legend = c("Non-significant", "Passed log2 fold-change threshold", "Passed the p-value threshold", "Passed both thresholds"),
                legendPosition = 'right',
                legendLabSize = 9,
                legendIconSize = 2,
                widthConnectors = 0.2,
                colConnectors = 'grey30',
                colAlpha = 1)

# plot counts of FXN gene 
plotCounts(dds, gene="ENSG00000165060.12", intgroup = "condition", pch=1, col=dds$condition, cex=3, main = "Frataxin(FXN)",transform = FALSE)       

# heatmap and plotPCA work better on homoskedastic data (i.e., the variance of a gene's count does not depend on the mean counts)
# regularized-logarithm transformation to make the count data approximately homoskedastic.
rld = rlog(dds)

# Heatmap: gives us an overview over similarities and dissimilarities between samples.
sample_distances = dist(t(assay(rld)))
sample_distances_matrix = as.matrix(sample_distances)
library( "RColorBrewer" )
library(pheatmap)
colors = colorRampPalette( rev(brewer.pal(9, "Blues")) )(255) # set colors
pheatmap(sample_distances_matrix, 
         clustering_distance_rows = sample_distances,
         clustering_distance_cols = sample_distances, col = colors)

# Principl Components Analysis (PCA) 
plotPCA(rld, intgroup = "condition")
                        
# PANTHER
file_conn = file("sig_differ_genes_strict-all.txt")
write(as.character(significant_differ_res_deseq2_shrunk$symbol), file_conn)
close(file_conn)

