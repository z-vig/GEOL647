%MP2 for GEOL647

clear;
clearvars;

%q1.4
freq = linspace(0.3,100,10000);
w = 2*pi*freq;


%q1.5
k_M = 400*pi^2;
D_M = 0.05;
ARF = w.^2 ./ (sqrt((k_M - w.^2) .^ 2 + (D_M .* w) .^ 2));
plot(w,ARF,'DisplayName',num2str(D_M))
xlabel('Frequency');ylabel('Amplitude Response')
%The seismometer is most sensitive at about 63 rad^-1, or 10 Hz

%q1.6
set(gca,'xscale','log','yscale','log')
%The sensitivity of the seismometer below the resonant is higher than the sensitivity above the resonant frequency.

%q1.7
hold on;
for i = [0.3,1,3,10]
    ARF = w.^2 ./ (sqrt((k_M - w.^2) .^ 2 + (i .* w) .^ 2));
    plot(w,ARF,'DisplayName',num2str(i))
end

legend

%As D/M increases, the overshoot in the ARF at the resonant frequency is decreased.

%q1.8
figure;
xlabel('Frequency');ylabel('Phase Delay')
hold on;
for i = [0.05,0.3,1,3,10]
    PD = atan2(-w .* i,k_M - w .^ 2);
    plot(w,PD,'DisplayName',num2str(i))
end

legend
%Damping causes a "smoothing out" effect in the phase delay around the resonant frequency. At low D/M, the phase delay occurs abruptly at the resonant frequency, but an increase in D/M causes this change to occur more gradually.

%q1.9
%Based on the results of 7 and 8, a value of D/m that is somehwere in the middle between 0.05 and 10, say, 3 would be the ideal balance between a signal that is the most even, but also the least distorted.

%q1.10

figure;
xlabel('Frequency');ylabel('Amplitude Response')
set(gca,'xscale','log','yscale','log')
hold on;
D_M = 3;
for i = linspace(16*pi^2,16000*pi^2,10)
    ARF = w.^2 ./ (sqrt((i - w.^2) .^ 2 + (D_M .* w) .^ 2));
    plot(w,ARF,'DisplayName',num2str(i))
end
legend

f = figure;
xlabel('Frequency');ylabel('Phase Delay')
hold on;
for i = linspace(16*pi^2,16000*pi^2,10)
    PD = atan2(-w .* D_M,i - w .^ 2);
    plot(w,PD,'DisplayName',num2str(i))
end
legend

%Changing k/M changes the resonant frequency of the seismometer, so it shifts the peak and the dropoff for the ARF and the PD, respectively.

%q.11

%To maximize sensitivity for long period motion (i.e. low frequency), I would reduce k and increase m. D does not changes the sensitivity, but rather the distortion of the signal.
