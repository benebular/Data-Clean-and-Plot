%% Assignment 6 Scientific Programming for the Behavioral Sciences
% This script is meant to deal with sleep data from a bipolar individual by
% loading a spreadsheet of their responses to a daily survey, processing
% missing data, and then plotting each response separately, together with
% z-scores, and finding the correlation between each element.
% Author: Ben Lang
% Email: ben.lang@nyu.edu
% V1: 3/26/15

%% 0 Initialization

clear all; % clears the workspace
close all; % close all figures
clc; % clears the command window

%% 1 Load the data

[Data,header,allData] = xlsread('timeseries2015.xlsx'); % load the spreadsheet into MATLAB

%% 2 Dealing with Missing Data

nonInd= find(isnan(Data(:,8)) ==1); % finds the indices of the NaNs in the spreadsheet
Data(nonInd,:) = []; % uses those indices to delete the entire row that they are in

%% 3 Plotting Each of the Time Courses

kernelsize = 7; % determines the kernel size for convolution function
kernel = ones(kernelsize,1); % makes a window of 7 points
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1],'Menu','none'); %creates a figure on a white background full screen
subplot(2,3,1) % creates a subplot in a 2x3 subplot array and places the graph in the first slot
smoothedSleep = conv(Data(:,2),kernel,'valid')./sum(kernel);  % convolves the sleep data in teh second clomun using a kernel size of 7 and then divides by the kernel size to give weighted values
h1 = plot(smoothedSleep); % plots the smoothed Sleep data
hold on % keeps the Sleep graph on the figure
title ('Averaged Sleep vs. Work per Day'); % tites the graph
ylabel('Hours'); % creates a label for the y-axis
xlabel('Day of the Year'); % creates a label for the x-axis
smoothedWork = conv(Data(:,6),kernel,'valid')./sum(kernel); % convolves the Work data with 
h2 = plot(smoothedWork); % convolves the sleep data in teh second clomun using a kernel size of 7 and then divides by the kernel size to give weighted values
box off % removes the box on the graph
legend([h1 h2], 'Sleep','Work','Location','northeast'); % creates a legend for the graph

% The next section plots the rest of the data in separate graphs in the
% subplot array on the figure and uses roughly the same code, but
% substitutes relevant data each time for a new variable.

subplot(2,3,2)
smoothedMood = conv(Data(:,3),kernel,'valid')./sum(kernel);
plot(smoothedMood,'color',[0.3 0.8 0]);
title ('Averaged Mood per Day');
ylabel('Daily Mood on a Scale of -2.5 to 2.5');
xlabel('Day of the Year');
box off

subplot (2,3,3)
smoothedEnergy = conv(Data(:,4),kernel,'valid')./sum(kernel);
plot(smoothedEnergy,'color','r');
title ('Averaged Energy per Day');
ylabel('Energy Levels on a Scale of 0 to 2');
xlabel('Day of the Year');
box off

subplot (2,3,4)
smoothedInspiration = conv(Data(:,5),kernel,'valid')./sum(kernel);
plot(smoothedInspiration, 'color','m');
title ('Averaged Inspiration per Day');
ylabel('Inspiration Levels on a Scale of 0 to 2');
xlabel('Day of the Year');
box off

subplot (2,3,5)
smoothedREM = conv(Data(:,7),kernel,'valid')./sum(kernel);
plot(smoothedREM, 'color','k');
title ('Averaged REM per Day');
ylabel('Minutes per Night');
xlabel('Day of the Year');
box off

subplot (2,3,6)
smoothedDeep = conv(Data(:,8),kernel,'valid')./sum(kernel);
plot(smoothedDeep,'color',[0 1 1]);
title ('Averaged Deep Sleep per Day');
ylabel('Minutes per Night');
xlabel('Day of the Year');
box off

%% 4 Correlation Calculations

% Calculates the correlation between each of the 7 variables after they
% have been smoothed.

sleep_mood = corrcoef(smoothedSleep,smoothedMood);
sleep_energy = corrcoef(smoothedSleep,smoothedEnergy);
sleep_insp = corrcoef(smoothedSleep,smoothedInspiration);
sleep_work = corrcoef(smoothedSleep,smoothedWork);
sleep_REM = corrcoef(smoothedSleep,smoothedREM);
sleep_deep = corrcoef(smoothedSleep,smoothedDeep);

mood_energy = corrcoef(smoothedMood,smoothedEnergy);
mood_insp = corrcoef(smoothedMood,smoothedInspiration);
mood_work = corrcoef(smoothedMood,smoothedWork);
mood_REM = corrcoef(smoothedMood,smoothedREM);
mood_deep = corrcoef(smoothedMood,smoothedDeep);

