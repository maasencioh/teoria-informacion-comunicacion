clear all; close all; clc;

N = 1000;
tmin = 0;
tmax = 2*pi;
t = linspace(tmin, tmax, N);
y = sin(t) + (1/3).*sin(3.*t)+ (1/5).*sin(5.*t);

figure
plot(t,y);
title('Senal periodica');
xlabel('t');
ylabel('f(t)');
grid on;