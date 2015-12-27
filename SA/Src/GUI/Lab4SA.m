function varargout = Lab4SA(varargin)
% LAB4SA MATLAB code for Lab4SA.fig
%      LAB4SA, by itself, creates a new LAB4SA or raises the existing
%      singleton*.
%
%      H = LAB4SA returns the handle to a new LAB4SA or the handle to
%      the existing singleton*.
%
%      LAB4SA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB4SA.M with the given input arguments.
%
%      LAB4SA('Property','Value',...) creates a new LAB4SA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Lab4SA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Lab4SA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Lab4SA

% Last Modified by GUIDE v2.5 27-Dec-2015 16:34:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Lab4SA_OpeningFcn, ...
                   'gui_OutputFcn',  @Lab4SA_OutputFcn, ...
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


% --- Executes just before Lab4SA is made visible.
function Lab4SA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Lab4SA (see VARARGIN)

% Choose default command line output for Lab4SA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Lab4SA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Lab4SA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in DataLoad.
function DataLoad_Callback(hObject, eventdata, handles)
% hObject    handle to DataLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%creating a filename using uigetfile
[filename, pathname] = uigetfile( ...
                       {'*.csv';'*.*'}, ...
                        'Pick a file');
 fullpathname=strcat(pathname, filename);
 
 global hf1;
 global hf2;
 [hf1, hf2] = main();
 
 hf1 ( fullpathname ); 
 
% indicate that we use a global variable
    global Number;
    global TimeStamp;
    global AccVoltage;
    global Crankshaft;
    global Additionalgeneratorpower;
    global Consumptionpower;
    global Gridvoltage;
    global Fuel;
    global Accvoltage;
    
% assigning data
    [Number,TimeStamp,AccVoltage,Crankshaft,Additionalgeneratorpower,Consumptionpower,Gridvoltage,Fuel,Accvoltage]=importData(fullpathname);
    
%importing into table
    set(handles.XTable,'Data',[AccVoltage,Crankshaft,Additionalgeneratorpower,Consumptionpower]);
    
    maxSlider = size(Number,1);
    
    set(handles.TimeSlider,'Min',0);
    set(handles.TimeSlider,'Value',0);
    set(handles.TimeSlider,'Max',maxSlider);
    set(handles.TimeSlider, 'SliderStep', [1/(maxSlider-1) , 1/(maxSlider-1) ]);
    
    
    
    





function Y1RiskValue_Callback(hObject, eventdata, handles)
% hObject    handle to Y1RiskValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y1RiskValue as text
%        str2double(get(hObject,'String')) returns contents of Y1RiskValue as a double


% --- Executes during object creation, after setting all properties.
function Y1RiskValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y1RiskValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y2RiskValue_Callback(hObject, eventdata, handles)
% hObject    handle to Y2RiskValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y2RiskValue as text
%        str2double(get(hObject,'String')) returns contents of Y2RiskValue as a double


% --- Executes during object creation, after setting all properties.
function Y2RiskValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y2RiskValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y3RiskValue_Callback(hObject, eventdata, handles)
% hObject    handle to Y3RiskValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y3RiskValue as text
%        str2double(get(hObject,'String')) returns contents of Y3RiskValue as a double


% --- Executes during object creation, after setting all properties.
function Y3RiskValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y3RiskValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function TimeSlider_Callback(hObject, eventdata, handles)
% hObject    handle to TimeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.TimeSlider,'Value',round(get(handles.TimeSlider,'Value')));
set(handles.SliderValue,'String',get(handles.TimeSlider,'Value'));
DrawGraph(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function TimeSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TimeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in PlayButton.
function PlayButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlayButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.PlayButton,'Enable','inactive');
global t;
t = timer('ExecutionMode','fixedDelay','Period',str2num(get(handles.FreqValue,'String')),'TimerFcn',{ @DrawGraph, handles });
% t.timerFcn = @()DrawGraph();
start(t);
global value;
value = 1;

function [] = DrawGraph(hObject, eventdata, handles)

