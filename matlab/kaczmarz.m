function [x,iter,error] = kaczmarz(A, b, x0,maxit,tol,exactx)
% classical kaczmarz
%
% Ax = b
% A - input matrix
% b - right vector
% x0 - initial x
%
% x - the approximated x
% iter - number of iterations before convergence (= maxit if maxit is given)
% error - the norm of difference in x and exact solution after every
% iteration

m = size(A,1);
n = size(A,2);

x = x0;
error = [];

if isempty(tol)
    iter = maxit;
    for i=1:maxit
       pickedi = mod(i,m)+1;
       row = A(pickedi, :);
       x = x + ( b(pickedi) - (row * x) ) / (row * row') * row';
       e = norm(x-exactx);
       error = [error,e];
    end
else
    iter = 1;
    e = 1;
    while e >= tol
       pickedi = mod(iter,m)+1;
       row = A(pickedi, :);
       x = x + ( b(pickedi) - (row * x) ) / (row * row') * row';
       e = norm(x-exactx);
       error = [error,e];
       iter = iter+1;
    end
end
end