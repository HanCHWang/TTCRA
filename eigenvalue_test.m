% N=5;
% W=rand(N,N);
% mu=min(real(eig(W)))
% result=W-mu*diag(ones(N,1));
% min(real(eig(result)))

N=8;
matrix=rand(N,N);
matrix=reshape(matrix,[],1);
matrix=DSProjection(matrix,N);
matrix=reshape(matrix,N,N)