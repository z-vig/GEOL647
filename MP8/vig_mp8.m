%Matlab Practical 8
%Zach Vig

clearvars;
clear;
close all;

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
R_earth = 6378;
avg_lat = mean(lats);
km_deglong = 2*pi*R_earth*cos(avg_lat*pi/180)/360;

a1 = 1/km_deglong; %km/degree of longitude
a2 = 1/km_deglat; %km/degree of latitude
a3 = 1; %km
daspect([a1 a2 a3]);

%q1.3
%{
    The morphology of this swarm is mostly linear with depth.
%}

%q1.4
lats_km_norm = (lats-mean(lats)) .* km_deglong;
longs_km_norm = (lons-mean(lons)) .* km_deglong;
dep_norm = depth-mean(depth);

C = cov([lats_km_norm longs_km_norm dep_norm]);

%{
    0.1762, 0.1115, -0.4608
    0.1115, 0.1699, -0.3964
    -0.4608, -0.3964, 4.6093
%}

%q1.5
eig(C)
%{
    The eigenvalues tell us that one principal component is able to explain ~95% of the variance in the dataset.
%}

%q1.6
index_170 = swarm_index == 170;

lats = swarm_quake(index_170,7);
lons = swarm_quake(index_170,8);
depth = swarm_quake(index_170,9);
figure(2);
plot3(lons,lats,depth,'k+'); set(gca,'zdir','reverse');title('Earthquake Hypocenters');

daspect([a1 a2 a3]);

%{
    The morphology of this swarm is mostly planar.
%}

lats_km_norm = (lats-mean(lats)) .* km_deglong;
longs_km_norm = (lons-mean(lons)) .* km_deglong;
dep_norm = depth-mean(depth);

C = cov([lats_km_norm longs_km_norm dep_norm]);

%{
    0.6677    0.4847   -0.0150
    0.4847    0.8800    0.2930
   -0.0150    0.2930    2.2133
%}

eig(C)
%{
    The eigenvalues tell us that it now takes two dimensions to explain >95% of the dataset, consistent with our observation that this swarm is planar.
%}


%q2.1
load Data_for_Practical8.mat

%q2.2
figure(3); subplot(2,1,1); hold on;
plot(waveform(:,1),waveform(:,2),"DisplayName","waveform");
plot(waveform1(:,1),waveform1(:,2),"DisplayName","waveform1");
xlabel("Time (s)"); ylabel('Amplitude')
legend()
title('No-Noise');
hold off;

%q2.3
%{
    There is about a 5 second delay between waveform and waveform1.
%}

%q2.4
subplot(2,1,2);
[c,lags] = xcorr(waveform(:,2),waveform1(:,2),'coef');
time_per_lag = 2*(waveform(end,1)-waveform(1,1))/length(lags);
lag_time = lags.*time_per_lag;
plot(lag_time,c); xlabel("Lag Time (s)"); ylabel("Correlation Coefficient");

%q2.5
%{
    The maximum cross-correlation coefficient occurs at 5 seconds, which is what we observed in the time-domain plot.
%}

%q2.6
sig = 100;
noisy = waveform(:,2) + sig .* randn(length(waveform(:,2)),1);
noisy1 = waveform1(:,2) + sig .* randn(length(waveform1(:,2)),1);
figure(4); subplot(2,1,1); hold on;
plot(waveform(:,1),noisy,"DisplayName","waveform+noise");
plot(waveform1(:,1),noisy1,"DisplayName","waveform1+noise");
xlabel("Time (s)"); ylabel('Amplitude')
legend()
title('With Some Noise');
hold off;

subplot(2,1,2);
[c,lags] = xcorr(noisy,noisy1,'coef');
plot(lag_time,c); xlabel("Lag Time (s)"); ylabel("Correlation Coefficient");
%{
    It is still clear in the time domain that the offset if 5 seconds, and the cross-correlation confirms this.
%}

%q2.7
sig = 4000;
noisy = waveform(:,2) + sig .* randn(length(waveform(:,2)),1);
noisy1 = waveform1(:,2) + sig .* randn(length(waveform1(:,2)),1);
figure(5); subplot(2,1,1); hold on;
plot(waveform(:,1),noisy,"DisplayName","waveform+noise");
plot(waveform1(:,1),noisy1,"DisplayName","waveform1+noise");
xlabel("Time (s)"); ylabel('Amplitude')
legend()
title('With Lots of Noise');
hold off;

subplot(2,1,2);
[c,lags] = xcorr(noisy,noisy1,'coef');
plot(lag_time,c); xlabel("Lag Time (s)"); ylabel("Correlation Coefficient");
%{
    It is unclear in the time domain what the offset is, but the cross-correlation still clearly shows the offset as 5 seconds.
%}

%q2.8
%{
    In the presence of heavy noise, correlation-based meurements are preferable to picking by a human because it offers a more robust and repeatable method than what a human can produce using their eye.
%}
