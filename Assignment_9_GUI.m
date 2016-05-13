function varargout = Assignment_9_GUI(varargin)
% ASSIGNMENT_9_GUI MATLAB code for Assignment_9_GUI.fig
%      ASSIGNMENT_9_GUI, by itself, creates a new ASSIGNMENT_9_GUI or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT_9_GUI returns the handle to a new ASSIGNMENT_9_GUI or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT_9_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT_9_GUI.M with the given input arguments.
%
%      ASSIGNMENT_9_GUI('Property','Value',...) creates a new ASSIGNMENT_9_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment_9_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment_9_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment_9_GUI

% Last Modified by GUIDE v2.5 23-Apr-2016 15:19:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment_9_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment_9_GUI_OutputFcn, ...
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


% --- Executes just before Assignment_9_GUI is made visible.
function Assignment_9_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment_9_GUI (see VARARGIN)

% Choose default command line output for Assignment_9_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment_9_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment_9_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function firstName_Callback(hObject, eventdata, handles)
% hObject    handle to firstName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of firstName as text
%        str2double(get(hObject,'String')) returns contents of firstName as a double


% --- Executes during object creation, after setting all properties.
function firstName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to firstName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lastName_Callback(hObject, eventdata, handles)
% hObject    handle to lastName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lastName as text
%        str2double(get(hObject,'String')) returns contents of lastName as a double


% --- Executes during object creation, after setting all properties.
function lastName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lastName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in register.
function register_Callback(hObject, eventdata, handles)
% hObject    handle to register (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

temp1 = get(handles.firstName,'String');
temp2 = get(handles.lastName,'String');
temp = [temp1,' ',temp2]; % concatenate the name
set(handles.name,'String',temp);

set(handles.firstName,'Visible','off');
set(handles.lastName,'Visible','off');
set(handles.name,'Visible','on');
set(handles.register,'Visible','off');
set(handles.instructions,'Visible','on');


% --- Executes on button press in instructions.
function instructions_Callback(hObject, eventdata, handles)
% hObject    handle to instructions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.instructionsText,'Visible','on');
set(handles.name,'Visible','off');
set(handles.instructions,'Visible','off');
set(handles.proceed,'Visible','on');


% --- Executes on button press in proceed.
function proceed_Callback(hObject, eventdata, handles)
% hObject    handle to proceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.proceed,'Visible','off');
set(handles.instructionsText,'Visible','off');
set(handles.viewResults,'Visible','on');

startScreen  = figure('units','normalized','outerposition',[0 0 1 1], 'color',[1 1 1],'Menu','none'); % produces a figure: full screen, no menu, white background
axis off % removes axis from the figure

correctResp4P = 0; % creates a matrix as a tally counter for correct responses in the below while loop
rt4p = zeros(20,1); % creates a matrix of zeros with 20 rows and 1 column

