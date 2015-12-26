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

% Last Modified by GUIDE v2.5 26-Dec-2015 14:26:27

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


% --- Executes on button press in PauseButton.
function PauseButton_Callback(hObject, eventdata, handles)
% hObject    handle to PauseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in StopButton.
function StopButton_Callback(hObject, eventdata, handles)
% hObject    handle to StopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)