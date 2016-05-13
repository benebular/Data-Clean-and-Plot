%% Assignment 5 Scientific Programming for the Behavioral Sciences
% This script is designed to replicate a classic experiment in visual
% psychophysics (Hecht, Shlaer, and Pirenne, 1942). The paradigm is more
% complex in the original study and this is a simplified version testing
% the visual field.
% V1: 3/22/15
% Author:
% Email: 

%% 0 Init
clear all; %Emptying workspace
close all; %Closing all figures
clc; %clears the command window

%% 1 Experiment Display
h = figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1],'Menu','none'); %creates a figure on a white background full screen
axis off %removes the axis
str = {'Welcome to the experiment!','Please focus at the dot at the center of the screen.','Please press the "." key any time you see another dot', 'appear to the right of the center dot.','If no dot is present to the right, please press the "," key.','To begin the experiment, press any key.'}; %displays this text, each phrase on a new line, and assigns it to a new viariable str.
text(0.15, 0.5, str,'Fontsize',35); %positions the text at the specified location in font size 20
if waitforbuttonpress == 1 %if any button on the keyboard is pressed
    clf %clear the figure
end %ends the if statement


%% 2 Experiment 1 - Detecting visula threshold at the right of center
temp = uint8(zeros(400,400,3)); %Create a dark stimulus matrix
temp1 = cell(10,1); %Create a cell that can hold 10 matrices
 
for ii = 1:10 %Filling temp1
    temp(200,200,:) = 255; %Inserting a fixation point
    temp(200,240,:) = (ii-1)*10; %Inserting a test point 40 pixels right
    %of it. Brightness range 0 to 90.
    temp1{ii} = temp; %Putting the respective modified matrix in cell
end %Done doing that

stimulusorder = randperm(200); %Creating a random order from 1 to 200.
%For the 200 trials. Allows to have
%a precisely equal number per condition.
stimulusorder = mod(stimulusorder,10); %Using the modulus function to
%create a range from 0 to 9. 20 each.
stimulusorder = stimulusorder + 1; %Now, the range is from 1 to 10, as
%desired.
peripheryscore = zeros(10,1); %Keeping score. How many stimuli were reported seen

for ii = 1:200 %200 trials, 20 per condition
    image(temp1{stimulusorder(1,ii)}) %Image the respective matrix. As
    %designated by stimulusorder
    ii %Give observer feedback about which trial we are in. No other feedback.
    pause; %Get the keypress
    temp2 = get(h,'CurrentCharacter'); %Get the keypress. ?.? for present,
    %?,? for absent.
    temp3 = strcmp('.', temp2); %Compare strings. If . (present), temp3 = 1,
    %otherwise 0.
    peripheryscore(stimulusorder(1,ii)) = peripheryscore(stimulusorder(1,ii)) + temp3; %Add up.
    % In the respective score sheet.
end %End the presentation of trials, after 200 have lapsed.
clf %clears figure

%% Experiment Transition

axis off %removes the axis
str = {'Great job! Part 1 is finished.','Please focus on the center of the screen.','Please press the "." key any time you see a white dot','appear at the center.','If no dot is present, please press the "," key.','To begin the experiment, press any key.'}; %displays this text, each phrase on a new line, and assigns it to a new viariable str.
text(0.15, 0.5, str,'Fontsize',35); %positions the text at the specified location in font size 20
pause(2)
if waitforbuttonpress == 1 %if any button on the keyboard is pressed
    clf %clear the figure
end %ends the if statement


%% 3 Experiment 2 - Detecting the threshold at the center of the screen

for ii = 1:10 %Filling temp1
    temp(200,240,:) = 0; %darkens previous fixation point at 40 pixels to black
    temp(200,200,:) = (ii-1)*10; %inserting test point at center
    %of it. Brightness range 0 to 90.
    temp1{ii} = temp; %Putting the respective modified matrix in cell
end %Done doing that


stimulusorder = randperm(200); %Creating a random order from 1 to 200.
%For the 200 trials. Allows to have
%a precisely equal number per condition.
stimulusorder = mod(stimulusorder,10); %Using the modulus function to
%create a range from 0 to 9. 20 each.
stimulusorder = stimulusorder + 1; %Now, the range is from 1 to 10, as
%desired.
centerscore = zeros(10,1); %Keeping score. How many stimuli were reported seen

