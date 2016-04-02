clear all; close all; clc;

N = 1000;
tmin = -3;
tmax = 3;
t = linspace(tmin, tmax, N);
y = t.*sin(t);
a= pi/2;

figure
hold on
plot(t,y,'b-','LineWidth',3);
for n = 2:6
    plot(t,a,'k-');
    a = a + ((4* sin(pi*n)-2*pi *((n^2)-1)* cos(pi *n))/((n^2)-1)^2) * cos(n*t);
end

title('Senal periodica');
xlabel('t');
ylabel('f(t)');
hold off
grid on;