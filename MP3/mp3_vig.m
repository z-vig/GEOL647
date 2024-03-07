%mp3_vig.m

%q1.1
x = zeros(1000,1); x(650:850) = 1;
plot(x)

%q1.2
c = conv(x,x);
sprintf('The length of c %d',length(c))

%q1.3
plot(c)

%q1.4
%{
    The Shape of x convolved with itself is a triangle. 
%}