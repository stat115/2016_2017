setwd("/mnt/hgfs/Dropbox/STAT115/2015/HW2")

# taylor 2010
taylor = as.matrix(read.csv("taylor2010_data.txt", sep="\t",row.names=1));
In = grepl("N.P", colnames(taylor));
Ip = grepl("P.P", colnames(taylor));
Im = grepl("M.P", colnames(taylor));
Nn = sum(In);
Np = sum(Ip);
Nm = sum(Im);

# class label (design vector)
class = c(rep(0,Nn),rep(1,Np),rep(2,Nm));

# train (known type samples), and test (unknown type samples)
train = taylor[,1:174];
test  = taylor[,175:179];

# colors for plotting
cols = c(class+2, 1,1,1,1,1)


################
#  Clustering  #
################

# Hierarchical clustering with all genes


# PCA with all genes
# Your code ..


# LIMMA for differential expression 
library(limma)
# Your code ..


# Hierarchical clustering with differentially expressed genes
# Your code ...

  
# PCA with differentially expressed genes
# Your code ..


# Kmeans
# Your code ..


####################
#  Classification  #
####################

# KNN
library(class)
# Your code ..


# SVM
library('e1071')
# Your code ..


# LIMMA for top 20 differentially expressed genes
# Your code ..

# LDA
library(MASS)
# Your code ..


# 5-fold Cross validation for the 3 methods (KNN, SVM and LDA)
# Your code ..
