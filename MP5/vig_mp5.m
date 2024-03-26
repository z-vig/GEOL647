%Matlab practical 5 by Zach Vig

clear;clearvars;

%q1.1
data = importdata('HRV_Okhotsk_2013.txt');
d = data.data;

%q1.2
t = 0:1:size(d,2);

%q1.3
figure(1);
plot(d); xlabel('Time(s)'); ylabel('Ground Velocity (m/s)');

%q1.4
dft = fft(d);
pft = dft.*conj(dft);
freq = 1/length(d):1/length(d):1;

figure(2);
plot(freq,pft); xlim([0.0001,0.005]);
xlabel('Frequency (Hz)'); ylabel('Power');

%q1.5
d(1.5*10^5:end) = 0;

%q1.6
hold on;
pft_corrected = fft(d).*conj(fft(d));
plot(freq,pft_corrected);
