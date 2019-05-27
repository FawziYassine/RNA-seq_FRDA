# Bioinformatics Analysis Results

From my analysis, I have identified 4676 [2693 (up_regulated) + 1983 (down_regulated)]  significant Differentially Expressed Genes (**DEGs**) between the FRDA and CTRL cohorts (FDR<0.05); whereas the authors in ([Napierala et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29125828)) have identified only 3788 **DEGs**.  

In comparison with the **CTL** group, the **FRDA** group showed a direct and significant downregulation of three antioxidant genes: **NQO1**, **TXN2** and **PRKAG1**. The downregulation of **PRKAG1** leads to the indirect downregulation of several other antioxidant genes  (like **SOD** and **HO-1**) because **PRKAG1** is involved in their expression.  

**Table1** shows the directly and significantly down-regulated antioxidant genes. The third column (Percentage of Controls) shows the percentage of average expression in **FRDA** samples of average expression in control samples.  
             
**Table1**: The directly and significantly down-regulated antioxidant genes.  

Gene          |          Name                                  | Percentage of Controlsl (%)
------------- | ---------------------------------------------- | ----------------------  
**NQO1**      | NAD(P)H Quinone Dehydrogenase 1                  | 66
**TXN2**      | Thioredoxin-2                                    | 89
**PRKAG1**    | 5'-AMP-activated protein kinase subunit gamma-1  | 86

---------


### MA-plot
A scatter plot of log2 fold changes (on the y-axis) versus the mean of normalized counts (on the x-axis).

![](plots/ma_plot.png)

### Volcano-plot
A scatter plot that shows statistical significance (P value) versus magnitude of change (fold change). It enables quick visual identification of genes with large fold changes that are also statistically significant. These may be the most biologically significant genes. In a volcano plot, the most upregulated genes are towards the right, the most downregulated genes are towards the left, and the most statistically significant genes are towards the top.

![](plots/volcano_plot.png)

### Heatmap-plot
A Heatmap plot gives us an overview over similarities and dissimilarities between samples.  

![](plots/heatmap_plot.png)

### PCA-plot
Principl Components Analysis (PCA) is used to visualize sample-to-sample distances. 
![](plots/pca_plot.png)

### Plot-count of FXN gene

![](plots/fxn_counts_plot.png)

----------
P.S: Visit the [Clinical Significance and Therapuetic Potential](Clinical_Significance_and_Therapuetic_Potential.md) next.
----------

# References

- Napierala, J. S., Li, Y., Lu, Y., Lin, K., Hauser, L. A., Lynch, D. R., & Napierala, M. (2017). Comprehensive analysis of gene expression patterns in Friedreich’s ataxia fibroblasts by RNA sequencing reveals altered levels of protein synthesis factors and solute carriers. Disease Models & Mechanisms, 10(11), 1353–1369. https://doi.org/10.1242/dmm.030536