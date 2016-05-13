% Assignment 3 Scientific Programming for the Behvioral Sciences
% This is a script designed to test reaction times to the popout effect and
% conjunction effect observed in Treisman & Gelade (1980).
% Author:
% Email:
% V1: 2/27/15

%% 0 Initialization

clear all % clears the workspace
close all % closes all figures
clc % clears the command window

%% 1 Displaying stimuli and measuring reaction time for correct trials

startScreen = figure('units','normalized','outerposition',[0 0 1 1], 'color',[1 1 1],'Menu','none'); % produces a figure: full screen, no menu, white background
axis off % removes axis from the figure
str = {'Welcome to the experiment.','Please press any key to begin.','Press "p" when a green "o" appears.','Press "q" when NO green "o" is present.'}; % creates a variabele of instructional text
text (0.25, 0.5, str, 'Fontsize',40); % places instructional text within the variable str in roughly the center of the screen
if waitforbuttonpress == 1 % waits for any button press to initiate the experiment
    clf % clears the figure
end
axis off % makes sure axis is again off before putting new data into the figure

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

%% 2 Plotting the means of the data for each condition in the experiment

rt4p_mean = mean(rt4p); rt8p_mean = mean(rt8p); rt12p_mean = mean(rt12p); rt16p_mean = mean(rt16p); rt4c_mean = mean(rt4c); rt8c_mean = mean(rt8c); rt12c_mean = mean(rt12c); rt16c_mean = mean(rt16c);
% the above line get the mean reaction time from each set size in each
% testing condition


p_means = [rt4p_mean rt8p_mean rt12p_mean rt16p_mean]; % this creates a matrix of the means of reaction times in popout condition
c_means = [rt4c_mean rt8c_mean rt12c_mean rt16c_mean]; % this creates a matrix of the means of reaction times in conjunction condition

labels = [4 8 12 16]; % creates a set of labels for each set size for the graph of results

figure('units','normalized','outerposition',[0 0 1 1], 'color',[1 1 1],'Menu','none'); % produces a figure, full screen, no menu, white background
h = plot(p_means); % plots the means of popout condition on the figure
set(h,'linewidth',2) % sets line width of the data to 2
hold on % holds onto the h graph so that another graph can be plotted simultaneously
h2 = plot(c_means); % plots the means of conjunction condition on the figure
set(h2,'linewidth',2) % sets the line width of the data to 2
set(gca,'XTick', 1:length(labels)); % changes the scale of the x-axis to include unit variation between set sizes
set(gca,'XTickLabel',labels); % places the labels created for each set size on the newly delineated unit markers on the x-axis
xlabel ('Set Size'); % labels the x-axis
ylabel ('Reaction Time (ms)'); % labels the y-axis
title ('Reaction Time to Popout and Conjunction Search') % titles the graph in the figure
l1 = legend ([h h2],'Popout Search','Conjunction Search','Location','northwest') % produces a legend in the top right hand corner of the graph
set(l1,'FontSize',15) % changes the font size of the legend
set(gca,'FontSize',20) % changes the font size of the entire figure to 20
axis square % centers the figure
box off % removes the lines that box off the graph