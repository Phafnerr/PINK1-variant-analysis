# analysis.R
# PINK1 variant population frequency analysis
# This script creates a log-scale bar plot of gnomAD allele frequencies
# for curated pathogenic/likely pathogenic PINK1 variants.

# Install package if needed
if (!require(ggplot2)) {
  install.packages("ggplot2", repos = "https://cloud.r-project.org")
  library(ggplot2)
}

# Create data frame from curated variant frequencies
variant_data <- data.frame(
  Variant = c("Q126P", "A168P", "V170G", "G309D", "T313M",
              "L347P", "G386A", "G409V", "L489P", "C388R", "E240K"),
  AF = c(3.218e-6, 6.814e-6, 0, 0, 1.363e-5,
         1.611e-5, 1.239e-6, 0, 1.859e-6, 2.478e-6, 3.719e-6)
)

# Mark whether the variant was observed in gnomAD
variant_data$Observed <- ifelse(variant_data$AF == 0, "Not observed", "Observed")

# Replace zero values with a very small placeholder for log-scale plotting only
variant_data$AF_plot <- ifelse(variant_data$AF == 0, 1e-8, variant_data$AF)

# Order variants by plotted allele frequency
variant_data$Variant <- reorder(variant_data$Variant, variant_data$AF_plot)

# Generate plot
p <- ggplot(variant_data, aes(x = Variant, y = AF_plot, fill = Observed)) +
  geom_bar(stat = "identity") +
  scale_y_log10() +
  geom_hline(yintercept = 1e-5, linetype = "dashed", color = "red") +
  labs(
    title = "Population Allele Frequencies of Pathogenic PINK1 Variants",
    x = "Variant",
    y = "Allele Frequency (log10 scale)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display plot
print(p)

# Save plot to file
ggsave(
  filename = "PINK1_variant_AF_plot.png",
  plot = p,
  width = 10,
  height = 7,
  dpi = 300
)
