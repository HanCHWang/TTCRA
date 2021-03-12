function [Y]=DSProjection(X)
%This function is used with project the residual of X to doubly stochastic
%space


%projection function: 1/2||X_Y||_F^2
N=10;
A=[kron(eye(N),ones(1,N));kron(ones(1,N),eye(N))];

X=reshape(X,[],1);
Y=X;
for i=1:30
    
    
    mu=inv(A*A')*(ones(2*N,1)-A*Y);
    Y=Y+A'*mu;
    Y(Y<0)=0;
    
end
Y=reshape(Y,N,N);