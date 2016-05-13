%% Assignment 2 for Scientific Programming of the Behavioral Sciences
% Purpose: This script will load, process, and categorize data from a spreadsheet (cells). It will then plot multiple histograms of the
% data gathered for color responses and circadian types in a survey about the Dress.
% Author: Ben Lang
% Email: ben.lang@nyu.edu
% V1 2/18/16
% V2 2/20/16

%% 1 Initialization

clear all % clears the workspace
close all % closes all open figures
clc % clears the command window

%% 2 Load

load('Assignment2_data') % Loads the data into the workspace

%load the data in completely

%% 3 Data Parsing

numericalData = cell([518 2]); % creates a new, blank set of cells with the same size at the loaded DATA
[x,y] = size(DATA); % assigns variables to x and y that are the same size as the loaded DATA

for ii = 1:x % tells the for loop to look into the full range of the cells in DATA, column 1
    if strcmp(DATA{ii,1}, 'White/Gold'); % if the string data in a given cell in DATA is equal to 'White/Gold'
        numericalData{ii,1} = 1; % assign a 1 to the same cell in the newly created matrix
    elseif strcmp(DATA{ii,1}, 'Blue/Black'); % if the string data in a given cell in DATA is equal to 'Blue/Black'
        numericalData{ii,1} = 2; % assign a 2 to the same cell in the newly created matrix
    elseif strcmp(DATA{ii,1}, 'White/Black'); % if the string data in a given cell in DATA is equal to 'White/Black'
        numericalData{ii,1} = 3; % assign a 3 to the same cell in the newly created matrix
    elseif strcmp(DATA{ii,1}, 'Blue/Gold'); % if the string data in a given cell in DATA is equal to 'Blue/Gold'
        numericalData{ii,1} = 4; % assign a 4 to the same cell in the newly created matrix
    elseif strcmp(DATA{ii,1}, 'It was quickly switching between white/gold and blue/black'); % if the string data in a given cell in DATA is equal to 'It was quickly switching between white/gold and blue/black'
        numericalData{ii,1} = 5; % assign a 5 to the same cell in the newly created matrix
    else numericalData{ii,1} = 6; % assign a 6 to the any cell in the newly created matrix that does not correspond to the above categories
    end % ends the if statements
end % ends the for loop

for ii = 1:x % tells the for loop to look into the full range of the cells in DATA, column 2
    if strcmp(DATA{ii,2}, 'Strong owl'); % if the string data in a given cell in DATA is equal to 'Strong owl'
        numericalData{ii,2} = 1; % assign a 1 to the same cell in the newly created matrix
    elseif strcmp(DATA{ii,2}, 'Owl'); % if the string data in a given cell in DATA is equal to 'Owl'
        numericalData{ii,2} = 2; % assign a 2 to the same cell in the newly created matrix
    elseif strcmp(DATA{ii,2}, 'Lark'); % if the string data in a given cell in DATA is equal to 'Lark'
        numericalData{ii,2} = 3; % assign a 3 to the same cell in the newly created matrix
    elseif strcmp(DATA{ii,2}, 'Strong lark'); % if the string data in a given cell in DATA is equal to 'Strong lark'
        numericalData{ii,2} = 4; % assign a 4 to the same cell in the newly created matrix
    else numericalData{ii,2} = 5; % assign a 5 to the any cell in the newly created matrix that does not correspond to the above categories
    end % ends the if statements
end % ends the for loop

%% 4 Plotting Parsed Data in Histograms

colorResponses = cat(1, numericalData{:,1}); % concatenates the color response data in the first column of numericalData into a single column matrix
colorResponses_categorized = categorical(colorResponses, [1 2 3 4 5 6], {'White/Gold','Blue/Black','White/Black','Blue/Gold','Rapid Swapping of Colors','Missing Data'}); % categorizes the numerical values in the matrix to corresponding titles from original DATA

circadianType = cat(1, numericalData{:,2}); % concatenates the circadian type data in the second column of numericalData into a single column matrix
circadianType_categorized = categorical(circadianType, [1 2 3 4 5], {'Strong owl','Owl','Lark','Strong lark','Missing Data'}); % categorizes the numerical values in the matrix to corresponding titles from original DATA

figure('units','normalized','outerposition',[0 0 1 1], 'color','[1 1 1]') % opens a figure, full screen, with a white background

subplot (1,2,1) % divides the figure into two subplots and places the following histogram on the left
h = histogram(colorResponses_categorized,'BarWidth',0.8) % plots a histogram of the categorized data of color responses
title('Color Responses') % places a title on the histogram
xlabel('Color Type Response') % labels the x-axis of the histogram
ylabel('Number of Responses per Type') % labels the y-axis of the histogram
set(gca, 'fontsize', 14) % changes the overall font size of the histogram to 14
box off % removes the box from the edges of the graph
axis square % centers the graph
hold on % holds on the the histogram so that it can be printed with the following one on the same figure

subplot (1,2,2) % places the following histogram to the right of the previous histogram
h2 = histogram(circadianType_categorized,'BarWidth',0.8,'FaceColor','g') % plots a histogram of the categorized data of circadian types
title('Circadian Type') % places a title on the histogram
xlabel('Circadian Type Response') % labels the x-axis of the histogram
ylabel('Number of Responses per Type') % labels the y-axis of the histogram
set(gca, 'fontsize', 14) % changes the overall font size of the histogram to 14
box off % removes the box from the edges of the graph
axis square % centers the graph
