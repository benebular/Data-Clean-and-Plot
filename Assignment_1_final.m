%% Assignment 1 Scientific Programming for the Behavioral Sciences

% This script will analyze and plot data that represents the performance of 3 participants in
% a study on the effects of caffeine on reaction time. One participant
% was under the influence of 400mg of caffine, the next, 200mg of caffeine,
% and the final, 0mg of caffeine as a control.
% V1: 2/12/2016
% Author: Ben Lang
% Email: ben.lang@nyu.edu

%% Initialization - ensures a clean slate in the workspace and command window

clear all % clears the workspace
close all % closes all open figures
clc % clears the command window
load ('Assignment1_data') % loads Assignment 1 data into the workspace

%% Data Manipulation - prepares data from the 3 participants by removing invalid trials

react_control = data_control - stimTime_control; % sets react_control as the difference between data collected and onset of stimulus, which is the reaction time, using control data
react_200 = data_caffeine_200 - stimTime_caffeine_200; % sets react_200 as the difference between data collected and onset of stimulus, which is the reaction time, using 200mg caffeine data
react_400 = data_caffeine_400 - stimTime_caffeine_400; % sets react_400 as the difference between data collected and onset of stimulus, which is the reaction time, using 400mg caffeine data data

[ind1 ind2]=find(react_control>0); % finds the indices of positive values in react_control
ValidTrials_control=react_control(ind1,1); % uses found indices to extract values from react_control to create new matrix of only positive values: ValidTrials_control
[ind3 ind4]=find(react_200>0); % finds indices of pos values in react_200
ValidTrials_200=react_200(ind3,1); % uses found indices to extract values from react_200 to create new matrix of only positive values: ValidTrials_200
[ind5 ind6]=find(react_400>0); % finds indices of pos values in react_400
ValidTrials_400=react_400(ind5,1); % uses found indices to extract values from react_400 to create new matrix of only positive values: ValidTrials_400

%% Plotting the Data - the data is plotted from the above manipulated data

figure('units','normalized','outerposition',[0 0 1 1], 'color','[1 1 1]') % opens a new figure in fullscreen with a white background

y = ValidTrials_control; % assigns positive values in control to y-variable
x = ind1; % assigns indices of reaction times in positive values in control to the x-variable
h = plot(x,y); % plot y as a function of x
set(h,'color','k') % sets the line color of plot h to black
set(h,'linewidth', 0.5) % sets the line width of plot h to 0.5
hold on % holds on to plot h so that more objects (h2 and h3) can be in the same figure

y = ValidTrials_200; % assigns positive values in 200mg to y-variable
x = ind3; % assigns indices of reaction times in positive values in 200mg participant to the x-variable
h2 = plot(x,y); % plot y as a function of x
set(h2,'color','b') % sets the line color of plot h2 to blue
set(h2,'linewidth', 0.5) % sets the line width of plot h2 to 0.5
hold on % holds on to plot h2 so that more objects (h and h3) can be in the same figure

y = ValidTrials_400; % assigns positive values in 400mg to y-variable
x = ind5; % assigns indices of reaction times in positive values in 400mg participant to the x-variable
h3 = plot(x,y); % plot y as a function of x
set(h3,'color',[1 0 0]) % sets the line color of plot h3 to red
set(h3,'linewidth', 0.5) % sets the line width of plot h3 to 0.5

title('Performance Under the Influence of Caffeine') % sets the title for the figure
set(gca, 'fontsize', 16) % sets the font size of the figure to 16
xlabel('Valid Trials') % labels the x-axis of the figure as 'Valid Trials'
ylabel('Reaction Time per Trial (ms)') % labels the y-axis of the efigure as 'Reaction Time (ms)'
legend([h, h2, h3], 'Control','200mg','400mg','Location','southwest') % creates a legend for the figure, labels each line with the corresponding participant, and places the legend in the southwest corner of the figure
box off % removes the box around the figure
axis square % centers the figure and makes it into a square
