%Matlab Practical 8
%Zach Vig

clearvars;
clear;

%q1.1
load swarm_catalog_NC.mat

%q1.2
index_123 = swarm_index==123;
lats = swarm_quake(index_123,7);
lons = swarm_quake(index_123,8);
depth = swarm_quake(index_123,9);
figure(1);
plot3(lons,lats,depth,'k+'); set(gca,'zdir','reverse');title('Earthquake Hypocenters');

km_deglat = 111;
km_deglong = 111;

a1 = 1/km_deglong; %km/degree of longitude
a2 = 1/km_deglat; %km/degree of latitude
a3 = 1; %km
daspect([a1 a2 a3]);

%q1.3
%{
    Linear...
%}

%q1.4
lats_km_norm = (lats-mean(lats)) .* km_deglong;
longs_km_norm = (lons-mean(lons)) .* km_deglong;
dep_norm = depth-mean(depth);

%q1.5
C = cov([lats_km_norm longs_km_norm dep_norm]);
eig(C)

%q1.6 swarm 170...

%q2.1 etc...