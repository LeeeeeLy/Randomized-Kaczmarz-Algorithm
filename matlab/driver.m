%driver 

%% experiment 1 (presentation) comparing rate of convergence among 3 versions with maxit = 15000 (same experiment as from the original paper)
[error1,error2,error3] = driver_as_function(15000,[]);

figure (1)
semilogy(1:maxit,error1,'k--');
title('comparing rate of convergence among 3 versions with maxit = 15000')
ylabel('Least squares error') 
xlabel('Number of iterations') 
hold on
semilogy(1:maxit,error2,'b--');
semilogy(1:maxit,error3,'r--');
hold off
legend('classical kaczmarz','simple randomized kaczmarz','randomized kaczmarz')
%% experiment 2 (report) Running 100 times with random input and maxit = 5000 - statistical analysis
error_c = [];
error_s = [];
error_r = [];
for n = 1:100
    [error1,error2,error3] = driver_as_function(5000,[]);
    error_c = [error_c,error1(5000)];
    error_s = [error_s,error2(5000)];
    error_r = [error_r,error3(5000)];
end
% histogram
figure (2)
title('errors')
h3 = histogram(error_c);
ylabel('frequency') 
xlabel('Least squares error at the 5000th iteration')
hold on
h4 = histogram(error_s);
h5 = histogram(error_r);
hold off
legend('classical kaczmarz','simple randomized kaczmarz','randomized kaczmarz')


figure (3)
h1 = histogram(error_s);
ylabel('Frequency') 
xlabel('Least squares error at the 5000th iteration')
hold on
h2 = histogram(error_r);
hold off
legend('simple randomized kaczmarz','randomized kaczmarz')

%% experiment 3 (report) Running 100 times with random input and tol = 10^(-4) - statistical analysis
iter_c = [];
iter_s = [];
iter_r = [];
for n = 1:100
    [iter1,iter2,iter3] = driver_as_function([],0.0001);
    iter_c = [iter_c,iter1];
    iter_s = [iter_s,iter2];
    iter_r = [iter_r,iter3];
end  
% histogram
figure (4)
title('iterations')
h6 = histogram(iter_c);
ylabel('Frequency') 
xlabel('Number of iterations to reach the tolerrance')
hold on
h7 = histogram(iter_s);
h8 = histogram(iter_r);
hold off
legend('classical kaczmarz','simple randomized kaczmarz','randomized kaczmarz')
figure (5)
title('iterations')
h9 = histogram(iter_s);
ylabel('Frequency') 
xlabel('Number of iterations to reach the tolerrance')
hold on
h10 = histogram(iter_r);
hold off
legend('simple randomized kaczmarz','randomized kaczmarz')