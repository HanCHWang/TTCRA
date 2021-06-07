function permMatrix=permCal(permVector)
%Calculate permutation matrix through permutation
N=size(permVector,2);
permMatrix=zeros(N,N);

for i=1:N
    for j=1:N
        if permVector(i)==j
            permMatrix(i,j)=1;
        end
    end
end


end