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
c_dtr = detrend(c);
figure(3); hold on;
plot(t,c,'DisplayName','Raw');title('Part 2 Signal');xlabel('Time (s)'); ylabel('Counts');
plot(t,c_dtr,'DisplayName','Detrended');
legend();
hold off;
figure(4);
spectrogram(c_dtr,2048,1024,f,20,'yaxis');
%{
    Our signal was shifted up so that it is centered around zero and it is completly flat except for the amplitude of the signal. The spectrogram no longer has a frequency offset in the beginning. Otherwise, the shapes are the same.
%}
