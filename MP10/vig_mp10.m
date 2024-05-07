% Matlab Practical 10
% Zach Vig

clear;
close all;

x = [0.1; 0.6; 0.2; 0.5; 1.4; 2.3; 1.7; 1.3];
y = [0.3; 1.06; 0.44; 1.05; 2.92; 4.47; 3.38; 2.5];

%q1.1
figure(1);
plot(x,y,'k+');

%q1.2
A = cat(2,x,ones(length(x),1));
m = [2,0; 0,1];

%q1.3
Cd = diag([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1]);

%q1.4
m = ((A' * (Cd\A)) \ A') * (Cd \ y);


%q2.1
load('Data_for_Practical_10.mat');
pcolor(X,Y,Z);
