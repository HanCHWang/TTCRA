function [value] = QAP(X,W,mu)
%Convex relaxed QAP cost function

N=size(W,2);
value=X'*(W - mu*diag(ones(N,1)))*X;

end
