t = [0:1/512:512];
y = sin(2*pi*10 .* t) + sin(2*pi*20 .* t);
dy = (2*pi*10)*cos(2*pi*10 .* t) + (2*pi*20)*cos(2*pi*20 .* t);

yft = fft(y);
dyft = fft(dy);
py = yft .* conj(yft);
pdy = dyft .* conj(dyft);

figure(1); subplot(2,1,1);
plot(t,y,'DisplayName','Displacement'); hold on;
plot(t,dy,'DisplayName','Velocity');
xlim([0,30/512])

legend()

subplot(2,1,2); hold on;
plot(t,yft,'DisplayName','Displacement');
plot(t,dyft,'DisplayName','Velocity');

legend()
