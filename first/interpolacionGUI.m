function interpolacionGUI
%  Create and then hide the UI as it is being constructed.
f = figure('Visible','off','Position',[360,500,450,285]);

%  Construct the components.
htext = uicontrol('Style','text','String','Frecuencia de muestreo',...
    'Position',[315,220,70,25]);
hinputtext = uicontrol('Style','edit','Position',[315,180,70,25]);
hgraph = uicontrol('Style','pushbutton','String','Int. lineal',...
    'Position',[315,140,70,25], 'Callback',@graphbutton_Callback);
hgraphsp = uicontrol('Style','pushbutton','String','Int. P. Lagrange',...
    'Position',[315,100,70,25], 'Callback',@graphspbutton_Callback);
ha = axes('Units','Pixels','Position',[50,60,200,185]);
align([htext,hinputtext,hgraph, hgraphsp],'Center','None');

% Initialize the UI.
% Change units to normalized so components resize automatically.
set(f,'Units','normalized');
set(ha,'Units','normalized');
set(hgraph,'Units','normalized');
set(hgraphsp,'Units','normalized');
set(htext,'Units','normalized');
set(hinputtext,'Units','normalized');

% Generate the data to plot.

frec = 1;  % Hz
N = 100;
T = 1/frec;
tmin = 0.1;
tmax = 4*T;
t = linspace(tmin, tmax, N);
ya = sin(2*pi*frec * t)/t;
plot(t,ya);
xlabel('t (seconds)');
grid

movegui(f,'center');
set(f,'Name','Interpolacion');
%Make the UI visible.
set(f,'Visible','on');

    function graphbutton_Callback(source,eventdata)
        x = str2num(get(hinputtext, 'string'))
        Fs = x*frec;
        T = 1/Fs;
        nmin = ceil(tmin / T);
        nmax = floor(tmax / T);
        n = nmin:nmax;
        vq1 = interp1(t,ya, n*T);
        hold on
        plot(t,ya,n*T,vq1,':.');
        grid
        hold off
    end

    function graphspbutton_Callback(source,eventdata)
        xf = str2num(get(hinputtext, 'string'))
        Fs = xf*frec;
        T = 1/Fs;
        nmin = ceil(tmin / T);
        nmax = floor(tmax / T);
        xi = 0.1:0.01:4;
        N = 5
        x = linspace(tmin, tmax, N);
        y = sin(2*pi*frec * x)/x;
        
        n = length(x) - 1
        ni = length(xi)
        L = ones(ni,n+1); 
        
        for j = 1 : (n+1)
            for i = 1 : (n+1)
                if (i ~= j)
                    L(:,j) = L(:,j).*(xi' - x(i))/(x(j)-x(i));
                end
            end
        end
        
        yi = y*L';
        
        plot(t,ya,xi,yi,'r.');
        grid
        
    end

end