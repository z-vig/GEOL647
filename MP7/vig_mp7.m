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
load Harmonics/GUFM1.mat

power = zeros(14);
for i = 1:14
    A = MAG(MAG(:,1) == i,3:4);
    power(i) = sum(A(:) .^ 2);
end

figure(3); subplot(2,1,1);
plot(1:14,power); yscale('log');xlabel('Spherical Harmonic Degree');ylabel('Log Power'); title('Power');
%{
    The lowest degrees have the highest power, and the power decreases with increasing spherical harmonic degree.
%}

%q2.2
subplot(2,1,2); hold on;
scatter(MAG(:,1),abs(MAG(:,3)),"DisplayName","Positive m");
scatter(MAG(:,1),abs(MAG(:,4)),"DisplayName","Negative m");
yscale('log');xlabel('Spherical Harmonic Degree'); ylabel('Coefficients'); title('Coefficients');
legend(); hold off;
%{
    a. The largest coefficient occurs as l=1, m=0.
    b. This corresponds to the north-south dichotomy of the magnetic field (i.e. the north and south poles of the Earth)
    c. Compasses use this characteristic of the magnetic field! (and also all technology that uses compasses, like Cellphones, GPS, etc...)
%}

%q2.3
[z,lons,lats] = plm2xyz(MAG,2,[-180,90,180,-90]);

%q2.4
figure(4); hold on;
pcolor(lons,lats,z); shading flat; plot(long,lat,"w"); colorbar(); title('World Magnetic Field Model')
hold off;
%{
    a. I expected the field to look like it was split hemispherically, due to the north and south magnetic poles of the Earth. For the most part, this is what the model looks like, although there are some complications, such as where the magnetic field is weaker at low latitiudes at around 0 longitude.
    b. Deviations from a purely dipolar magnetic field are most prominent around 0 degrees longitude.
%}

%q2.5
MAG(1,3) = 0;
[z,lons,lats] = plm2xyz(MAG,2,[-180,90,180,-90]);
figure(5); hold on;
pcolor(lons,lats,z); shading flat; plot(long,lat,"w"); colorbar(); title('World Magnetic Field Model - Dominant Harmonic Removed')
hold off;
%{
    There is no longer an apparent noth-south dipolar field, rather there is an interesting magnetic high roughly over Australia.
%}

%q2.6
a_r = 6371/3481;
MAG(1,3) = -42101;
MAG_CMB = zeros(size(MAG));
for i = 1:length(MAG)
    MAG_CMB(i,:) = [MAG(i,1),MAG(i,2),(a_r^(MAG(i,1)+1))*MAG(i,3),(a_r^(MAG(i,1)+1))*MAG(i,4)];
end

%q2.7
[z,lons,lats] = plm2xyz(MAG_CMB,2,[-180,90,180,-90]);
figure(6); hold on;
pcolor(lons,lats,z); shading flat; plot(long,lat,"w"); colorbar(); title('World Magnetic Field at the CMB')
hold off;

%q2.8
%{
    The magnetic field at the CMB has many more shorter wavelength features thna the magnetic field on the surface. The Amplitudes also do not show a distinct dipolar field pattern, but are rather semi-equally distributed across latitudes and longitudes. The highest amplitude is seen at 80 degrees latitude and 100 degrees longitude.
%}

%q2.9
%{
    1. In the south, there is a semi-linear feature stretching from 60S,100W to 80S,100E. The high points are at either end of the feature, with most of the change in latitude happening around 0 longitude.
    2. The highest magnetic field strength occurs in a blob centered around 80N,100E. It may be important to track the size and shape of this feature through time.
    3. The lowest magnetic field feature is a blob centered at 80S,100W, almost antipodal of th highest magnetic field feature.
    4. Finally, there is a wavy feature stretching around the sphere at around 0 latitude. The wavelength and ampltiude of the this feature may be important to mantle dynamics.
%}

%q2.10
%{
    The mantle/crust have a low-pass filtering effect on the magnetic field, which eminates from the core, since all of the high-frequency magnetic field variations are washed out at the surface.
%}