for ii = 1:200 %200 trials, 20 per condition
    image(temp1{stimulusorder(1,ii)}) %Image the respective matrix. As
    %designated by stimulusorder
    ii %Give observer feedback about which trial we are in. No other feedback.
    pause; %Get the keypress
    temp2 = get(h,'CurrentCharacter'); %Get the keypress. ?.? for present,
    %?,? for absent.
    temp3 = strcmp('.', temp2); %Compare strings. If . (present), temp3 = 1,
    %otherwise 0.
    centerscore(stimulusorder(1,ii)) = centerscore(stimulusorder(1,ii)) + temp3; %Add up.
    % In the respective score sheet.
end %End the presentation of trials, after 200 have lapsed.
clf %clears figure

%% Experiment Transition

axis off %removes the axis
str = {'Great job! Part 2 is finished.','Please focus on the center of the screen.','Please press the "." key any time you see a green dot','appear at the center.','If no dot is present, please press the "," key.','To begin the experiment, press any key.'}; %displays this text, each phrase on a new line, and assigns it to a new viariable str.
text(0.15, 0.5, str,'Fontsize',35); %positions the text at the specified location in font size 20
pause(2)
if waitforbuttonpress == 1 %if any button on the keyboard is pressed
    clf %clear the figure
end %ends the if statement

%% 4.0 Experiment 3 - Detecting vision threshold for a green dot

for ii = 1:10 %Filling temp1
    temp(200,200,1) = 0; % turns off the red on a fixation point at center
    temp(200,200,3) = 0; % turns off the blue on a fixation point at center
    temp(200,200,2) = (ii-1)*10; %Inserting a test point at center in color green
    %of it. Brightness range 0 to 90.
    temp1{ii} = temp; %Putting the respective modified matrix in cell
end %Done doing that


stimulusorder = randperm(200); %Creating a random order from 1 to 200.
%For the 200 trials. Allows to have
%a precisely equal number per condition.
stimulusorder = mod(stimulusorder,10); %Using the modulus function to
%create a range from 0 to 9. 20 each.
stimulusorder = stimulusorder + 1; %Now, the range is from 1 to 10, as
%desired.
greenscore = zeros(10,1); %Keeping score. How many stimuli were reported seen

for ii = 1:200 %200 trials, 20 per condition
    image(temp1{stimulusorder(1,ii)}) %Image the respective matrix. As
    %designated by stimulusorder
    ii %Give observer feedback about which trial we are in. No other feedback.
    pause; %Get the keypress
    temp2 = get(h,'CurrentCharacter'); %Get the keypress. ?.? for present,
    %?,? for absent.
    temp3 = strcmp('.', temp2); %Compare strings. If . (present), temp3 = 1,
    %otherwise 0.
    greenscore(stimulusorder(1,ii)) = greenscore(stimulusorder(1,ii)) + temp3; %Add up.
    % In the respective score sheet.
end %End the presentation of trials, after 200 have lapsed.
clf %clears figure

%% Experiment Transition

axis off %removes the axis
str = {'Great job! Part 3 is finished.','Please focus on the center of the screen.','Please press the "." key any time you see a red dot','appear at the center.','If no dot is present, please press the "," key.','To begin the experiment, press any key.'}; %displays this text, each phrase on a new line, and assigns it to a new viariable str.
text(0.15, 0.5, str,'Fontsize',35); %positions the text at the specified location in font size 20
pause(2)
if waitforbuttonpress == 1 %if any button on the keyboard is pressed
    clf %clear the figure
end %ends the if statement

%% 4.1 Experiment 3 - Detecting vision threshold for a red dot

for ii = 1:10 %Filling temp1
    temp(200,200,2) = 0; % turns off the green at center
    temp(200,200,3) = 0; % turns off the blue at center
    temp(200,200,1) = (ii-1)*10; %Inserting a test point at center in color red
    %of it. Brightness range 0 to 90.
    temp1{ii} = temp; %Putting the respective modified matrix in cell
end %Done doing that


stimulusorder = randperm(200); %Creating a random order from 1 to 200.
%For the 200 trials. Allows to have
%a precisely equal number per condition.
stimulusorder = mod(stimulusorder,10); %Using the modulus function to
%create a range from 0 to 9. 20 each.
stimulusorder = stimulusorder + 1; %Now, the range is from 1 to 10, as
%desired.
redscore = zeros(10,1); %Keeping score. How many stimuli were reported seen

