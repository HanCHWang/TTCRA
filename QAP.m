function [value] = QAP(X,W,mu)
%QAP represent 

value=trace(X'*W*X)-mu*norm(X,'fro')^2;

end

