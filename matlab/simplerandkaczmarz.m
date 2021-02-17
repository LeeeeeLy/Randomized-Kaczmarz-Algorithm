function [x,iter,error] = simplerandkaczmarz(A, b, x0,maxit,tol,exactx)
% simplerandomized kaczmarz mentioned by fig 1
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
%iter = 0;
error = [];
e = 1;

if isempty(tol)
  iter = maxit;   
  for i = 1:maxit
    %randsample to generate weighted random number from given vector
    pickedi = randi(m);
    
    row = A(pickedi, :);
    x = x + ( b(pickedi) - (row * x) ) / (row * row') * row';
    e = norm(x-exactx);
    error = [error,e];
    %iter = iter+1;
  end
else
    iter = 1;
    e = 1;
    while e >= tol 
        pickedi = randi(m);
    
    row = A(pickedi, :);
    x = x + ( b(pickedi) - (row * x) ) / (row * row') * row';
    e = norm(x-exactx);
    error = [error,e];
    iter = iter+1;
    end
end
end