function vozGUI
%  Create and then hide the UI as it is being constructed.
f = figure('Visible','off','Position',[360,500,450,285]);

%  Construct the components.
htext = uicontrol('Style','text','String','Frecuencia de salida',...
    'Position',[315,260,70,25]);
hinputtext = uicontrol('Style','edit','String','8000','Position',[315,220,70,25]);
hgraph = uicontrol('Style','pushbutton','String','Graficar',...
    'Position',[315,180,70,25], 'Callback',@graphbutton_Callback);
hrecord = uicontrol('Style','pushbutton','String','Grabar',...
    'Position',[315,140,70,25], 'Callback',@recordbutton_Callback);
hplay = uicontrol('Style','pushbutton','String','Reproducir',...
    'Position',[315,100,70,25], 'Callback',@playbutton_Callback);
ha = uipanel('Units','Pixels','Position',[50,20,250,260]);
htextRec = uicontrol('Style','text','String','',...
    'Position',[315,20,70,25]);
hplayInv = uicontrol('Style','pushbutton','String','Reproducir invertido',...
    'Position',[315,60,70,25], 'Callback',@playinvbutton_Callback);
align([htext,hinputtext,hgraph, hrecord, hplay, hplayInv, htextRec],'Center','None');

% Initialize the UI.
% Change units to normalized so components resize automatically.
set(f,'Units','normalized');
set(ha,'Units','normalized');
set(hgraph,'Units','normalized');
set(htext,'Units','normalized');
set(hinputtext,'Units','normalized');
set(hrecord,'Units','normalized');
set(hplay,'Units','normalized');
set(htextRec,'Units','normalized');
set(hplayInv,'Units','normalized');


recObj = audiorecorder;

movegui(f,'center');
set(f,'Name','Voz');
%Make the UI visible.
set(f,'Visible','on');

    function graphbutton_Callback(source,eventdata)
        y = getaudiodata(recObj);
        
        subplot(2,2,1, 'Parent', ha);
        plot(y)
        title('Señal original')

        subplot(2,2,2, 'Parent', ha);
        y2=flipud(y);
        plot(y2)
        title('Señal invertida')

        y3 = fft(y);
        L = 5000;
        P2 = abs(y3/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);

        subplot(2,2,3, 'Parent', ha);
        Fs = str2num(get(hinputtext, 'string'));
        d_fs = Fs*(0:(L/2))/L;
        plot(d_fs, P1)
        title('Rep. frecuencia')

        y4 = flipud(P1);
        subplot(2,2,4, 'Parent', ha);
        plot(d_fs, y4)
        title('Rep. frecuencia')
        
    end

    function recordbutton_Callback(source,eventdata)
        beep
        set(htextRec,'String','Empiece a hablar');
        recordblocking(recObj, 5);
        set(htextRec,'String','Termino la grabacion');
        beep
    end

    function playbutton_Callback(source,eventdata)
        y = getaudiodata(recObj);
        Fs = str2num(get(hinputtext, 'string'))
        
        sound(y, Fs);
    end

    function playinvbutton_Callback(source,eventdata)
        y = getaudiodata(recObj);
        Fs = str2num(get(hinputtext, 'string'))
        y2=flipud(y);
        sound(y2, Fs);
    end

end