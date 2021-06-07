%iteratively solving QAP problem using simple gradient descent method

% clc
% clear all

function [value,time]=TTCRA(W)
% load('W10');
N=sqrt(size(W,2));
permutation=zeros(N,N);
W_origin=W;
% W=rand(N^2,N^2);

X=1/N.*ones(N^2,1);
% X=reshape(rand(N,N),[],1);

%index array
indexcol=(1:N);
indexrow=(1:N);

k=100;%time constant

count=0;%counting
% stepsize=0.003;

%initial time
tic

%initial gradient
muL=min(real(eig(W)));
W=W-muL*diag(ones(N^2,1));
% muL=-max_eigenvalue(-W);
% muL_origin=muL;
% grad=(W+W')*X-muL.*X;%mu is inserted function, using muL instead
grad=(W+W')*X;
% stepsize=0.004;
eigen=min(real(eig(W)));
for i=1:k*sqrt(size(W,2))
%     stepsize=grad'*grad/(grad'*(W+W')*grad);
%     if (grad'*(W+W')^2*grad)==0
%         stepsize=0;
%     end

% stepsize=Armijo(X,W,1);
    stepsize=0.5;
    X=X-stepsize.*grad;
% X=X-inv(W)*W*X;
    %     stepsize=stepsize;
    if count<k
        count=count+1;
        X=DSProjection(X,N);
        QAP(X,W,0);
        1;
    else
        count=1;
        X=DSProjection(X,N);
        reshape(X,N,N)
        column=fix(find(X==max(X,[],'all'),1,'first')/N);
        row=rem(find(X==max(X,[],'all'),1,'first'),N);
        max(X,[],'all')
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
%         X=DSProjection(X,N);
        
        %update parameter matrix
        tmp_index=[column:N+1:column+(N+1)*(N)];
        tmp_index=[tmp_index (row-1)*(N+1)+1:1:row*(N+1)];
        
        W(tmp_index,:)=[];
        W(:,tmp_index)=[];
        
%         muL=min(real(eig(W)));
%         W=W-muL*diag(ones(N^2,1));
        %         muL=-max_eigenvalue(-W);
            eigen=[eigen min(real(eig(W)))];
    end
%     grad=(W+W')*X-muL.*X;
    grad=2*W*X;

%     if min(real(eig(W)))<-1e-6
%         min(real(eig(W)))
%     end
end

% QAP(X,W,mu)
permutation(indexrow,indexcol)=1;

%end time
toc

%show time
% disp(['Computing Time:',num2str(toc)]);

% X=reshape(X,N,N);
% QAP(reshape(permutation,[],1),W_origin,muL_origin)
value=QAP(reshape(permutation,[],1),W_origin,0);
perm=permutation;
time=toc;
end