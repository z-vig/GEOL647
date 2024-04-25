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

%q1.5
misfitL2 = @(m)sum((A*m-y) .^ 2);
m2 = fminsearch(misfitL2,m0);
plot(x,A*m2,"DisplayName","L2-norm","Color","Blue");
%slope: 1.9405, y-intercept: 0.0502

%q1.6
misfitL1 = @(m)sum(abs(A*m-y));
m1 = fminsearch(misfitL1,m0);
plot(x,A*m1,"DisplayName","L1-norm","Color","Red");
%slope: 1.900, y-intercept: 0.1000. These model values are slightly different from the L2 model, favoring going through the endpoints points.

%q1.7
m3 = linsolve(A,y);
plot(x,A*m3,"DisplayName","LinSolve","Color","magenta");
%{
    slope: 1.9405, y-intercept: 0.0502. These results match the L2 model better than the L1 model.
%}

%q1.8
%{
    0.01 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    0.00 0.01 0.00 0.00 0.00 0.00 0.00 0.00
    0.00 0.00 0.01 0.00 0.00 0.00 0.00 0.00
    0.00 0.00 0.00 0.01 0.00 0.00 0.00 0.00
    0.00 0.00 0.00 0.00 0.01 0.00 0.00 0.00
    0.00 0.00 0.00 0.00 0.00 0.01 0.00 0.00
    0.00 0.00 0.00 0.00 0.00 0.00 0.01 0.00
    0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.01
%}

%q1.9
Cd = diag(repmat(0.01,8,1));

m_analytical = ((A' * (Cd\A)) \ A') * (Cd \ y);

plot(x,A*m_analytical,"DisplayName","Including Error","Color","cyan");
legend()
errorbar(x,y,diag(Cd),"LineStyle","none","DisplayName","Error");
%{
    slope: 1.9405, y-intercept: 0.0502. Accounting for errors did not affect the results of the fit.
%}
hold off;

Cm = inv(A' * (Cd\A));
corr_coef = Cm(1,2)/(Cm(1,1)^0.5*Cm(2,2)^0.5);

%q2.1
y(2) = 3.06;
misfitL2 = @(m)sum((A*m-y) .^ 2);
m1_outlier = fminsearch(misfitL2,m0);
%{
    slope: 1.9405
%}
