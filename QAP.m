function [value] = QAP(X,W,mu)
%Convex relaxed QAP cost function

value=X'*W*X-mu*norm(X,'fro')^2;

end
