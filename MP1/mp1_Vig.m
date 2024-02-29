%Script for GEOL647 Practical 1

clear;
clearvars;

%Part1
arr = load('Topo_Across_US.dat');

a = [2 4 3];

size(a);

b = transpose(a);
size(b);

%MP1.1.Q1 - The size of a is 1 row and 3 columns

%Part2

%MP1.2.Q1 - 4+16+9 = 29 

%MP1.2.Q2
%i.
i = a.*a; % = [4 16 9]
%ii.
ii = sum(i); % = 29
%iii.
iii = sqrt(ii); % = 5.3852
%iv.
sqrt(sum(a.*a)); % = 5.3852

%MP1.2.Q3
%i
%i = a*a; = No answer, since the matrix sizes are incompatible for matrix multiplication
%ii
ii = a*a'; 
%iii
%iii = transpose(a)*transpose(a); = No answer because the matrices are incompatible sizes for matrix multiplication
%iv
iv = a.*a'; % = [4 8 6;8 16 12;6 12 9]
%v
v = a'*a; %Same as iv
%vi
vi = sqrt(ii); % = 5.3852

%MP1.2.Q4
b = [2 4 3; 0 1 -1];

%MP1.2.Q5
size(b); % = (2,3)

%MP1.2.Q6
%i
%b*a; No answer because b is 2x3 and a is 1x3, which is incompatible for matrix multiplication 
%ii
%b'*a; No answer, b' is 3x2 and a is 1x3... incompatible
%iii
iii = b*a'; % = [29;1]
%iv
%b'*a'; No answer, b' is 2x3 and a' is 1x3... incompatible


%Part 3

%MP1.3.Q1
t = linspace(-2*pi,2*pi,101);

%MP1.3.Q2
c = cos(t);

%MP1.3.Q3
f1 = figure('position',[50 50 300 600]);
set(gca,'fontsize',14);

%MP1.3.Q4,MP1.3.Q5
subplot(2,1,1); plot(t,c);
xlabel('Time'); ylabel('Cosine'); xlim([0,pi]);
subplot(2,1,2); plot(c,t)
xlabel('Cosine'); ylabel('Time')

%Part 4

%MP1.4.Q1
%Complete

%MP1.4.Q2
Topo = load('Topo_Across_US.dat');

%MP1.4.Q3
%i
f2 = figure();
subplot(2,1,1); plot(Topo(:,1),Topo(:,3));
xlabel('Longitude (Degrees)'); ylabel('Topography (Meters)');

%ii
% R_long = R_e*cos(37*pi/180)
% l = 2pi*R_long/360 = 2*pi*6371*cos(37*pi/180)/360 = 88.8042 km/deg

%iii
subplot(2,1,2); plot(88.8042*(Topo(:,1)-Topo(1,1)),Topo(:,3));
xlabel('Distance from Start (km)');ylabel('Topography (Meters)')

%MP1.4.Q4
%See attached


