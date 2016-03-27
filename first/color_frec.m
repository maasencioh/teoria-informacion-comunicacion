% Frecuencia segun color
% violeta  - 607.542 Hz
% azul     - 573.891 Hz
% cyan     - 551.154 Hz
% verde    - 478.394 Hz
% amarillo - 462.023 Hz
% naranja  - 440.195 Hz
% rojo     - 363.797 Hz

f = 607.542;

N = 10000;
tmin = 0;
tmax = 100;
t = linspace(tmin, tmax, N);
y = sin(2*pi*f*t);
soundsc(y);