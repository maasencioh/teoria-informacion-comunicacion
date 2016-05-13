function aliasingGUI
%  Create and then hide the UI as it is being constructed.
f = figure('Visible','off','Position',[360,500,450,285]);

%  Construct the components.
htext = uicontrol('Style','text','String','Frecuencia de muestreo',...
    'Position',[315,220,70,25]);
hinputtext = uicontrol('Style','edit','Position',[315,180,70,25]);
hgraph = uicontrol('Style','pushbutton','String','Graficar',...
    'Position',[315,140,70,25], 'Callback',@graphbutton_Callback);
ha = axes('Units','Pixels','Position',[50,60,200,185]);
align([htext,hinputtext,hgraph],'Center','None');

% Initialize the UI.
% Change units to normalized so components resize automatically.
set(f,'Units','normalized');
set(ha,'Units','normalized');
set(hgraph,'Units','normalized');
set(htext,'Units','normalized');
set(hinputtext,'Units','normalized');

% Generate the data to plot.

frec = 1;  % Hz
N = 100;
T = 1/frec;
tmin = 0;
tmax = 4*T;
t = linspace(tmin, tmax, N);
ya = cos(2*pi*frec * t);
plot(t,ya);
xlabel('t (seconds)');
grid

movegui(f,'center');
set(f,'Name','Aliasing');
%Make the UI visible.
set(f,'Visible','on');

    function graphbutton_Callback(source,eventdata)
        x = str2num(get(hinputtext, 'string'))
        Fs = x*frec;
        T = 1/Fs;
        nmin = ceil(tmin / T);
        nmax = floor(tmax / T);
        n = nmin:nmax;
        x1 = cos(2*pi*t);
        plot(t,ya,'b-');
        hold on
        %plot(n*T,x1,'r-')
        plot(t,x1,'r-')
        hold off
        grid
    end

end