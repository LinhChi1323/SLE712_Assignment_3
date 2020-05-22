###################################
#                                 #
#   PART 1: "gene_expression.tsv" #
#                                 #
###################################
### Question 1
# Download file 
download.file("https://github.com/markziemann/SLE712_files/raw/master/bioinfo_asst3_part1_files/gene_expression.tsv", "gene_expression.tsv")
# Read data from tsv file
df <- read.csv("gene_expression.tsv", sep="\t")
# Show table of 6 genes
print(head(df))
### Question 2
# Mean column
df$mean <- rowMeans(df[,2:3], dim=1)
# Show table of 6 genes
print(head(df))
### Question 3
# Sort dataframe by mean column
sorted_df <- df[order(df$mean), ]
# Show 10 genes highest mean value
top10genes <- tail(sorted_df, 10)$GeneID
print(top10genes)
### Question 4
# Number of genes < 10
numGenes <- sum(df$mean < 10)
print(numGenes)
### Question 5
jpeg(file="mean_histogram.jpg")
hist(df$mean)
dev.off()

###################################
#                                 #
#   PART 2: "growth_data.csv"     #
#                                 #
###################################
### Question 6
# Download file 
download.file("https://github.com/markziemann/SLE712_files/raw/master/bioinfo_asst3_part1_files/growth_data.csv", "growth_data.csv")
# Read data from csv file
df <- read.csv("growth_data.csv")
# Column names
print(colnames(df))
### Question 7
# mean and standard deviation at 2004
mean_2004 <- mean(df$Circumf_2004_cm)
sd_2004 <- sd(df$Circumf_2004_cm)
# mean and standard deviation at 2004
mean_2019 <- mean(df$Circumf_2019_cm)
sd_2019 <- sd(df$Circumf_2019_cm)
### Question 8
boxplot(df$Circumf_2004_cm, df$Circumf_2019_cm, 
	names=c("Circumf_2004_cm", "Circumf_2019_cm"))
