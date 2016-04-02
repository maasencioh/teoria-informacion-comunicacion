clear all; close all; clc;

N = 1000;
tmin = 0;
tmax = 2*pi;
t = linspace(tmin, tmax, N);
y = cos(10*t) + cos((10 + pi)*t);

figure
plot(t,y);
title('Senal no periodica');
xlabel('t');
ylabel('f(t)');
grid on;