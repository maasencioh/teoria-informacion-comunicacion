clear all; close all; clc;

N = 1000;
tmin = -3;
tmax = 3;
t = linspace(tmin, tmax, N);
y = t.^2;
a0= pi*pi/3;
a1= a0 + ((2*pi*pi - 4)*sinc(pi)+4*pi*cos(pi)/pi)*cos(t);
a2= a1 + ((2*pi*pi - 4/(2^2))*sinc(2*pi)+(4*pi/2)*cos(2*pi)/(2*pi))*cos(2*t);
a3= a2 + ((2*pi*pi - 4/(3^2))*sinc(3*pi)+(4*pi/3)*cos(3*pi)/(3*pi))*cos(3*t);
a4= a3 + ((2*pi*pi - 4/(4^2))*sinc(4*pi)+(4*pi/4)*cos(4*pi)/(4*pi))*cos(4*t);
a5= a4 + ((2*pi*pi - 4/(5^2))*sinc(5*pi)+(4*pi/5)*cos(5*pi)/(5*pi))*cos(5*t);

figure
hold on
plot(t,y,'b-','LineWidth',3);
plot(t,a0,'k-');
plot(t,a1,'k-');
plot(t,a2,'k-');
plot(t,a3,'k-');
plot(t,a4,'k-');
plot(t,a5,'k-');
title('Senal periodica');
xlabel('t');
ylabel('f(t)');
hold off
grid on;