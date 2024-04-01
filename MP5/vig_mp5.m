%Matlab practical 5 by Zach Vig

clear;clearvars;

%q1.1
data = importdata('HRV_Okhotsk_2013.txt');
d = data.data;

%q1.2
t = 0:1:size(d,2);

%q1.3
figure(1);
plot(d,'DisplayName','Raw'); title('Timeseries'); xlabel('Time(s)'); ylabel('Ground Velocity (m/s)');

%q1.4
dft = fft(d);
pft = dft.*conj(dft);
freq = 1/length(d):1/length(d):1;
freq = freq .* 1000;

figure(2);
plot(freq,pft,'DisplayName','Raw'); title('Power Spectra');
xlabel('Frequency (Hz)'); ylabel('Power');

%q1.5
d(1.5*10^5:end) = 0;
figure(1); hold on;
plot(d,'DisplayName','Corrected'); legend();
hold off;

%q1.6
figure(2); hold on;
pft_corrected = fft(d).*conj(fft(d));
plot(freq,pft_corrected,'DisplayName','Corrected');
hold off;

%q1.7
%{
    At long periods, the power spectra very most significantly. This difference is muted at shorter periods (higher frequencies), which makes sense because the anomaly occured well after the initial signal.
%}

%q2.1
tw = tukeywin(length(d),0.1);
figure(3);
plot(tw,'DisplayName','Tukey');title('Windowing Functions');

%q2.2
d_tw = d .* tw;
d_tw_ft = fft(d_tw);
p_twft = d_tw_ft .* conj(d_tw_ft);
figure(2); hold on;
plot(freq,p_twft,'DisplayName','Tukey Windowed'); xlabel('Frequency (mHz)'); ylabel('Power');
legend();
hold off;

%q2.3
%{ 
    Much of the long period power signals were elminated. Also, the power was dcreased between major peaks.
%}

%q2.4
h = hann(length(d));
figure(3); hold on;
plot(h,'DisplayName','Hann'); legend();
hold off;

%q2.5
d_h = d .* h;
d_h_ft = fft(d_h);
p_hft = d_h_ft .* conj(d_h_ft);
p_hft = 3*10^(-4) .* p_hft ./ max(p_hft);
figure(2); hold on;
plot(freq,p_hft,'DisplayName','Hann (Normalized)'); legend();

%q2.6
%{
    There is clearly less spectral leakage from the hann filter, since the power between peaks is much lower, but the peaks themselves are much less defined (i.e. less sharp), meaning that there is lower spectral resolution.
%}

%q2.7
%{
    I think selecting your windowing function is very important and, like everything in geophysics, depends on your application. 
%}

%q3.1
model1 = importdata('pred_freqs_model1.txt');
model2 = importdata('pred_freqs_model2.txt');
measured_peaks = importdata('HRV_powerpeaks.txt');
figure(4); hold on;
scatter(model1(:,1),model1(:,2),'DisplayName','Model 1');title('Earth Models');
scatter(model2(:,1),model2(:,2),'DisplayName','Model 2');ylabel('Frequency (mHz)');xlabel('Wavenmuber cm^-1');
plot(measured_peaks(:,1),measured_peaks(:,2),'DisplayName','Measured Peaks');
ylim([2,4.5]);
legend();
hold off;
figure(2);xlim([2,4.5]);
%{
    Among many, there is a peak at ~2.35 mHz that corresponds to a wavenumber of 15 cm^-1 and a peak at ~3.27 mHz that corresponds to a wavenumber of 24 cm^-1. I compiled a list of the peaks and their corresponding wavenumber and plotted them against the two Earth models.
%}

%q3.2
figure(5); hold on;
m1_diff = abs(model1(1+measured_peaks(:,1),2) - measured_peaks(:,2));
m2_diff = abs(model2(1+measured_peaks(:,1),2) - measured_peaks(:,2));
plot(m1_diff,'DisplayName','Model 1 Difference'); title('Model Testing');
plot(m2_diff,'DisplayName','Model 2 Difference'); xlabel('Wavenumber (cm^-1)'); ylabel('|Model - Data|');
legend();
hold off;
%{
    Earth model 1 clearly predicts Earth's normal mode frequencies better, since it aligns with the measured data better. The error when the data is plotted against the model is much lower for model 1 (see figure 5).
%}

%q3.3
%{
    We can infer that the velocity of S waves in the upper mantle are ~4600 m/s.
%}

%q3.4
%{
    An ideal timeseries would be taken over a very long deployment time to maximize spectral resolution, and it would stop exactly after an integer number of periods for a given normal mode to minimize the need for windowing.
%}