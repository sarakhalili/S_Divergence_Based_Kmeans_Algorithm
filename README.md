# S_Divergence_Based_Kmeans_Algorithm
Choosing a proper similarity/dissimilarity measure in cluster analysis is essential for revealing natural groupings in a dataset. Among the various techniques of implementing non-Euclidean dissimilarity criteria for clustering, the use of divergence-based distance functions has recently become popular.
In this code, we implement the s_k_means algorithm, an improved form of the K_means algorithm that replaces the normal Euclidean distance with S_distance. S_distance is a new point-to-point distance measure induced from the S-divergence measure. 
## How to run
This code is implemented on two different datasets. The first dataset is called "iris" dataset and the second one is synthetically generated with 10 non_overlapping random cluster centers and gaussian distribution. 

The "synthetic_SDistance" code contains the KMOR algorithm for the synthetically generated dataset.

The "iris_SDistance" code contains the KMOR algorithm for the iris dataset.
## Results
According to the results of this algorithm, Classification accuracy for the "iris" dataset increased by 8% and decreased by 0.05% for "synthetically generated" dataset  indicating that this algorithm works better for assymetric datasets compared to the K_means algorithm.

### Any Questions?
If you had any questions about using this code, Please contact [Sara Khalili](sarahkhalili89@gmail.com)

### Refrences
[1]	Gan G, Ng MK. K-means clustering with outlier removal. Pattern Recognition Letters. 2017 Apr 15;90:8-14.
