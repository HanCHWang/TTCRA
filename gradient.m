function [value] = gradient(X,W)
%This function is used with calculating the gradient of the quadratic cost
%function
% No sparsity is evaluated in this version!
stepsize=0.1;
grad=(W+W')*X;
    
end

