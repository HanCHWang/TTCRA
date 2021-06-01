clc
clear all

A = [1,2,3,4;5,6,7,8;9,10,11,12;13,14,15,16];

B=[3,2,2];
C=[4,2,1];
indexcol=[1,2,3,4];
indexrow=[1,2,3,4];
%先记录下第一次
A_all{1,1}=A;
rowgone=indexrow(B(1));
colgone=indexcol(C(1));

indexrow(B(1))=[];
indexcol(C(1))=[];

A(B(1),:)=zeros(1,size(A,1));
A(:,C(1))=zeros(size(A,2),1);
A(B(1),C(1))= 1;
A_all{2,1}=A;
A(B(1),:)=[];
A(:,C(1))=[];
A_all{1,2}=A;
%迭代开始


for i=2:length(B)
    rowgone=indexrow(B(i));
    colgone=indexcol(C(i));

    indexrow(B(i))=[];
    indexcol(C(i))=[];

    A(B(i),:)=zeros(1,size(A,1));
    A(:,C(i))=zeros(size(A,2),1);
    A(B(i),C(i))= 1;
    A_all{i,2}=A;
    A(B(i),:)=[];
    A(:,C(i))=[];
    A_all{1,1+i}=A;
    
    A_temp=A_all{i,1};
    A_temp(rowgone,:)=zeros(1,size(A_temp,1));
    A_temp(:,colgone)=zeros(size(A_temp,2),1);
    A_temp(rowgone,colgone)= 1;
    A_all{i+1,1}=A_temp;

end