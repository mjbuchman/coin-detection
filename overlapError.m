function varargout = overlapError(varargin)
% overlapError MATLAB code for overlapError.fig
%      overlapError, by itself, creates a new overlapError or raises the existing
%      singleton*.
%
%      H = overlapError returns the handle to a new overlapError or the handle to
%      the existing singleton*.
%
%      overlapError('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in overlapError.M with the given input arguments.
%
%      overlapError('Property','Value',...) creates a new overlapError or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before overlapError_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to overlapError_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help overlapError

% Last Modified by GUIDE v2.5 07-Dec-2018 12:41:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @overlapError_OpeningFcn, ...
                   'gui_OutputFcn',  @overlapError_OutputFcn, ...
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


% --- Executes just before overlapError is made visible.
function overlapError_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to overlapError (see VARARGIN)

% Choose default command line output for overlapError
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes overlapError wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = overlapError_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
movegui(gcf, 'center');
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume;
close;
