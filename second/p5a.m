clear all; close all; clc;
a = 2;
b = 5;

N = 1000;
tmin = 0;
tmax = 10;
t = linspace(tmin, tmax, N);
y = sin(2*pi*t/(b-a));

figure
plot(t,y);
title('Senal periodica con b=5 y a=2');
xlabel('t');
ylabel('f(t)');
grid on;