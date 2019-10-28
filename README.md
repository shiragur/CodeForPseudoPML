# CodeForPseudoPML
The code used to run experiments in the paper "A General Framework for Symmetric Property Estimation" by Moses Charikar, Kirankumar Shiragur and Aaron Sidford.

The main file in the repository that contain the code is PseudoPMLEntropyEstimation.m; the description of which is provided below:

PseudoPMLEntropyEstimation.m
This contains the code to estimate entropy using the pseudoPML approach. In our pseudo PML approach, we divide the samples into two parts. We run the empirical estimate on one (this is easy) and the PML estimate on the other. For the PML estimate, any algorithm to compute an approximate PML distribution can be used in a black box fashion. An advantage of the pseudo PML approach is that it can use any algorithm to estimate the PML distribution as a black box, providing both competitive performance and running time efficiency. In our experiments, we use the heuristic algorithm in [PJW17] to compute an approximate PML distribution.

[PJW17] "Approximate Profile Maximum Likelihood" by Dmitri S. Pavlichin, Jiantao Jiao and Tsachy Weissman.

NOTE: We borrow two functions from [PJW17]. The implementation of function "int_hist()" that outputs the histogram and "PMLdistributionApproximate" the function to find the approximate PML distribution. To run our code, one needs to first download the code of [PJW17] or some other implementation of finding the approximate PML distribution.





NeurIPS Conference Slides added. 
