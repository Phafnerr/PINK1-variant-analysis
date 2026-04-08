# PINK1 Variant Population Analysis

This repository contains supplementary data and analysis code for a population-genetics study of pathogenic *PINK1* variants associated with early-onset Parkinson’s disease (EOPD).

The project integrates population allele frequency data from gnomAD and the 1000 Genomes Project with Hardy–Weinberg equilibrium (HWE) modeling to estimate expected heterozygous carrier and homozygous genotype frequencies.

---

## Project Overview

Mutations in the *PINK1* gene are a known cause of autosomal recessive early-onset Parkinson’s disease. This project evaluates whether population-level allele frequencies of curated pathogenic variants are consistent with:

- Reported disease prevalence
- A recessive inheritance model
- Expected genotype frequencies under Hardy–Weinberg equilibrium

A curated set of 11 pathogenic or likely pathogenic variants was analyzed.

---

## Repository Contents

### Data

- `variants_master_table.csv`  
  Full curated dataset of *PINK1* variants including:
  - rsID
  - Protein change (HGVS p.)
  - Genomic coordinates (GRCh38)
  - Variant consequence
  - ClinVar classification and review status
  - gnomAD allele frequency (AF), allele count (AC), allele number (AN)
  - Population-specific allele frequencies
  - 1000 Genomes allele frequency data

- `resources_table.csv`  
  Summary of all datasets and tools used, including:
  - Version/release information
  - Genome build
  - Data retrieved
  - Purpose in analysis

---

### Code

- `analysis.R`  
  R script used for:
  - Data structuring and transformation
  - Hardy–Weinberg calculations
  - Visualization of allele frequencies

---

## Methods Summary

### Variant Curation
Variants were selected from Ma et al. (2021) and cross-referenced across:
- ClinVar (clinical classification)
- MDSGene (disease association)
- dbSNP (rsID harmonization)
- Ensembl Variant Effect Predictor (annotation)

### Population Data Sources
- gnomAD v4.1.0 (GRCh38)
- 1000 Genomes Project Phase 3 (via Ensembl)

### Hardy–Weinberg Modeling
Genotype frequencies were estimated using:

p² + 2pq + q² = 1

Given the rarity of the variants (q ≪ 1):
- p ≈ 1
- 2pq ≈ 2q (heterozygotes)
- q² ≈ homozygotes

Summed allele frequencies (q_total) were used to estimate aggregate genotype frequencies across variants.

### Visualization
- Implemented in R using ggplot2
- Log10 scale used for allele frequencies
- Reference threshold at 1 × 10⁻⁵ to indicate rare variant range

---

## Key Assumptions and Limitations

- Hardy–Weinberg equilibrium assumes:
  - Random mating
  - No selection
  - Large, well-mixed population

- Population allele frequencies (gnomAD) may:
  - Underrepresent rare pathogenic variants
  - Not reflect disease-enriched populations

- Phenotype-linked data were not available, limiting:
  - Penetrance estimation
  - Direct genotype–disease association

---

## Reproducibility

All analyses were conducted using:
- R (version 4.5.1)
- ggplot2

To reproduce figures:
1. Load `variants_master_table.csv`
2. Run `analysis.R`

---

## Data Sources

- gnomAD v4.1.0  
- 1000 Genomes Project Phase 3  
- ClinVar (2025 release)  
- MDSGene v3.5.95  
- dbSNP Build 157  
- Ensembl VEP (release 115, GRCh38)

---

## Citation

If referencing this repository, please cite the associated project report.

---

## Notes

This repository is intended to provide transparency and reproducibility for a course-based bioinformatics project. It does not represent a clinical or diagnostic resource.
