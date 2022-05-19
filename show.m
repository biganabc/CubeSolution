function varargout = show(varargin)
% SHOW MATLAB code for show.fig
%      SHOW, by itself, creates a new SHOW or raises the existing
%      singleton*.
%
%      H = SHOW returns the handle to a new SHOW or the handle to
%      the existing singleton*.
%
%      SHOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOW.M with the given input arguments.
%
%      SHOW('Property','Value',...) creates a new SHOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before show_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to show_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help show

% Last Modified by GUIDE v2.5 28-Dec-2021 00:51:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @show_OpeningFcn, ...
                   'gui_OutputFcn',  @show_OutputFcn, ...
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


% --- Executes just before show is made visible.
function show_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to show (see VARARGIN)

% Choose default command line output for show
handles.output = hObject;
handles.all_files = [];
handles.upimg = "";
handles.downimg = "";
handles.leftimg = "";
handles.rightimg = "";
handles.frontimg = "";
handles.backimg = "";
handles.all_colors = [
                        [204,254,58];   % ��Ϊ��
                        [241,140,67];   % ��Ϊ��
                        [1,226,111];    % ��Ϊ��
                        [171,30,20];    % ��Ϊ��
                        [2,38,173];     % ��Ϊ��
                        [200,200,200];  % ��Ϊ��
                    ];
handles.result = [];
handles.Cube1 = [];
handles.Cube2 = [];
                
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes show wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = show_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
    axes(handles.axes1);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ��������ͼ');
    str=[pathname filename];
    handles.leftimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        %im = imresize(im, [20 20]); 
        h = imshow(im);
        set(h,'ButtonDownFcn',@axes1_ButtonDownFcn);
        handles.h1 = h;
    end    
    guidata(hObject, handles);

% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
    axes(handles.axes2);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ��������ͼ');
    str=[pathname filename];
    handles.frontimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);

% --- Executes on mouse press over axes background.
function axes3_ButtonDownFcn(hObject, eventdata, handles)
    axes(handles.axes3);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ��������ͼ');
    str=[pathname filename];
    handles.rightimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);

% --- Executes on mouse press over axes background.
function axes4_ButtonDownFcn(hObject, eventdata, handles)
    axes(handles.axes4);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ���ĺ���ͼ');
    str=[pathname filename];
    handles.backimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);

% --- Executes on mouse press over axes background.
function axes5_ButtonDownFcn(hObject, eventdata, handles)
    axes(handles.axes5);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ���ĸ���ͼ');
    str=[pathname filename];
    handles.upimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);

