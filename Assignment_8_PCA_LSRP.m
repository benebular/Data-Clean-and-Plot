%% Assignment 8
% This code does a PCA on data from candidates that filled out a
% psychopathy assessment exam.
% Author: Ben Lang
% Email: ben.lang@nyu.edu
% The data belongs to Pascal Wallisch.

%% 0 Init
clc; clear all; close all; %clears the command window, clears teh workspace, and closes all figures
 
%% 1 Loader
 
[Data, header, allData] = xlsread('LSRP.xlsx'); %loads the data into the workspace
 
%% 2 Reverse Coding the Data 

a = length(Data); %creates variable the length of Data
dataR = Data; %creates a new variable dataR that is the same as Data
 
for ii = 1:a; 
    if Data(ii,6) == 5; %if column 6 of Data is equal to 5
        dataR(ii,6) = 1; % put a 1 in the same location in dataR
    elseif Data(ii,6) == 4; %if column 6 of Data is equal to 5
        dataR(ii,6) = 2; % put a 2 in the same location in dataR
    elseif Data(ii,6) == 2; %if column 6 of Data is equal to 2
        dataR(ii,6) = 4; % put a 4 in the same location in dataR
    elseif Data(ii,6) == 1; %if column 6 of Data is equal to 1
        dataR(ii,6) = 5; % put a 5 in the same location in dataR
    end %end the if statement
end %end the for loop
 
%do the same for columns 14, 19, 22, 24, 25 and 25
for ii = 1:a;
    if Data(ii,14) == 5;
        dataR(ii,14) = 1;
    elseif Data(ii,14) == 4;
        dataR(ii,14) = 2;
    elseif Data(ii,14) == 2;
        dataR(ii,14) = 4;
    elseif Data(ii,14) == 1;
        dataR(ii,14) = 5;
    end
end
 
for ii = 1:a;
    if Data(ii,19) == 5;
        dataR(ii,19) = 1;
    elseif Data(ii,19) == 4;
        dataR(ii,19) = 2;
    elseif Data(ii,19) == 2;
        dataR(ii,19) = 4;
    elseif Data(ii,19) == 1;
        dataR(ii,19) = 5;
    end
end
 
for ii = 1:a;
    if Data(ii,22) == 5;
        dataR(ii,22) = 1;
    elseif Data(ii,22) == 4;
        dataR(ii,22) = 2;
    elseif Data(ii,22) == 2;
        dataR(ii,22) = 4;
    elseif Data(ii,22) == 1;
        dataR(ii,22) = 5;
    end
end
 
for ii = 1:a;
    if Data(ii,24) == 5;
        dataR(ii,24) = 1;
    elseif Data(ii,24) == 4;
        dataR(ii,24) = 2;
    elseif Data(ii,24) == 2;
        dataR(ii,24) = 4;
    elseif Data(ii,24) == 1;
        dataR(ii,24) = 5;
    end
end
 
 
for ii = 1:a;
    if Data(ii,25) == 5;
        dataR(ii,25) = 1;
    elseif Data(ii,25) == 4;
        dataR(ii,25) = 2;
    elseif Data(ii,25) == 2;
        dataR(ii,25) = 4;
    elseif Data(ii,25) == 1;
        dataR(ii,25) = 5;
    end
end
 
 
for ii = 1:a;
    if Data(ii,26) == 5;
        dataR(ii,26) = 1;
    elseif Data(ii,26) == 4;
        dataR(ii,26) = 2;
    elseif Data(ii,26) == 2;
        dataR(ii,26) = 4;
    elseif Data(ii,26) == 1;
        dataR(ii,26) = 5;
    end
end

%% 3 Deleting last 5 columns

dataR(:,27:31) = []; %deletes the last 5 columns of dataR (demographic info)

%% 4 Dealing with Missing Data

dataR(any(isnan(dataR),2),:) = []; % removes any rows with missing data

%% 5 Plotting the Distribution of Total Scores

% Finding total score for each participant

scores = zeros(length(dataR),1); %creates a matrix of zeros the length of dataR

for ii = 1:length(dataR) %for 1 to length of dataR
    scores(ii,1) = sum(dataR(ii,1:26)); %add the scores in each row of dataR and place that value in the same row in scores
end

figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1]); %open a figure full screen on a white background
histogram(scores,597,'BinWidth',1); %create a histogram with a binwidth of 1
axis square; %square the axis
title('Distribution of Total Scores of Participants','FontSize',15); %creates a title in fontsize 15
ylabel('Frequency'); %title for y label = Frequency
xlabel('Total Score'); %title for x label = Total Score

%% 6 Principal Component Analysis

[eigVecs,rotVals,eigVals] = princomp(dataR); %do a principle component analysis of dataR

figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1]); %open a figure full screen on a white background
plot3(rotVals(:,1),rotVals(:,2),rotVals(:,3),'.','color','k'); %plots rotation values in a 3D scatterplot
title('PCA Plot')
axis square %square the axis
axis equal %make axes equal 

figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1]); %open a figure full screen on a white background
plot(eigVals) % scree plot of eigenvalues, visualizes how many factors there are. From this scree plot, we can see that there are 4 factos. 
title('Scree Plot') % creates a title
axis square % squares the axis


%% 7 Determining the value

coeffs = zeros(26,26) % creates a matrix of zeros for the correlation coefficients

for ee = 0:length(coeffs)-1 %For loops used to create correlation coefficients of all the data, data is shifted by one column so that there is a window for taking the coefficients.
for cc = 1:length(coeffs)
    coeffs(1+ee,cc) = corr2(dataR(:,1+ee),rotVals(:,cc));
end
end
coeffs % displays correlation values

figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1]); % open a figure full screen on a white background
plot(coeffs,eigVecs,'.'); % plots the two factors onto the same graph
title('Individual Scores in the Factor Space','Fontsize',15) % creates a title
ylabel('Factor 1') % makes y-label
xlabel('Factor 2') % makes x-label
axis square % squares the axis

% There are two factors.

