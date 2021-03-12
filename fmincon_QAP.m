%using fmincon with SQP solver to solve convex relaxed QAP problem
clc
clear all
N=10;

% W=100*rand(N^2,N^2);
load('W');
mu=min(real(eig(W)));

A_eq=[kron(eye(N),ones(1,N));kron(ones(1,N),eye(N))];

b_eq=ones(2*N,1);

A=-diag(ones(N^2,1));
b=zeros(N^2,1);

init_tmp=1/N.*ones(N^2,1);

options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',10000000,'MaxIterations',10000000);
[y,f]=fmincon(@(X)QAP(X,W,mu),init_tmp,A,b,A_eq,b_eq,[],[],[],options);
f