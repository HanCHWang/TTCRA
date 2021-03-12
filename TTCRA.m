%iteratively solving QAP problem using simple gradient descent method

clc
clear all
N=10;

permutation=zeros(N,N);
load('W');
X=1/N.*ones(N^2,1);

mu=min(real(eig(W)));

k=10;%time constant

stepsize=0.0001;
for i=1:200
    grad=(W+W')*X-mu.*X;
    X=X-stepsize.*grad;
    stepsize=stepsize;
    X=DSProjection(X);
end
QAP(X,W,mu)


X=reshape(X,N,N);