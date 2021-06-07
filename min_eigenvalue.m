function [value]=min_eigenvalue(W)
%use inverse iteration https://en.wikipedia.org/wiki/Inverse_iteration 
%to help with finding smallest eigenvalue of matrix W

N=size(W,2);
b_k=rand(N,1);
num_simulation=10000;
muL=-10;
W_inv=inv(W-muL*diag(ones(N,1)));

for i=1:num_simulation
    b_k1=W_inv*b_k;
    b_k_norm=norm(b_k1);
    b_k=b_k1/b_k_norm;
end

lambda=W_inv*b_k;
value=lambda'*W*lambda/(lambda'*lambda);
end