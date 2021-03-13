%iteratively solving QAP problem using simple gradient descent method

clc
clear all
N=10;

permutation=zeros(N,N);
load('W');

X=1/N.*ones(N^2,1);
X_square=reshape(X,N,N);

%index array
indexcol=(1:N);
indexrow=(1:N);

k=20;%time constant

count=0;%counting
stepsize=0.0001;

%initial gradient
%mu=min(real(eig(W)));
grad=(W+W')*X-mu.*X;
for i=1:200
    X=X-stepsize.*grad;
%     stepsize=stepsize;
    if count<20
        count=count+1;
    else
        count=1;
        column=fix(find(X==max(X,[],'all'))/N);
        row=rem(find(X==max(X,[],'all')),N);
        
        %avoid zero
        if row==0
            row=N;
        end
        
        %avoid zero
        if column==0
            column=1;
        end
        
        %real reduced index of column and row in origin matrix X
        colgone=indexcol(column);
        rowgone=indexrow(row);
        
        %erase the index from index array
        indexcol(column)=[];
        indexrow(row)=[];
        
        %update permutation matrix and reduce dimension
        permutation(rowgone,colgone)=1;
        N=N-1;
        
        %delete one colmn and row from matrix X
        X=reshape(X,N+1,N+1);
        X(row,:)=[];
        X(:,column)=[];
        X=reshape(X,[],1);
        
        %project the residual matrix to doublt stochastic space
        X=DSProjection(X,N);
        
        %update parameter matrix
        tmp_index=[column:N+1:column+(N+1)*(N)];
        tmp_index=[tmp_index (row-1)*(N+1)+1:1:row*(N+1)];
        
        W(tmp_index,:)=[];
        W(:,tmp_index)=[];
        
        mu=min(real(eig(W)));
        grad=(W+W')*X-mu.*X;
    end
end
% QAP(X,W,mu)


% X=reshape(X,N,N);
permutation