%mp3_vig.m

%q1.1
x = zeros(1000,1); x(650:850) = 1;
plot(x)

%q1.2
c = conv(x,x);
sprintf('The length of c %d',length(c))

%q1.3
figure; 
plot(c),title('q1.3');

%q1.4
%{
    The Shape of x convolved with itself is a triangle offset to the right of the center. The shape is due to the fact that as the two signals overlap, the area increases to a maximum value when the two signals are directly on top of one another and decreases as they move apart. The horizontal position is because one of the signals is flipped. If they were not flipped, th peak would be directly in the middle, since the two signals would overlap perfectly when their indices line up.
%}

%q1.5
figure; 
plot(conv(c,c)),title('q1.5');

%q1.6
%{
    This plot also rises to a peaked value at some point to the right of the plot, but it also looks more like a gaussian than a triangle. Overall, this function is smoother than the function of x convolved with itself. This smoothing effect is because the convolution is essentially performing a weighted average of sorts over the entire curve, where the weights are the curve itself. Once again, the position of the peak is due to the flipping of one of the convolved functions.
%}

%q1.7
u = fft(c);
plot(abs(u(1:2:end)),'DisplayName','FFT(c)'); set(gca,'xscale','log')

%q1.8
hold on;
plot(abs(fft(x).*fft(x)),'DisplayName','FFT(x)*FFT(x)')
legend()
xlim([0 100])