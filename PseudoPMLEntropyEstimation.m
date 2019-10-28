function [EstimatedEntropy,fracvalue,succ] = PseudoPMLEntropyEstimation(samp,threshold)
% This function implements the algorithm of [CSS19] (PseudoPML paper) using the algorithm by
% Dimitri et.al [PJW17] to compute approximate PML distribution as a sub routine.

%Input to the function: 
%samp: Is the samples from the hidden distribution p.
%threshold: F=[0,threshold] (Input of Algorithm 1 in [CSS19]), i.e. we use the PML estimate on frequencies less than "threshold" and empirical estimate on the rest.
%N is the domain size. For domain size 10^5, we set threshold=18.

EstimatedEntropy=0;
succ=1;
[n,~]=size(samp);
hist_vec = int_hist(samp); %int_hist(x) is a histogram of all integer values 1:max(max(x)) this function is implemented in [PJW17]
fracvalue=0;
n1=0;
n2=0;
emp_est=0;
pml_est=0;
bias=0;
m=0;

if threshold<=n
pml_estimate_hist_vec=hist_vec(hist_vec(:)<threshold);
n2=sum(pml_estimate_hist_vec);
n1=n-n2;
fracvalue=n1/n;
if n1>0
emp_estimate_hist_vec=hist_vec(hist_vec(:)>=threshold);
[m,~]=size(emp_estimate_hist_vec);
bias=m/(2*n);
emp_est=entropyOfDistribution(emp_estimate_hist_vec, 2); %Calculates the entropy of distribution, this is the function implemented by [PJW17]. Please download this function from [PJW17]
%Instead of invoking the entropyOfDistribution function, one can write this manually. 
end

else
pml_estimate_hist_vec=hist_vec;
n1=0;
n2=n;
end

if n2>0
[p_approx,~,~,not_have_valid_K_est] = PMLdistributionApproximate(pml_estimate_hist_vec); % This is the place where we invoke the algorithm to find approximate PML distribution. 
%We are using [PJW17] here, but one can use any other algorithm as well. Please download the code of this function from [PJW17] to run our algorithm.

% plug-in to entropy functional
pml_est = entropyOfDistribution(p_approx);
end

EstimatedEntropy=(n2/n)*pml_est+(n1/n)*emp_est+entropyOfDistribution([n1/n,n2/n])+bias;
end
