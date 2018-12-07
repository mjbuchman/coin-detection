function varargout = manualRadiusGUI(varargin)
% MANUALRADIUSGUI MATLAB code for manualRadiusGUI.fig
%      MANUALRADIUSGUI, by itself, creates a new MANUALRADIUSGUI or raises the existing
%      singleton*.
%
%      H = MANUALRADIUSGUI returns the handle to a new MANUALRADIUSGUI or the handle to
%      the existing singleton*.
%
%      MANUALRADIUSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUALRADIUSGUI.M with the given input arguments.
%
%      MANUALRADIUSGUI('Property','Value',...) creates a new MANUALRADIUSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manualRadiusGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manualRadiusGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manualRadiusGUI

% Last Modified by GUIDE v2.5 07-Dec-2018 10:54:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manualRadiusGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @manualRadiusGUI_OutputFcn, ...
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


% --- Executes just before manualRadiusGUI is made visible.
function manualRadiusGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manualRadiusGUI (see VARARGIN)

% Choose default command line output for manualRadiusGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manualRadiusGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manualRadiusGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
movegui(gcf, 'center');
global coinType;
uiwait;
varargout{1} = coinType;
delete(hObject);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addr = get(handles.uibuttongroup1, 'SelectedObject');
global coinType;
coinType = get(addr, 'String');
uiresume;
