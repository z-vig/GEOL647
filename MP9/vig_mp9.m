%Matlab Practical 9
%Zach Vig

clear;
clearvars;
close all;

%q1.1
x = [0.1; 0.6; 0.2; 0.5; 1.4; 2.3; 1.7; 1.3];
y = [0.3; 1.06; 0.44; 1.05; 2.92; 4.47; 3.38; 2.5];

%q1.2
figure(1); hold on;
plot(x,y,'k^','MarkerFaceColor','green',"DisplayName","Data");

%q1.3
% m = [slope; y-intercept]
% Am = y

%my guess :)
A = [x,ones(length(x),1)]; m0 = [2; 0];
plot(x,A*m0,"DisplayName","My Guess","Color","Black","LineStyle","--");

%q1.4
%{
    A is an 8 by 2 matrix, meaning we have 8 data points to determine 2 parameters (slope, y-intercept). This means that the problem is overdetermined.
%}

%q1.6
misfitL1 = @(m)sum(abs(A*m-y));
m1 = fminsearch(misfitL1,m0);
plot(x,A*m1,"DisplayName","L1-norm","Color","Red");

%q1.5
misfitL2 = @(m)sum((A*m-y) .^ 2);
m2 = fminsearch(misfitL2,m0);
plot(x,A*m2,"DisplayName","L2-norm","Color","Blue");

%q1.7
m3 = linsolve(A,y);
plot(x,A*m3,"DisplayName","Exact","Color","magenta");

legend();

%q1