while correctResp4P < 20 % while correct trials are below 20, continue producing stimuli
    targPres = randi(2); % randomizes target presentation with a coin flip of 1 or 2
    if targPres == 1 % displays the target stimuli described below on 1 in above randomization
        allCoords = rand(3,2); % gives random coordinates for stimuli
        red3 = text(allCoords(:,1),allCoords(:,2),'x','color','r','FontSize',40); % makes 3 red x's as stimuli with random coordinates
        green1 = text(rand,rand,'o','color','g','FontSize',40); % produces a single green o as stimulus
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli are presented
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character pressed by the participant
        if strcmp(CC,'p') == 1; % if 'p' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp4P = correctResp4P + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp4P % during a current trial, record the following times
                rt4p(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    elseif targPres == 2 % displays 4 red x's
        allCoords = rand(4,2); % gives random coordinates for stimuli
        red4 = text(allCoords(:,1),allCoords(:,2),'x','color','r','FontSize',40); % presents 4 red x's on the screen in random locations
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character
        if strcmp(CC,'q') == 1 % if 'q' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp4P = correctResp4P + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp4P % during a current trial, record the following times
                rt4p(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    end
end

correctResp8P = 0; % creates a matrix as a tally counter for correct responses in the below while loop
rt8p = zeros(20,1); % creates a matrix of zeros with 20 rows and 1 column

while correctResp8P < 20 % while correct trials are below 20, continue producing stimuli
    targPres = randi(2); % randomizes target presentation with a coin flip of 1 or 2
    if targPres == 1 % displays the target stimuli described below on 1 in above randomization
        allCoords = rand(7,2); % gives random coordinates for stimuli
        red7 = text(allCoords(:,1),allCoords(:,2),'x','color','r','FontSize',40); % makes 7 red x's as stimuli and places them randomly
        green1 = text(rand,rand,'o','color','g','FontSize',40); % produces a single green o as stimulus
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character
        if strcmp(CC,'p') == 1; % if 'p' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp8P = correctResp8P + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp8P % during a current trial, record the following times
                rt8p(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    elseif targPres == 2 % displays 8 red x's
        allCoords = rand(8,2); % gives random coordinates for stimuli
        red8 = text(allCoords(:,1),allCoords(:,2),'x','color','r','FontSize',40); % presents 8 red x's on the screen in random locations
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter');% get the current character
        if strcmp(CC,'q') == 1 % if 'q' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp8P = correctResp8P + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp8P % during a current trial, record the following times
                rt8p(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    end
end

correctResp12P = 0; % creates a matrix as a tally counter for correct responses in the below while loop
rt12p = zeros(20,1); % creates a matrix of zeros with 20 rows and 1 column

while correctResp12P < 20 % while correct trials are below 20, continue producing stimuli
    targPres = randi(2); % randomizes target presentation with a coin flip of 1 or 2
    if targPres == 1 % displays the target stimuli described below on 1 in above randomization
        allCoords = rand(11,2); % gives random coordinates for stimuli
        red11 = text(allCoords(:,1),allCoords(:,2),'x','color','r','FontSize',40); % makes three red x's as stimuli
        green1 = text(rand,rand,'o','color','g','FontSize',40); % produces a single green o as stimulus
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character
        if strcmp(CC,'p') == 1; % if 'p' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp12P = correctResp12P + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp12P % during a current trial, record the following times
                rt12p(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    elseif targPres == 2 % displays 12 red x's
        allCoords = rand(12,2); % gives random coordinates for stimuli
        red12 = text(allCoords(:,1),allCoords(:,2),'x','color','r','FontSize',40); % presents 12 red x's on the screen in random locations
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter');% get the current character
        if strcmp(CC,'q') == 1 % if 'q' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp12P = correctResp12P + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp12P % during a current trial, record the following times
                rt12p(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    end
end

correctResp16P = 0; % creates a matrix as a tally counter for correct responses in the below while loop
rt16p = zeros(20,1); % creates a matrix of zeros with 20 rows and 1 column

while correctResp16P < 20 % while correct trials are below 20, continue producing stimuli
    targPres = randi(2); % randomizes target presentation with a coin flip of 1 or 2
    if targPres == 1 % displays the target stimuli described below on 1 in above randomization
        allCoords = rand(15,2); % gives random coordinates for stimuli
        red15 = text(allCoords(:,1),allCoords(:,2),'x','color','r','FontSize',40); % makes three red x's as stimuli
        green1 = text(rand,rand,'o','color','g','FontSize',40); % produces a single green o as stimulus
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character
        if strcmp(CC,'p') == 1; % if 'p' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp16P = correctResp16P + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp16P % during a current trial, record the following times
                rt16p(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    elseif targPres == 2 % displays 16 red x's
        allCoords = rand(16,2); % gives random coordinates for stimuli
        red16 = text(allCoords(:,1),allCoords(:,2),'x','color','r','FontSize',40); % presents 16 red x's on the screen in random locations
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter');% get the current character
        if strcmp(CC,'q') == 1 % if 'q' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp16P = correctResp16P + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp16P % during a current trial, record the following times
                rt16p(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    end
end


correctResp4C = 0; % creates a matrix as a tally counter for correct responses in the below while loop
rt4c = zeros(20,1); % creates a matrix of zeros with 20 rows and 1 column

while correctResp4C < 20 % while correct trials are below 20, continue producing stimuli
    targPres = randi(2); % randomizes target presentation with a coin flip of 1 or 2
    if targPres == 1 % displays the target stimuli described below on 1 in above randomization
        red_o = text(rand,rand,'o','color','r','FontSize',40); % produces 1 red o on the screen
        red_x = text(rand,rand,'x','color','r','FontSize',40) % produces 1 red x on the screen
        green_x = text(rand,rand,'x','color','g','FontSize',40) % produces 1 green x on the screen
        green_o = text(rand,rand,'o','color','g','FontSize',40); % produces a single green o as stimulus
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character
        if strcmp(CC,'p') == 1; % if 'p' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp4C = correctResp4C + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp4C % during a current trial, record the following times
                rt4c(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    elseif targPres == 2 % displays the target stimuli described below on 2 in above randomization
        allCoords = rand(2,2); % gives random coordinates for stimuli
        green_x_2 = text(allCoords(:,1),allCoords(:,2),'x','color','g','FontSize',40); % presents 2 green x's on the screen in random locations
        allCoords = rand(2,2); % gives random coordinates for stimuli
        red_o_2 = text(allCoords(:,1),allCoords(:,2),'o','color','r','FontSize',40); % presents 2 red o's on the screen in random locations
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter');% get the current character
        if strcmp(CC,'q') == 1 % if 'q' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp4C = correctResp4C + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp4C % during a current trial, record the following times
                rt4c(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    end
end

correctResp8C = 0; % creates a matrix as a tally counter for correct responses in the below while loop
rt8c = zeros(20,1); % creates a matrix of zeros with 20 rows and 1 column

while correctResp8C < 20 % while correct trials are below 20, continue producing stimuli
    targPres = randi(2); % randomizes target presentation with a coin flip of 1 or 2
    if targPres == 1 % displays the target stimuli described below on 1 in above randomization
        allCoords = rand(3,2); % gives random coordinates for stimuli
        green_x_3 = text(allCoords(:,1),allCoords(:,2),'x','color','g','FontSize',40); % presents 3 green x's on the screen in random locations
        red_x = text(rand,rand,'x','color','r','FontSize',40) % produces 1 red x on the screen
        allCoords = rand(3,2); % gives random coordinates for stimuli
        red_o_3 = text(allCoords(:,1),allCoords(:,2),'o','color','r','FontSize',40); % presents 3 red o's on the screen in random locations
        green_o = text(rand,rand,'o','color','g','FontSize',40); % produces a single green o as stimulus
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character
        if strcmp(CC,'p') == 1; % if 'p' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp8C = correctResp8C + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp8C % during a current trial, record the following times
                rt8c(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    elseif targPres == 2 % displays the target stimuli described below on 2 in above randomization
        allCoords = rand(4,2); % gives random coordinates for stimuli
        green_x_4 = text(allCoords(:,1),allCoords(:,2),'x','color','g','FontSize',40); % presents 4 green x's on the screen in random locations
        allCoords = rand(4,2); % gives random coordinates for stimuli
        red_o_4 = text(allCoords(:,1),allCoords(:,2),'o','color','r','FontSize',40); % presents 4 red o's on the screen in random locations
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter');% get the current character
        if strcmp(CC,'q') == 1 % if 'q' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp8C = correctResp8C + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp8C % during a current trial, record the following times
                rt8c(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    end
end


correctResp12C = 0; % creates a matrix as a tally counter for correct responses in the below while loop
rt12c = zeros(20,1); % creates a matrix of zeros with 20 rows and 1 column

while correctResp12C < 20 % while correct trials are below 20, continue producing stimuli
    targPres = randi(2); % randomizes target presentation with a coin flip of 1 or 2
    if targPres == 1 % displays the target stimuli described below on 1 in above randomization
        allCoords = rand(5,2); % gives random coordinates for stimuli
        green_x_5 = text(allCoords(:,1),allCoords(:,2),'x','color','g','FontSize',40); % presents 5 green x's on the screen in random locations
        red_x = text(rand,rand,'x','color','r','FontSize',40) % produces 1 red x on the screen
        allCoords = rand(5,2); % gives random coordinates for stimuli
        red_o_5 = text(allCoords(:,1),allCoords(:,2),'o','color','r','FontSize',40); % presents 5 red o's on the screen in random locations
        green_o = text(rand,rand,'o','color','g','FontSize',40); % produces a single green o as stimulus
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character
        if strcmp(CC,'p') == 1; % if 'p' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp12C = correctResp12C + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp12C % during a current trial, record the following times
                rt12c(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    elseif targPres == 2 % displays the target stimuli described below on 2 in above randomization
        allCoords = rand(6,2); % gives random coordinates for stimuli
        green_x_6 = text(allCoords(:,1),allCoords(:,2),'x','color','g','FontSize',40); % presents 6 green x's on the screen in random locations
        allCoords = rand(6,2); % gives random coordinates for stimuli
        red_o_6 = text(allCoords(:,1),allCoords(:,2),'o','color','r','FontSize',40); % presents 6 red o's on the screen in random locations
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter');% get the current character
        if strcmp(CC,'q') == 1 % if 'q' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp12C = correctResp12C + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp12C % during a current trial, record the following times
                rt12c(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    end
end

correctResp16C = 0; % creates a matrix as a tally counter for correct responses in the below while loop
rt16c = zeros(20,1); % creates a matrix of zeros with 20 rows and 1 column

while correctResp16C < 20 % while correct trials are below 20, continue producing stimuli
    targPres = randi(2); % randomizes target presentation with a coin flip of 1 or 2
    if targPres == 1 % displays the target stimuli described below on 1 in above randomization
        allCoords = rand(7,2); % gives random coordinates for stimuli
        green_x_7 = text(allCoords(:,1),allCoords(:,2),'x','color','g','FontSize',40); % presents 7 green x's on the screen in random locations
        red_x = text(rand,rand,'x','color','r','FontSize',40) % produces 1 red x on the screen
        allCoords = rand(7,2); % gives random coordinates for stimuli
        red_o_7 = text(allCoords(:,1),allCoords(:,2),'o','color','r','FontSize',40); % presents 7 red o's on the screen in random locations
        green_o = text(rand,rand,'o','color','g','FontSize',40); % produces a single green o as stimulus
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter'); % get the current character
        if strcmp(CC,'p') == 1; % if 'p' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp16C = correctResp16C + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp16C % during a current trial, record the following times
                rt16c(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    elseif targPres == 2 % displays the target stimuli described below on 2 in above randomization
        allCoords = rand(8,2); % gives random coordinates for stimuli
        green_x_8 = text(allCoords(:,1),allCoords(:,2),'x','color','g','FontSize',40); % presents 8 green x's on the screen in random locations
        allCoords = rand(8,2); % gives random coordinates for stimuli
        red_o_8 = text(allCoords(:,1),allCoords(:,2),'o','color','r','FontSize',40); % presents 8 red o's on the screen in random locations
        axis off % keeps axis off for any figures in this trial condition
        tic % starts a counter once the stimuli begin
        pause % pauses stimuli presentation until participant presses a button
        CC = get(gcf,'CurrentCharacter');% get the current character
        if strcmp(CC,'q') == 1 % if 'q' is pressed, record a correct response (any other button will just advance to a new stimulus presentation)
            correctResp16C = correctResp16C + 1; % Response in current trial is correct and adds to counter
            for ii = correctResp16C % during a current trial, record the following times
                rt16c(ii,1) = toc; % records the responses time for the current trial
            end
        end
        clf % clears the figure
    end
end

close % closes the final blank figure

rt4p_mean = mean(rt4p); rt8p_mean = mean(rt8p); rt12p_mean = mean(rt12p); rt16p_mean = mean(rt16p);
rt4c_mean = mean(rt4c); rt8c_mean = mean(rt8c); rt12c_mean = mean(rt12c); rt16c_mean = mean(rt16c);
% the above line gets the mean reaction time from each set size in each testing condition
handles.p_means = [rt4p_mean rt8p_mean rt12p_mean rt16p_mean]; % this creates a matrix of the means of reaction times in popout condition
handles.c_means = [rt4c_mean rt8c_mean rt12c_mean rt16c_mean]; % this creates a matrix of the means of reaction times in conjunction condition
guidata(hObject, handles);


% --- Executes on button press in viewResults.
function viewResults_Callback(hObject, eventdata, handles)
% hObject    handle to viewResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
labels = [4 8 12 16]; % creates a set of labels for each set size for the graph of results
set(handles.viewResults,'Visible','off');
set(handles.results,'Visible','on');

axes(handles.results);
h = plot(handles.p_means);
hold on
h2 = plot(handles.c_means);
set(h,'linewidth',2) % sets line width of the data to 2
set(h2,'linewidth',2) % sets the line width of the data to 2
set(gca,'XTick', 1:length(labels)); % changes the scale of the x-axis to include unit variation between set sizes
set(gca,'XTickLabel',labels); % places the labels created for each set size on the newly delineated unit markers on the x-axis
xlabel ('Set Size'); % labels the x-axis
ylabel ('Reaction Time (ms)'); % labels the y-axis
title ('Reaction Time to Popout and Conjunction Search') % titles the graph in the figure
l1 = legend ([h h2],'Popout Search','Conjunction Search','Location','northwest') % produces a legend in the top right hand corner of the graph
set(l1,'FontSize',15) % changes the font size of the legend
set(gca,'FontSize',20) % changes the font size of the entire figure to 20
guidata(hObject, handles);
