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
h = spectrum.periodogram;
ps = msspectrum(h,y,'Fs',Fs);
plot(ps.Frequencies,ps.Data,'DisplayName','Periodogram','color','r');
legend();