energy_insp = corrcoef(smoothedEnergy,smoothedInspiration);
energy_work = corrcoef(smoothedEnergy,smoothedWork);
energy_REM = corrcoef(smoothedEnergy,smoothedREM);
energy_deep = corrcoef(smoothedEnergy,smoothedDeep);

insp_work = corrcoef(smoothedInspiration,smoothedWork);
insp_REM = corrcoef(smoothedInspiration,smoothedREM);
insp_deep = corrcoef(smoothedInspiration,smoothedDeep);

work_REM = corrcoef(smoothedWork,smoothedREM);
work_deep = corrcoef(smoothedWork,smoothedDeep);

REM_deep = corrcoef(smoothedREM,smoothedDeep);

%% 5 Normalization of All Time Courses

% Taking the mean and standard deviation of all smoothed variables. Then,
% normalizing by subtracting the mean and standard deviation and dviding by
% the standard deviation.

meanSleep = mean(smoothedSleep);
stdSleep = std(smoothedSleep);
normalizedSleep = (smoothedSleep - meanSleep)./stdSleep;

meanMood = mean(smoothedMood);
stdMood = std(smoothedMood);
normalizedMood = (smoothedMood - meanMood)./stdMood;

meanEnergy = mean(smoothedEnergy);
stdEnergy = std(smoothedEnergy);
normalizedEnergy = (smoothedEnergy - meanEnergy)./stdEnergy;

meanInspiration = mean(smoothedInspiration);
stdInspiration = std(smoothedInspiration);
normalizedInspiration = (smoothedInspiration - meanInspiration)./stdInspiration;

meanWork = mean(smoothedWork);
stdWork = std(smoothedWork);
normalizedWork = (smoothedWork - meanWork)./stdWork;

meanREM = mean(smoothedREM);
stdREM = std(smoothedREM);
normalizedREM = (smoothedREM - meanREM)./stdREM;

meanDeep = mean(smoothedDeep);
stdDeep = std(smoothedDeep);
normalizedDeep = (smoothedDeep - meanDeep)./stdDeep;

%% 7 Plotting Normalized Time Courses

figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1],'Menu','none'); %creates a figure on a white background full screen
subplot(2,1,1)
h1 = plot(normalizedSleep);
hold on
h2 = plot(normalizedMood);
hold on
h3 = plot(normalizedEnergy);
hold on
h4 = plot(normalizedInspiration);
hold on
h5 = plot(normalizedWork);
hold on
h6 = plot(normalizedREM);
hold on
h7 = plot(normalizedDeep);
hold on
box off
title ('Normalized Sleep vs. Mood vs. Energy vs. Inspiration vs. Work vs. REM vs. Deep Sleep'); % tites the graph
ylabel('Normalized Z-scores'); % creates a label for the y-axis
xlabel('Day of the Year'); % creates a label for the x-axis
legend ([h1 h2 h3 h4 h5 h6 h7], 'Sleep','Mood','Energy','Inspiration','Work','REM','Deep Sleep');

subplot(2,1,2)
axis off
box off
str = {'The highest positive correlation is between Sleep and REM, r = 0.91.','The highest negative correlation is between Sleep and Work, r = -0.66.','REM sleep is inversely correlated with Mood, r = -0.48.','Deep sleep is not strongly correlated with Mood, r = 0.15.'}; %displays this text, each phrase on a new line, and assigns it to a new viariable str.
text(0.25, 0.5, str,'Fontsize',18);

%% 8 Calculating Days of the Week, Computing Means, and Plotting the Results

for ii = 1:length(Data) % go through the length of the Data
    temp = datestr(Data(:,1)); % convert date string to dates
    [DayNumber] = weekday(temp); % use dates to determine a number of the day of the week
end
 
Data_new = horzcat(Data,DayNumber); % concatenates a new Data sheet with the day numbers included

tempSunday = find(DayNumber == 1); % find teh indices of the day
SundaySleep = Data_new(tempSunday,2); % use these indices to extract values into a new matrix of values
 
tempSunday2 = find(DayNumber == 1);
SundayMood = Data_new(tempSunday2,3);
 
tempSunday3 = find(DayNumber == 1);
SundayWork = Data_new(tempSunday3,6);
 
tempMonday = find(DayNumber == 2);
MondaySleep = Data_new(tempMonday,2);
 
tempMonday2 = find(DayNumber == 2);
MondayMood = Data_new(tempMonday2,3);
 
tempMonday3 = find(DayNumber == 2);
MondayWork = Data_new(tempMonday3,6);
 
