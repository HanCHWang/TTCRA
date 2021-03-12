%clc
%clear all;
%This program is used to test continuous optimal assignment problem for N robots.
%use fmincon to realize optimization

num_of_robot=10;%team scale

init_matrix=compute_matrix(num_of_robot);%compute initial transform matrix

init_position=100*rand(num_of_robot,2);%initial position of robot team
goal_position=100*rand(num_of_robot,2);

v_place=[];%v_place is used to transform a vector to matrix;
for i=1:num_of_robot
    for j=1:num_of_robot
        v_place=[v_place j+(i-1)*num_of_robot];
    end
end

init_tmp=zeros(1,num_of_robot^2);
init_tmp(v_place)=init_matrix';

A_eq=zeros(2*num_of_robot,num_of_robot^2);
for i=1:num_of_robot
    A_eq(i,(i-1)*num_of_robot+1:i*num_of_robot)=1;
end

for i=num_of_robot+1:2*num_of_robot
    
    for j=0:num_of_robot-1
            A_eq(i,i-num_of_robot+j*num_of_robot)=1;
    end
    
end

b_eq=ones(2*num_of_robot,1);



A=-diag(ones(num_of_robot^2,1));
b=zeros(num_of_robot^2,1);


options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',10000000,'MaxIterations',10000000);
[y,f]=fmincon(@(x)objective_function(x,init_position,goal_position),init_tmp,A,b,A_eq,b_eq,[],[],[],options);
value=zeros(num_of_robot,num_of_robot);
value(v_place)=y;
value=value';
% PI=stadis(value);%wtf stupid operation
value_max=max(value,[],2);
value(value<value_max)=0;
value(value==value_max)=1;
value*value'