global value;
value = str2num(get(handles.SliderValue,'String'));
value = value+1;
set(handles.SliderValue,'String',value);
set(handles.TimeSlider,'Value',value);

global hf2;
[ R1, Y1, Y2, Y3 ] = hf2(value);
x=value:value+size(Y1)-1;

        global Gridvoltage;
        global Fuel;
        global Accvoltage;

plot(handles.Y1Axes,x,Y1);
plot(handles.Y2Axes,x,Y2);
plot(handles.Y3Axes,x,Y3);

%plot(handles.Y1Axes,x,Gridvoltage(x));
%plot(handles.Y2Axes,x,Fuel(x));
%plot(handles.Y3Axes,x,Accvoltage(x));

handles.Y1Axes.YLim = [8 14];
handles.Y2Axes.YLim = [0 50];
handles.Y3Axes.YLim = [8 14];

handles.Y1Axes.XLim = [value, value+size(Y1,1)-1];
handles.Y2Axes.XLim = [value, value+size(Y1,1)-1];
handles.Y3Axes.XLim = [value, value+size(Y1,1)-1];

set(handles.Risk1,'String',R1(1));
set(handles.Risk2,'String',R1(2));
set(handles.Risk3,'String',R1(3));
set(handles.Risk4,'String',R1(4));
set(handles.Risk5,'String',R1(5));
set(handles.Risk6,'String',R1(6));






% --- Executes on button press in PauseButton.
function PauseButton_Callback(hObject, eventdata, handles)
% hObject    handle to PauseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.PlayButton,'Enable','on');
global t;
delete(t);


% --- Executes on button press in StopButton.
function StopButton_Callback(hObject, eventdata, handles)
% hObject    handle to StopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global t;
stop(t);
delete(t);

function SliderValue_Callback(hObject, eventdata, handles)
% hObject    handle to SliderValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SliderValue as text
%        str2double(get(hObject,'String')) returns contents of SliderValue as a double

global value;
value = str2num(get(handles.SliderValue,'String'));
set(handles.TimeSlider,'Value',value);
Drawgraph(hObject, eventdata, handles);





% --- Executes during object creation, after setting all properties.
function SliderValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FreqValue_Callback(hObject, eventdata, handles)
% hObject    handle to FreqValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreqValue as text
%        str2double(get(hObject,'String')) returns contents of FreqValue as a double


% --- Executes during object creation, after setting all properties.
function FreqValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreqValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Risk1_Callback(hObject, eventdata, handles)
% hObject    handle to Risk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Risk1 as text
%        str2double(get(hObject,'String')) returns contents of Risk1 as a double


% --- Executes during object creation, after setting all properties.
function Risk1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Risk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Risk2_Callback(hObject, eventdata, handles)
% hObject    handle to Risk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Risk2 as text
%        str2double(get(hObject,'String')) returns contents of Risk2 as a double


% --- Executes during object creation, after setting all properties.
function Risk2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Risk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Risk3_Callback(hObject, eventdata, handles)
% hObject    handle to Risk3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Risk3 as text
%        str2double(get(hObject,'String')) returns contents of Risk3 as a double


% --- Executes during object creation, after setting all properties.
function Risk3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Risk3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Risk4_Callback(hObject, eventdata, handles)
% hObject    handle to Risk4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Risk4 as text
%        str2double(get(hObject,'String')) returns contents of Risk4 as a double


% --- Executes during object creation, after setting all properties.
function Risk4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Risk4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Risk5_Callback(hObject, eventdata, handles)
% hObject    handle to Risk5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Risk5 as text
%        str2double(get(hObject,'String')) returns contents of Risk5 as a double


% --- Executes during object creation, after setting all properties.
function Risk5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Risk5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Risk6_Callback(hObject, eventdata, handles)
% hObject    handle to Risk6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Risk6 as text
%        str2double(get(hObject,'String')) returns contents of Risk6 as a double


% --- Executes during object creation, after setting all properties.
function Risk6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Risk6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
