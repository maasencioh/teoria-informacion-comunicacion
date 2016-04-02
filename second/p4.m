clear all; close all; clc;

N = 1000;
tmin = -3;
tmax = 3;
t = linspace(tmin, tmax, N);
y = t.*sin(t);
a = pi;

figure
hold on
plot(t,y,'b-','LineWidth',3);

for n = 2:6
    a = a + ( (sin(pi/n)/n)*cos(n*t) + (2*sin(pi*n)-pi*n*cos(n*pi)-pi*n)/(n^2));
    plot(t,a,'k-');
end

title('Senal periodica');
xlabel('t');
ylabel('f(t)');
hold off
grid on;