tempTuesday = find(DayNumber == 3);
TuesdaySleep = Data_new(tempTuesday,2);
 
tempTuesday2 = find(DayNumber == 3);
TuesdayMood = Data_new(tempTuesday2,3);
 
tempTuesday3 = find(DayNumber == 3);
TuesdayWork = Data_new(tempTuesday3,6);
 
tempWednesday = find(DayNumber == 4);
WednesdaySleep = Data_new(tempWednesday,2);
 
tempWednesday2 = find(DayNumber == 4);
WednesdayMood = Data_new(tempWednesday2,3);
 
tempWednesday3 = find(DayNumber == 4);
WednesdayWork = Data_new(tempWednesday3,6);
 
tempThursday = find(DayNumber == 5);
ThursdaySleep = Data_new(tempThursday,2);
 
tempThursday2 = find(DayNumber == 5);
ThursdayMood = Data_new(tempThursday2,3);
 
tempThursday3 = find(DayNumber == 5);
ThursdayWork = Data_new(tempThursday3,6);
 
tempFriday = find(DayNumber == 6);
FridaySleep = Data_new(tempFriday,2);
 
tempFriday2 = find(DayNumber == 6);
FridayMood = Data_new(tempFriday2,3);
 
tempFriday3 = find(DayNumber == 6);
FridayWork = Data_new(tempFriday3,6);
 
tempSaturday = find(DayNumber == 7);
SaturdaySleep = Data_new(tempSaturday,2);
 
tempSaturday2 = find(DayNumber == 7);
SaturdayMood = Data_new(tempSaturday2,3);
 
tempSaturday3 = find(DayNumber == 7);
SaturdayWork = Data_new(tempSaturday3,6);
 
meanSundaySleep = mean(SundaySleep);
meanMondaySleep = mean(MondaySleep);
meanTuesdaySleep = mean(TuesdaySleep);
meanWednesdaySleep = mean(WednesdaySleep);
meanThursdaySleep = mean(ThursdaySleep);
meanFridaySleep = mean(FridaySleep);
meanSaturdaySleep = mean(SaturdaySleep);
 
meanSundayWork = mean(SundayWork);
meanMondayWork = mean(MondayWork);
meanTuesdayWork = mean(TuesdayWork);
meanWednesdayWork = mean(WednesdayWork);
meanThursdayWork = mean(ThursdayWork);
meanFridayWork = mean(FridayWork);
meanSaturdayWork = mean(SaturdayWork);
 
meanSundayMood = mean(SundayMood);
meanMondayMood = mean(MondayMood);
meanTuesdayMood = mean(TuesdayMood);
meanWednesdayMood = mean(WednesdayMood);
meanThursdayMood = mean(ThursdayMood);
meanFridayMood = mean(FridayMood);
meanSaturdayMood = mean(SaturdayMood);
 
Mood = [meanSundayMood, meanMondayMood, meanTuesdayMood, meanWednesdayMood, meanThursdayMood, meanFridayMood, meanSaturdayMood];
Sleep = [meanSundaySleep, meanMondaySleep, meanTuesdaySleep, meanWednesdaySleep, meanThursdaySleep, meanFridaySleep, meanSaturdaySleep];
Work = [meanSundayWork, meanMondayWork, meanTuesdayWork, meanWednesdayWork, meanThursdayWork, meanFridayWork, meanSaturdayWork];
 
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1]) %opens a new figure full screen on a white background
 
subplot(1,3,1)
p1 = bar(Sleep,'g');
set(gca,'xtick',[1 2 3 4 5 6 7]);
set(gca,'xticklabel',{'S','M','T','W','T','F','S'});
title ('Average Hours of Sleep per Day of the Week'); % titles the graph
ylabel('Sleep'); % creates a label for the y-axis
xlabel('Day of the Week'); % creates a label for the x-axis
axis square
box off
 
subplot(1,3,2)
p2 = bar(Work);
set(gca,'xtick',[1 2 3 4 5 6 7]);
set(gca,'xticklabel',{'S','M','T','W','T','F','S'});
title ('Average Hours of Work per Day of the Week'); % tites the graph
ylabel('Work'); % creates a label for the y-axis
xlabel('Day of the Week'); % creates a label for the x-axis
axis square
box off
 
subplot(1,3,3)
p3 = bar(Mood, 'r');
set(gca,'xtick',[1 2 3 4 5 6 7])
set(gca,'xticklabel',{'S','M','T','W','T','F','S'})
title ('Average Mood per Day of the Week'); % tites the graph
ylabel('Mood'); % creates a label for the y-axis
xlabel('Day of the Week'); % creates a label for the x-axis
axis square
box off
