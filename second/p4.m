clear all; close all; clc;

N = 1000;
tmin = -3;
tmax = 3;
t = linspace(tmin, tmax, N);

y1=(pi+t).*(-pi<=t & t<=0);
y2=(t).*(0<t & t<=pi);
y=y1+y2;

a = pi/2;

figure
hold on
plot(t,y,'b-','LineWidth',3);

for n = 1:10
    a = a + ( ((sin(pi*n)/n)*cos(n*t)) + (2*sin(pi*n)-pi*n*cos(n*pi)-pi*n)/(n^2)*sin(n*t));
    plot(t,a,'k-');
end

title('Senal periodica');
xlabel('t');
ylabel('f(t)');
hold off
grid on;