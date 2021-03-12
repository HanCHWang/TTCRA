function value=objective_function(A,init_p,goal_p)
%V1.0
%very simple objective function

n=size(init_p,1);

v_place=[];%v_place is used to transform a vector to matrix;
for i=1:n
    for j=1:n
        v_place=[v_place j+(i-1)*n];
    end
end

A_matrix=zeros(n,n);
A_matrix(v_place)=A;
A_matrix=A_matrix';

% value=norm(init_p-A_matrix*goal_p,'fro');%f-norm
value=norm(init_p-A_matrix*goal_p);%2-norm

end