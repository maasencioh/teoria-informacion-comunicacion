function varargout = audio_fourier(varargin)
% AUDIO_FOURIER MATLAB code for audio_fourier.fig
%      AUDIO_FOURIER, by itself, creates a new AUDIO_FOURIER or raises the existing
%      singleton*.
%
%      H = AUDIO_FOURIER returns the handle to a new AUDIO_FOURIER or the handle to
%      the existing singleton*.
%
%      AUDIO_FOURIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIO_FOURIER.M with the given input arguments.
%
%      AUDIO_FOURIER('Property','Value',...) creates a new AUDIO_FOURIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before audio_fourier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to audio_fourier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help audio_fourier

% Last Modified by GUIDE v2.5 22-Feb-2016 22:26:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @audio_fourier_OpeningFcn, ...
                   'gui_OutputFcn',  @audio_fourier_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before audio_fourier is made visible.
function audio_fourier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to audio_fourier (see VARARGIN)

% Choose default command line output for audio_fourier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes audio_fourier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = audio_fourier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc;

% Crea la instancia para grabar
fs = str2num(char(get(handles.frecuency, 'String'))); % frecuencia de muestreo
s = str2num(char(get(handles.time, 'String')));       % segundos para grabar
t = 0:1/fs:s-1/fs;                                    % vector de tiempo
recObj = audiorecorder(fs , 8, 1);

% Graba audio
disp('Empieze a hablar.')
recordblocking(recObj, s);
disp('Fin de la grabacion.');

% Guarda la informacion
zoom on
y = getaudiodata(recObj);
soundsc(y);
axes(handles.original);
plot(t, y);
title('Audio');
xlabel('Tiempo (s)');
ylabel('Y(t)');
zoom off

% Transformada de fourier
m = length(y);                % Window length
n = pow2(nextpow2(m));        % Transform length
y_fft = fft(y,n);             % DFT
f = (0:n-1)*(fs/n);           % Frequency range
power = y_fft.*conj(y_fft)/n; % Power of the DFT

% Grafica
zoom on
axes(handles.fourier);
plot(f,power)
title('Transformada de Fourier del audio');
xlabel('Frecuencia (Hz)');
ylabel('|Y(f)|');
zoom off




function frecuency_Callback(hObject, eventdata, handles)
% hObject    handle to frecuency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frecuency as text
%        str2double(get(hObject,'String')) returns contents of frecuency as a double


% --- Executes during object creation, after setting all properties.
function frecuency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frecuency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
