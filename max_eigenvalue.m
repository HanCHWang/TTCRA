function [value]=max_eigenvalue(W)
%use power method https://en.wikipedia.org/wiki/Power_iteration to help
%with finding maximum eigenvalue for big matrix W

N=size(W,2);
b_k=rand(N,1);
num_simulations=100;

for i=1:num_simulations
    b_k1=W*b_k;
    b_k_norm=norm(b_k1);
    b_k=b_k1/b_k_norm;
end

value=b_k'*W*b_k/(b_k'*b_k);
end