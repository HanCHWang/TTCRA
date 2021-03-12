function [c,ceq] =nonlcon(matrix)

c=[];
n=sqrt(size(matrix,2));
v_place=[];%v_place is used to transform a vector to matrix;
for i=1:n
    for j=1:n
        v_place=[v_place j+(i-1)*n];
    end
end

A_matrix=zeros(n,n);
A_matrix(v_place)=matrix;
A_matrix=A_matrix';
ceq=ones(1,n).*A_matrix-ones(1,n);

end