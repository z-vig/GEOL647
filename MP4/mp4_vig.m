%{
    Matlab Practical 4 by Zach Vig
%}

clear;
clearvars;

%q1.1
Fs = 512;

%q1.2
t = 1/Fs : 1/Fs : 2;

%q1.3
figure(1);subplot(2,1,1);
yfreq = 30;
y = sin(2*pi*yfreq.*t);
plot(t,y);title('q1.3');
xlabel('Time (s)');ylabel('Signal');

%q1.4
%{
    I would probably figure out how long one period of the sine wave takes,
    then take the inverse of that number to get the frequency.
%}

%q1.5
figure(2);
yft = fft(y)./length(t);
P = yft.*conj(yft);
plot(t,P);title('q1.5');

%q1.6
n = 0:length(y)-1;
w = n./(range(t));

%q1.7
figure(1);subplot(2,1,2);
set(gca);
hold on;
plot(w,P,'DisplayName','PowerSpectrum','color','k');
xlabel('Frequency (Hz)');ylabel('Power');

%q1.8
h = spectrum.periodogram;
ps = msspectrum(h,y,'Fs',Fs);
plot(ps.Frequencies,ps.Data,'DisplayName','Periodogram','color','r');
legend();

%q1.9
%{
    The power spectrum peaks at both 30 and at 482 Hz, which correspond to the input frequency and to the sampling frequency - the input frequency. The Mean Squared spectrum only peaks at 30 Hz, but with twice the intensity.
%}

%q1.10
yfreq2 = 40;
y2 = sin(2*pi*yfreq2.*t);
figure(3);subplot(2,1,1);
plot(t,y2);title('q1.10');
xlabel('Time (s)');ylabel('Signal');

subplot(2,1,2);
hold on;
y2ft = fft(y2)./length(t);
P = y2ft.*conj(y2ft);
plot(w,P);title('q1.10 Power')
xlabel('Frequency (Hz)');ylabel('Power');

h2 = spectrum.periodogram;
ps2 = msspectrum(h2,y2,'Fs',Fs);
plot(ps2.Frequencies,ps2.Data,'r--');

%q.11
figure(4);subplot(2,1,1);
y3 = y+y2;
plot(t,y3);title('q1.11')
xlabel('Time (s)');ylabel('Signal');

subplot(2,1,2);
hold on;
y3ft = fft(y3)./length(t);
P = y3ft.*conj(y3ft);
plot(w,P);
xlabel('Frequency (Hz)');ylabel('Power');

h3 = spectrum.periodogram;
ps3 = msspectrum(h3,y3,'Fs',Fs);
plot(ps3.Frequencies,ps3.Data,'r--');