for ii = 1:200 %200 trials, 20 per condition
    image(temp1{stimulusorder(1,ii)}) %Image the respective matrix. As
    %designated by stimulusorder
    ii %Give observer feedback about which trial we are in. No other feedback.
    pause; %Get the keypress
    temp2 = get(h,'CurrentCharacter'); %Get the keypress. ?.? for present,
    %?,? for absent.
    temp3 = strcmp('.', temp2); %Compare strings. If . (present), temp3 = 1,
    %otherwise 0.
    redscore(stimulusorder(1,ii)) = redscore(stimulusorder(1,ii)) + temp3; %Add up.
    % In the respective score sheet.
end %End the presentation of trials, after 200 have lapsed.
clf %clears figure

%% Experiment Transition

axis off %removes the axis
str = {'Great job! Part 4 is finished.','Please focus on the center of the screen.','Please press the "." key any time you see a blue dot','appear at the center.','If no dot is present, please press the "," key.','To begin the experiment, press any key.'}; %displays this text, each phrase on a new line, and assigns it to a new viariable str.
text(0.15, 0.5, str,'Fontsize',35); %positions the text at the specified location in font size 20
pause(2)
if waitforbuttonpress == 1 %if any button on the keyboard is pressed
    clf %clear the figure
end %ends the if statement

%% 4.2 Experiment 3 - Detecting vision threshold for a blue dot

for ii = 1:10 %Filling temp1
    temp(200,200,2) = 0; % turns off the green at center
    temp(200,200,1) = 0; % turns off the red at center
    temp(200,200,3) = (ii-1)*10; %Inserting a test point at center in color blue
    %of it. Brightness range 0 to 90.
    temp1{ii} = temp; %Putting the respective modified matrix in cell
end %Done doing that


stimulusorder = randperm(200); %Creating a random order from 1 to 200.
%For the 200 trials. Allows to have
%a precisely equal number per condition.
stimulusorder = mod(stimulusorder,10); %Using the modulus function to
%create a range from 0 to 9. 20 each.
stimulusorder = stimulusorder + 1; %Now, the range is from 1 to 10, as
%desired.
bluescore = zeros(10,1); %Keeping score. How many stimuli were reported seen

for ii = 1:200 %200 trials, 20 per condition
    image(temp1{stimulusorder(1,ii)}) %Image the respective matrix. As
    %designated by stimulusorder
    ii %Give observer feedback about which trial we are in. No other feedback.
    pause; %Get the keypress
    temp2 = get(h,'CurrentCharacter'); %Get the keypress. ?.? for present,
    %?,? for absent.
    temp3 = strcmp('.', temp2); %Compare strings. If . (present), temp3 = 1,
    %otherwise 0.
    bluescore(stimulusorder(1,ii)) = bluescore(stimulusorder(1,ii)) + temp3; %Add up.
    % In the respective score sheet.
end %End the presentation of trials, after 200 have lapsed.
clf %clears figure

%% Experiment Transition

axis off %removes the axis
str = {'Great job! Part 5 is finished.','You will now see two dots.','One to the left and one at the center.','Please focus on the dot at the center of the screen.','Another dot will appear to the right occasionally.','Please press the "." key if the right dot is brighter','than the dot to the left of center.','Please press the "," key if the right dot is dimmer','than the dot to the left of center.','To begin the experiment, press any key.'}; %displays this text, each phrase on a new line, and assigns it to a new viariable str.
text(0.15, 0.5, str,'Fontsize',35); %positions the text at the specified location in font size 20
pause(2)
if waitforbuttonpress == 1 %if any button on the keyboard is pressed
    clf %clear the figure
end %ends the if statement

%% 5 Experiment 4 - Detecting the relative threshold of two dots

for ii = 1:10 %Filling temp1
    temp(200,200,:) = 255; %Inserting a fixation point
    temp(200,160,:) = 127.5; %Inserting a test point 40 pixels left
    temp(200,240,:) = (ii-1)*10; %Inserting a test point 40 pixels right
    %of it. Brightness range 0 to 90.
    temp1{ii} = temp; %Putting the respective modified matrix in cell
end %Done doing that

stimulusorder = randperm(200); %Creating a random order from 1 to 200.
%For the 200 trials. Allows to have
%a precisely equal number per condition.
stimulusorder = mod(stimulusorder,10); %Using the modulus function to
%create a range from 0 to 9. 20 each.
stimulusorder = stimulusorder + 1; %Now, the range is from 1 to 10, as
%desired.
relativescoredimmer = zeros(10,1); %Keeping score. How many dimmer stimuli were reported seen
relativescorebrighter = zeros(10,1); %Keeping score. How many brighter stimuli were reported seen

