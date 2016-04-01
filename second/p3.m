clear all; close all; clc;

N = 1000;
tmin = -3;
tmax = 3;
t = linspace(tmin, tmax, N);
y = t;
a0= 0;
a1= a0 + (2/1*sinc(1*pi)-2*pi*cos(1*pi)/(1*pi))*sin(1*t);
a2= a1 + (2/2*sinc(2*pi)-2*pi*cos(2*pi)/(2*pi))*sin(2*t);
a3= a2 + (2/3*sinc(3*pi)-2*pi*cos(3*pi)/(3*pi))*sin(3*t);
a4= a3 + (2/4*sinc(4*pi)-2*pi*cos(4*pi)/(4*pi))*sin(4*t);
a5= a4 + (2/5*sinc(5*pi)-2*pi*cos(5*pi)/(5*pi))*sin(5*t);

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