% Matlab Practical 7
% Zach Vig

clearvars;
clear;

load Harmonics/my_coast.mat

%q1.1
coefficients_structure = zeros(10,4);
coefficients_structure(:,1) =[0,1,1,2,2,2,3,3,3,3];
coefficients_structure(:,2) = [0,0,1,0,1,2,0,1,2,3];
coefficients_structure(5,3) = 1;

%q1.2
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180 90 180 -90]);

%q1.3
figure(1); subplot(5,1,1); hold on;
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m positive = 1");
hold off; 

coefficients_structure(5,3) = 0.5; subplot(5,1,2); hold on; 
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180,90,180,-90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m positive = 0.5");
hold off;

coefficients_structure(5,3) = 0.1; subplot(5,1,3); hold on;
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180,90,180,-90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m positive = 0.1");
hold off;

coefficients_structure(5,3) = -1; subplot(5,1,4); hold on;
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180,90,180,-90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m positive = -1");
hold off;

coefficients_structure(5,3) = -0.1; subplot(5,1,5); hold on;
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180,90,180,-90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m positive = -0.1");
hold off;

%q1.4
%{
    There is a clear hemispherically divided osccilating pattern. This pattern flips in both hemispheres if the positive m coefficient is negative, otherwise, changing the value of the positive m coefficient alone does not alter the oscillating pattern. Most likely, what matters is not the absolute value of these coefficients, but their alues relative to other coefficients.
%}

%q1.5
coefficients_structure = zeros(10,4);
coefficients_structure(:,1) =[0,1,1,2,2,2,3,3,3,3];
coefficients_structure(:,2) = [0,0,1,0,1,2,0,1,2,3];

figure(2); subplot(5,1,1);
coefficients_structure(10,4) = 1; hold on;
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180 90 180 -90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m negative = 1");
hold off; 

coefficients_structure(10,4) = 0.5; subplot(5,1,2); hold on; 
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180,90,180,-90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m negative = 0.5");
hold off;

coefficients_structure(10,4) = 0.1; subplot(5,1,3); hold on;
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180,90,180,-90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m negative = 0.1");
hold off;

coefficients_structure(10,4) = -1; subplot(5,1,4); hold on;
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180,90,180,-90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m negative = -1");
hold off;

coefficients_structure(10,4) = -0.1; subplot(5,1,5); hold on;
[z,lons,lats] = plm2xyz(coefficients_structure,2,[-180,90,180,-90]);
pcolor(lons,lats,z); shading flat; plot(long,lat,'w');title("m negative = -0.1");
hold off;

%{
    With this new set of harmoincs, we see a hemispherically symmetrical oscillating pattern that is much more localized. It is essentially an alternating pattern of circles across the globe. Changing the one negative m coefficient does not change anything unless it is negative, then the pattern flips in the sense that high areas are now dark and low areas are now light.
%}

%q2.1