for ii = 1:200 %200 trials, 20 per condition
    image(temp1{stimulusorder(1,ii)}) %Image the respective matrix. As
    %designated by stimulusorder
    ii %Give observer feedback about which trial we are in. No other feedback.
    pause; %Get the keypress
    temp2 = get(h,'CurrentCharacter'); %Get the keypress. ?.? for present,
    %?,? for absent.
    if strcmp('.', temp2) == 1; %Compare strings. If . record correct response
        relativescorebrighter(stimulusorder(1,ii)) = relativescorebrighter(stimulusorder(1,ii)) + 1; %Add up.
        % In the respective score sheet.
    elseif strcmp(',', temp2) == 1; %Compare strings. If , record correct response
        relativescoredimmer(stimulusorder(1,ii)) = relativescoredimmer(stimulusorder(1,ii)) + 1; %Add up.
        % In the respsective score sheet.
    end
end %End the presentation of trials, after 200 have lapsed.
clf % clear figure
close % close figure

%% 6 Calculating Probabilities for Each Outcome

% Calculates the probability of each outcome by dividing the number of
% responses for each trial by the number of possible responses in each
% trial.

probcenterscore = centerscore./20;
probperipheryscore = peripheryscore./20;
probgreenscore = greenscore./20;
probbluescore = bluescore./20;
probredscore = redscore./20;
probrelscorebrighter = relativescorebrighter./20;
probrelscoredimmer = relativescoredimmer./20;

%% 7 Plotting

% Plots graphs as three subplots, full screen, and commentary in the fourth
% subplot. The first graph is between periphery and center conditions. The
% second graph is between color conditions. The third graph is between
% relative brightness and dimness levels. Each graph has it's own legend
% and each data set has its own color. X-axis labels were also created in
% addition to the labels for each axis and titles in each graph. Legends
% are included for each one as well.

labels = [0 10 20 30 40 50 60 70 80 90]; % labels for x-axis
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1],'Menu','none'); % fullscreen
subplot(2,2,1)
x = 1:10;
y1 = probperipheryscore;
h1 = plot(x,y1);
h1.Color = [0.3 0.8 0];
hold on
y2 = probcenterscore;
h2 = plot(x,y2);
h2.Color = 'm';
hold on
ylim([0 1]);
set(gca,'XTick',1:length(labels));
set(gca,'XTickLabel',labels);
ylabel('Probability Reported Seen')
xlabel('Brightness')
title('Periphery vs. Center Scores')
l1 = legend([h1 h2], 'Periphery Score','Center Score','Location','northwest');
box off

subplot(2,2,2)
x = 1:10;
y3 = probredscore;
h3 = plot(x,y3);
h3.Color = 'r';
hold on
y4 = probgreenscore;
h4 = plot(x,y4);
h4.Color = 'g';
hold on
y5 = probbluescore;
h5 = plot(x,y5);
h5.Color = 'b';
hold on
ylim([0 1]);
set(gca,'XTick',1:length(labels));
set(gca,'XTickLabel',labels);
ylabel('Probability Reported Seen')
xlabel('Brightness')
title('Red vs. Green vs. Blue Scores')
l2 = legend([h3 h4 h5], 'Red Score','Green Score','Blue Score','Location','northwest');
box off

subplot(2,2,3)
x = 1:10;
y6 = probrelscorebrighter;
h6 = plot(x,y6);
h6.Color = 'c';
hold on
y7 = probrelscoredimmer;
h7 = plot(x,y7);
h7.Color = [1 0.5 0.5];
hold on
ylim([0 1]);
set(gca,'XTick',1:length(labels));
set(gca,'XTickLabel',labels);
ylabel('Probability Reported Seen')
xlabel('Brightness')
title('Relative Brightness vs. Relative Dimness Score')
l3 = legend([h6 h7], 'Relative Brightness Score','Relative Dimness Score','Location','northwest');
box off

subplot(2,2,4)
axis off
box off
str = {'The threshold is higher for periphery scores than center scores.','The threshold is consistently highest for green scores, less high for red relative to green,','and lowest for the blue.','The relative threshold depends on the absolute brightness values of the dots.','When the brightness difference is greater between the left dot and right dot,','the more likely we are to distinguish the two stimuli.'}; %displays this text, each phrase on a new line, and assigns it to a new viariable str.
text(0.15, 0.5, str,'Fontsize',12);


