%{
    Matlab Practical 6 by Zach Vig
%}

clearvars; clear;

%q1.1
d = importdata("ANMO_z.txt");
t = d(:,1);
c = d(:,2);
figure(1);
plot(t,c,'DisplayName','Raw'); title("Raw Data"); xlabel("Time (s)"); ylabel("Counts");
% xline([200,400,580,700,1300,1450,1640,2400]);
% xlim([580,700]);

%q1.2
%a. There is just some background noise. There is not any signal here, but it has a frequency of roughly 6 seconds. This could be due to waves hitting the shore on the continent.

%b. This is the onset in some low amplitude signal and that lasts until 1300 seconds.It has roughly the same frequency as part a.

%c. Here the signal increases in amplitude slightly, but this is pretty short lived and only occurs in this time interval.

%d. In this interval, the signal is the highest amplitude. It peaks in the center of the time interval after growing and before fading back to roughly the signal amplitude seen in part c.

%q1.3
%There is one sample taken every 0.05 seconds, so the sampling frequency is 20 Hz, so the nyquist frequency is 10 Hz.

%q1.4
[b,a] = butter(4,0.01,'low');
% fvtool(b,a);

%q1.5
figure(1); hold on;
c_filt = filtfilt(b,a,c);
plot(t,c_filt,'DisplayName','Filtered');
legend();
hold off;


%q2.1
f = linspace(0,0.1,1000);
figure(2);
spectrogram(c,2048,1024,f,20,'yaxis'); title('Raw Spectrogram');

%q2.2
c_dtr = detrend(c_filt);
figure(3); hold on;
plot(t,c_filt,'DisplayName','Raw');title('Part 2 Signal');xlabel('Time (s)'); ylabel('Counts');
plot(t,c_dtr,'DisplayName','Detrended');
legend();
hold off;
figure(4);
spectrogram(c_dtr,2048,1024,f,20,'yaxis');
%{
    Our signal was shifted up so that it is centered around zero and it is completly flat except for the amplitude of the signal. The spectrogram no longer has a frequency offset in the beginning. Otherwise, the shapes are the same.
%}

%q2.3
%{
    There is a low frequency signal early on in the spectrogtram, from roughly 0-10 minutes. This feature abprutly changes at ~10 minutes to include moderate amplitude signals of higher freqeuncies. Then, at ~28 minutes, a large amplitude signal is seen that curves to later times at higher frequencies. This feature starts with low frequencies from ~10-30 Hz and ends with higherfrequencies from ~40-60 Hz. This is the result of lower frequency waves arriving before higher freqeuncy waves.
%}

%q2.4
%{
    Yes, the speed of Rayleigh Wave propagation is directly related to their period. That is, low frequency, long period waves are faster and thus arrive before high frequency, short period waves, which are slower. Small period = small speed.
%}

%q2.5
%{
    Depths of maximum sensitivity = 1/3 * wavelength = 1/3 *velocity*period
    3.9*100/3 = 130km
    3.9*80/3 = 104km
    3.9*60/3 = 78km
    3.9*50/3 = 65km
    3.9*40/3 = 52km
    3.9*30/3 = 39km
    3.9*20/3 = 26km
%}

%q2.6
%{
    Since the fastest waves are the ones with low frequencies (i.e. long periods and the ones that "feel" deep in the Earth), I can infer that Vs increases with depth, since Vs and propagation velocity are directly related. In other words, the waves that feel the deepest move the fastest because Vs is higher at depth. 
%}

%q2.7
[b1,a1] = butter(4,0.001,'low');
[b2,a2] = butter(4,0.003,'low');
[b3,a3] = butter(4,0.005,'low');
[b4,a4] = butter(4,0.01,'low');

cfilt_1 = detrend(filtfilt(b1,a1,c));
cfilt_2 = detrend(filtfilt(b2,a2,c));
cfilt_3 = detrend(filtfilt(b3,a3,c));
cfilt_4 = detrend(filtfilt(b4,a4,c));

figure(5); hold on;
subplot(2,2,1);spectrogram(cfilt_1,2048,1024,f,20,'yaxis');title("N=4, Wn=0.001")
subplot(2,2,2);spectrogram(cfilt_2,2048,1024,f,20,'yaxis');title("N=4, Wn=0.003")
subplot(2,2,3);spectrogram(cfilt_3,2048,1024,f,20,'yaxis');title("N=4, Wn=0.005")
subplot(2,2,4);spectrogram(cfilt_4,2048,1024,f,20,'yaxis');title("N=4, Wn=0.1")
hold off;

%{
    Changing Wn, the cutoff frequency for the lowpass filter, affects which frequencies can be seen in the spectrogram. At very low Wn, most of the frequencies in the spectrogram are very low power, but at higher Wn, all the frequencies that are in the signal can be seen at their true power, since they are not being filtered out by the lowpass filter. For example, when Wn = 0.0001, only frequencies below 0.001*20Hz ~ 10mHz could be seen, but at Wn = 0.1*20Hz ~ 200mHz, all of the frequencies in the signal could be seen.
%}