%iteratively solving QAP problem using simple gradient descent method

clc
clear all
N=10;

permutation=zeros(N,N);
load('W');
X=1/N.*ones(N^2,1);

mu=min(real(eig(W)));

k=20;%time constant

count=0;%counting
stepsize=0.0001;
for i=1:200
    grad=(W+W')*X-mu.*X;
    X=X-stepsize.*grad;
%     stepsize=stepsize;
    
    if count<20
        count=count+1;
    else
        count=1;
        column=fix(find(X==max(X,[],'all')));
        row=rem(find(X==max(X,[],'all')),N);
        
        permutation(row,column)=1;
%         X(row,:)=[];
%         X(:,column)=[];
        N=N-1;
        X=DSProjection(X,N);
    end
end
% QAP(X,W,mu)


% X=reshape(X,N,N);
permutation