% --- Executes on mouse press over axes background.
function axes6_ButtonDownFcn(hObject, eventdata, handles)
    axes(handles.axes6);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ��������ͼ');
    str=[pathname filename];
    handles.downimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);
    
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
    axes(handles.axes1);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ��������ͼ');
    str=[pathname filename];
    handles.leftimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        %im = imresize(im, [20 20]); 
        h = imshow(im);
        set(h,'ButtonDownFcn',@axes1_ButtonDownFcn);
        handles.h1 = h;
    end    
    guidata(hObject, handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
    axes(handles.axes5);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ���ĸ���ͼ');
    str=[pathname filename];
    handles.upimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
    axes(handles.axes2);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ��������ͼ');
    str=[pathname filename];
    handles.frontimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
    axes(handles.axes3);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ��������ͼ');
    str=[pathname filename];
    handles.rightimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
    axes(handles.axes4);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ���ĺ���ͼ');
    str=[pathname filename];
    handles.backimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
    axes(handles.axes6);
    [filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'��ѡ��ħ��������ͼ');
    str=[pathname filename];
    handles.downimg = string(str);
    % �ж��ļ��Ƿ�Ϊ�գ�Ҳ���Բ������������ֱ�Ӷ���ͼƬҲ���Ե�
    if isequal(filename,0)||isequal(pathname,0)
        warndlg('����ѡ��ͼƬ��','warning');
        return;
    else
        im = imread(str);
        imshow(im);
    end    
    guidata(hObject, handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    all_pictures = [handles.frontimg,handles.rightimg,handles.backimg,handles.leftimg,handles.upimg,handles.downimg];
    result = uint8.empty(0,3,3);
    windows = [handles.axes8,handles.axes9,handles.axes10,handles.axes7,handles.axes11,handles.axes12];
    
    n = 4; % 3��ħ��4����

    all_colors=getColorTypes(all_pictures);
    for color_index=1:6
        mayBeWhite = all_colors(color_index,:);
        if ( mayBeWhite(1) > 130 && mayBeWhite(2) > 130 && mayBeWhite(3) > 130)
            all_colors(color_index,:) = [250,250,250];
        end
    end
    
    for i = 1:6
        I = imread(all_pictures(i));
        linePoints = getBorder(I);

        points = [
            [squeeze(linePoints(1,4)),squeeze(linePoints(1,3))];
            [squeeze(linePoints(n,4)),squeeze(linePoints(n,3))];
            [squeeze(linePoints(1,2)),squeeze(linePoints(1,1))];
            [squeeze(linePoints(n,2)),squeeze(linePoints(n,1))]];
        color_map = getColors(I,points,all_colors,n-1);  % һ��3x3�ľ���

        result(i,:,:) = color_map;

        daspect([1 1 1])

        % ��ͼ
        axes(windows(i));
        k = n-1;    % 3 ��ħ��
        width = 20;  % ɫ����
        for x_n = 1:k  % �������x
            for y_n = 1:k  % �������y
                % �����ȣ����ϵ��£������ұ�����
                rectangle('Position',[(x_n-1)*width,(k-y_n)*width,20,20],'LineWidth',2,...
                'LineStyle','--','EdgeColor','b' ,'facecolor',all_colors(color_map(y_n,x_n),:)/255); 
            end
        end
    end



    for i = 1:6
        result(i,:,:);
    end

    % �������е������֤ result �� 6 x 3 x 3 ��������ɫ�����ɫ��š�
    % all_colors �� 6 x 3 ���󣬶�Ӧ6����ɫ��RGB

    handles.all_colors = all_colors;
    handles.result = result;
    
    guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    %jFrame = wait();

    solution = solveCube(handles.result);
    instrs = solution2str(solution);
    %instrs = 'R';

    Cube1 = handles.Cube1;
    Cube2 = handles.Cube2;
    for i = 1:length(instrs)
        [Cube1, Cube2] = executeRotate(Cube1, Cube2, instrs(i));
    end   
    
    handles.Cube1 = Cube1;
    handles.Cube2 = Cube2;
    
    guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    colors = handles.all_colors'/255;
    result = handles.result;
    surfaces(:,:,1) = squeeze(result(4,:,:));
    surfaces(:,:,2) = squeeze(result(1,:,:));
    surfaces(:,:,3) = squeeze(result(2,:,:));
    surfaces(:,:,4) = squeeze(result(3,:,:));
    surfaces(:,:,5) = squeeze(result(5,:,:));
    surfaces(:,:,6) = squeeze(result(6,:,:));
    
    axes(handles.axes13);
    title('�����ӽ�','FontSize',16);
    xlabel('X��');
    ylabel('Y��');
    zlabel('Z��');
    set(gca,'XDir','reverse');
    set(gca,'YDir','reverse');
    axis equal tight  
    axis([-3 3 -3 3 -3 3]);
    grid on;
    view(3);
    Cube1 = createCube(surfaces, colors);
    handles.Cube1 = Cube1;
    
    axes(handles.axes14);
    title('�����ӽ�','FontSize',16);
    xlabel('X��');
    ylabel('Y��');
    zlabel('Z��');
    set(gca,'ZDir','reverse');
    axis equal tight  
    axis([-3 3 -3 3 -3 3]);
    grid on;
    view(3);
    Cube2 = createCube(surfaces, colors);
    handles.Cube2 = Cube2;
    
    guidata(hObject, handles);
    
