function stepsize=Armijo(X,W,alpha)
%this function is used to calculate the stepsize

beta=0.2;
sigma=1e-2;

d=-2*W*X;



while QAP(X,W,0)-QAP((X+alpha*d),W,0)<=sigma*alpha*(-(2*W*X)'*d)
    alpha=beta*alpha;
    if size(W,2)==1
        break
    end
end

stepsize=alpha;