%% Assignment 4 Scientific Programming for the Behavioral Sciences
% Replicates the experiment paradigm in Posner's Attention Task, records the data,
% tests for significance, and plots the results in both a graph and report
% of sigificance.
% Author: Ben Lang
% Email: ben.lang@nyu.edu
% V1: 3/3/16
% V2: 3/5/16

%% 0 Initialization

clear all % clears the workspace
close all % closes all open figures
clc % clears the command window

%% 1 Start Screen

startScreen = figure('units','normalized','outerposition',[0 0 1 1], 'color',[1 1 1],'Menu','none'); % produces a figure: full screen, no menu, white background
axis off % removes axis from the figure
str = {'Welcome to the experiment.','You will be presented with colored squares.','Press any key when an orange square is present.','Please press any key to begin.'}; % creates a variabele of instructional text
text (0.20, 0.5, str, 'Fontsize',40); % places instructional text within the variable str in roughly the center of the screen
if waitforbuttonpress == 1 % waits for any button press to initiate the experiment
    clf % clears the figure
end
axis off % removes the axis from the figure

%% 2 Building the Interface for the Participant
figure('units','normalized','outerposition',[0 0 1 1], 'color',[1 1 1],'Menu','none');
gridSize=16;
for ii = 1:sqrt(gridSize)
    for jj = 1:sqrt(gridSize)
        h1 = rectangle('Position',[ii jj 1 1]);
    end
end
axis square % centers the axis and makes the graph an even square in size
box off % removes the box that outlines the graph
axis off % removes the axis from the figure


%% 3 Data Organization


trialNum = 1280;
posnerData = zeros(1280,7);
posnerData(:,1) = mod(randperm(trialNum),16) + 1;


for kk = 1:gridSize
    ind = find(posnerData(:,1)==kk);
    temp = mod(randperm(80),4) + 1;
    posnerData(ind,2) = temp;
end

for ii = 1:trialNum % makes a coordinate for each of the spaces in the grid for the target (x-coordinate in col 3 and y-coordinate in col 4 of posnerData)
    if posnerData(ii,1)==1 % if a value is equal to 1 in the first column
        posnerData(ii,3)=1; % place a 1 in the new column 
        posnerData(ii,4)=1; % place a 1 in the new column
    elseif posnerData(ii,1)==2
        posnerData(ii,3)=2;
        posnerData(ii,4)=1;
    elseif posnerData(ii,1)==3
        posnerData(ii,3)=3;
        posnerData(ii,4)=1;
    elseif posnerData(ii,1)==4
        posnerData(ii,3)=4;
        posnerData(ii,4)=1;
    elseif posnerData(ii,1)==5
        posnerData(ii,3)=1;
        posnerData(ii,4)=2;
    elseif posnerData(ii,1)==6
        posnerData(ii,3)=2;
        posnerData(ii,4)=2;
    elseif posnerData(ii,1)==7
        posnerData(ii,3)=3;
        posnerData(ii,4)=2;
    elseif posnerData(ii,1)==8
        posnerData(ii,3)=4;
        posnerData(ii,4)=2;
    elseif posnerData(ii,1)==9
        posnerData(ii,3)=1;
        posnerData(ii,4)=3;
    elseif posnerData(ii,1)==10
        posnerData(ii,3)=2;
        posnerData(ii,4)=3;
    elseif posnerData(ii,1)==11
        posnerData(ii,3)=3;
        posnerData(ii,4)=3;
    elseif posnerData(ii,1)==12
        posnerData(ii,3)=4;
        posnerData(ii,4)=3;
    elseif posnerData(ii,1)==13
        posnerData(ii,3)=1;
        posnerData(ii,4)=4;
    elseif posnerData(ii,1)==14
        posnerData(ii,3)=2;
        posnerData(ii,4)=4;
    elseif posnerData(ii,1)==15
        posnerData(ii,3)=3;
        posnerData(ii,4)=4;
    elseif posnerData(ii,1)==16
        posnerData(ii,3)=4;
        posnerData(ii,4)=4;
    end
end


for ii = 1:trialNum % makes a coordinate for each of the spaces in teh grid for the cue (x-coordinate in col 6 and y-coordinate in col 7 of posnerData)
    posnerData(ii,6)=randi(4); % place a random number between 1 and 4 in the column for x-coordinate of cue
    while posnerData(ii,6)==posnerData(ii,3) % when the coordinate is the same
        posnerData(ii,6)=randi(4); % continue looking for a different random number so that the cue and the target don't have the same x-coordinate
    end
    posnerData(ii,7)=randi(4); % place a random number between 1 and 4 in the column for y-coordinate of cue
    while posnerData(ii,7)==posnerData(ii,4)
        posnerData(ii,7)=randi(4); % continue looking for a different random number so that the cue and the target don't have the same y-coordinate
    end
end

%% 4 Creating the experiment

for tt = 1:trialNum % for all 1280 trials
     if posnerData(tt,2)==1 || posnerData(tt,2)==2 % if it is a 1 or 2, create a valid trial
        h1 = rectangle('Position',[posnerData(tt,3) posnerData(tt,4) 1 1]); % places a rectangle using the x- and y- coordinates from the randomized sheet, posnerData
        h1.FaceColor = [0.25 0.25 0.9]; % makes the rectangle blue
        pause(0.05) % pauses for 5 ms
        h1.FaceColor = 'w'; % returns the rectangle to white (makes the blue reactangle "disappear")
        if posnerData(tt,2)==1 % if the value is 1 in this column, produce a valid trial (100 ms condition)
            pause(0.1) % pause for 100 ms
            h1 = rectangle('Position',[posnerData(tt,3) posnerData(tt,4) 1 1]); % in the same spot as the cue, place a new rectangle
            h1.FaceColor = [1 0.5 0]; % place an orange rectangle as the target
            tic; 
            pause;
            posnerData(tt,5) = toc; % record reaction time in posnerData
            h1.FaceColor = 'w';
            pause((rand(1)/2)); % pause randomly between 0 ms and 500 ms
        elseif posnerData(tt,2)==2 % if the value is 1 in this column, produce a valid trial (300 ms condition)
            pause(0.3) % pause for 300 ms
            h1 = rectangle('Position',[posnerData(tt,3) posnerData(tt,4) 1 1]);
            h1.FaceColor = [1 0.5 0];
            tic;
            pause;
            posnerData(tt,5) = toc;
            h1.FaceColor = 'w';
            pause((rand(1)/2)); % pause randomly between 0 ms and 500 ms
        end
     elseif posnerData(tt,2)==3 || posnerData(tt,2)==4 % if it is a 3 or 4, create invalid trial
        h1 = rectangle('Position',[posnerData(tt,6) posnerData(tt,7) 1 1]); % place a rectangle as the cue, but use a different set of randomized coordinates to create invalid trials
        h1.FaceColor = [0.25 0.25 0.9]; % blue rectangle
        pause(0.05)
        h1.FaceColor = 'w';
        if posnerData(tt,2)==3
            pause(0.1) % pause for 100 ms
            h1 = rectangle('Position',[posnerData(tt,3) posnerData(tt,4) 1 1]);
            h1.FaceColor = [1 0.5 0]; % places an orange rectangle
            tic;
            pause;
            posnerData(tt,5) = toc; % record reaction time in posnerData
            h1.FaceColor = 'w';
            pause((rand(1)/2)); % pause randomly between 0 ms and 500 ms
        elseif posnerData(tt,2)==4
            pause(0.3) % pause for 300 ms
            h1 = rectangle('Position',[posnerData(tt,3) posnerData(tt,4) 1 1]);
            h1.FaceColor = [1 0.5 0]; % places and orange rectangle
            tic;
            pause;
            posnerData(tt,5) = toc;
            h1.FaceColor = 'w';
            pause((rand(1)/2)); % pause randomly between 0 ms and 500 ms
        end
     end
end
close

%% 5 Extracting reaction time for valid and invalid trials

% calculating RT for valid trials and invalid trials
RTV = zeros(1280,1); % creates an empty set of zeros in a matrix
RTI = zeros(1280,1); % creates an empty set of zeros in a matrix

for jj = 1:trialNum
    if posnerData(jj,2)==1 || posnerData(jj,2)==2
        RTV(jj,1) = posnerData(jj,5); % separate out the valid trials and put them in a new matrix
    elseif posnerData(jj,2)==3 || posnerData(jj,2)==4
        RTI(jj,1) = posnerData(jj,5); % separate out the invalid trials and put them ina new matrix
   end
end

RTvalid_loc = find(RTV>0); % find the location of the valid trials
RTinvalid_loc = find(RTI>0); % find the location of the invalid trials

RTvalid = RTV(RTvalid_loc,1); % extract RT data value from original matrix using location and place it into a new matrix
RTinvalid = RTI(RTinvalid_loc,1); % extract RT data value from original matrix using location and place it into a new matrix


% calculating the RT for 100 ms trials and 300 ms trials
RT100_ghost = zeros(1280,1);
RT300_ghost = zeros(1280,1);

for hh = 1:trialNum
    if posnerData(hh,2)==1 || posnerData(hh,2)==3
        RT100_ghost(hh,1) = posnerData(hh,5); % separate out the 100 ms trials and put them in a new matrix
    elseif posnerData(hh,2)==2 || posnerData(hh,2)==4
        RT300_ghost(hh,1) = posnerData(hh,5); % separate out the 300 ms trials and put them in a new matrix
   end
end

RT100_loc = find(RT100_ghost>0); % find the location of the 100 ms trials
RT300_loc = find(RT300_ghost>0); % find the location of the 300 ms trials

RT100 = RT100_ghost(RT100_loc,1); % extract RT data value from original matrix using location and place it into a new matrix
RT300 = RT300_ghost(RT300_loc,1); % extract RT data value from original matrix using location and place it into a new matrix


%% 6 Comparing the distance between target and cue for invalid trials

for xx = 1:trialNum % calculating the total distance for invalid trials
    if posnerData(xx,2) == 3 || posnerData(xx,2) == 4
    d_temp(xx,1) = sqrt(((posnerData(xx,7))-(posnerData(xx,4)))^2 + ((posnerData(xx,6))-(posnerData(xx,3)))^2); % uses the distance formula to calculate teh total distance between two points
    totaldistance_ghost = find(d_temp>0);
    totaldistance = d_temp(totaldistance_ghost,1); % extracts distance values from temporary matrices to create a new matrix of only the total distances
    end
end

for pp = 1:trialNum % calculating the horizontal distance for invalid trials
    if posnerData(pp,2) == 3 || posnerData(pp,2) == 4
    horiz_d_temp(pp,1) = abs((posnerData(pp,6))-(posnerData(pp,3))); % takes the absolute value of the distance between two points
    horizdistance_ghost = find(horiz_d_temp~=0);
    horizdistance = horiz_d_temp(horizdistance_ghost,1);  % extracts distance values from temporary matrices to create a new matrix of only the horizontal distances
    end
end

for qq = 1:trialNum % calculating the vertical distance for invalid trials
    if posnerData(qq,2) == 3 || posnerData(qq,2) == 4
    vert_d_temp(qq,1) = abs((posnerData(qq,7))-(posnerData(qq,4))); % takes the absolute value of the distance between two points
    vertdistance_ghost = find(vert_d_temp~=0);
    vertdistance = vert_d_temp(vertdistance_ghost,1);  % extracts distance values from temporary matrices to create a new matrix of only the vertical distances
    end
end

%% 7 Testing for Significant Differences

% Is there a difference between valid trials and invalid trials?
% Use an independent samples t-test to find the significance, p-value, and confidence interval
% of valid vs. invalid trials.
[sig_valid_vs_invalid,p_valid_vs_invalid,CI_valid_vs_invalid] = ttest2(RTvalid,RTinvalid)

%Is there a difference in reaction times for different delays?
% Use an independent samples t-test to find the significance, p-value, and confidence interval
% of 100ms vs. 300ms delay trials.
[sig,p,CI] = ttest2(RT100,RT300)


%% 8 Organizing Distance Data Before Plotting

totaldistance_RT = horzcat(totaldistance,RTinvalid); % horizontally concatenates two matrices to keep the values in each column in corresponding locations
horizdistance_RT = horzcat(horizdistance,RTinvalid);
vertdistance_RT = horzcat(vertdistance,RTinvalid);

totaldistance_RT = sortrows(totaldistance_RT,1); % sorts the rows in the newly concatenated matrices
horizdistance_RT = sortrows(horizdistance_RT,1);
vertdistance_RT = sortrows(vertdistance_RT,1);

for ii = 1:size(horizdistance) % for the values in this variable
    if horizdistance_RT(ii,1) == 1 % if the value is equal to 1
        RT_temp_1(ii,1) = horizdistance_RT(ii,2); % create a matrix of temporary values of values copied from original matrix
        RT_loc = find(RT_temp_1>0); % use this new temporary matrix to find the location of all values greater than 0 in the matrix
        RT_horiz_1 = RT_temp_1(RT_loc,1); % use the locations in the new location matrix to compare and extract values from the temporary matrix; creates new matrix of only relevant extracted values
    end
end

meanRT_horiz_1 = mean(RT_horiz_1); % gives the mean RT when the horizontal distance was 1

for ii = 1:size(horizdistance) % same as above, but with a new distance matrix
    if horizdistance_RT(ii,1) == 2
        RT_temp_2(ii,1) = horizdistance_RT(ii,2);
        RT_loc = find(RT_temp_2>0);
        RT_horiz_2 = RT_temp_2(RT_loc,1);
    end
end

meanRT_horiz_2 = mean(RT_horiz_2);

for ii = 1:size(horizdistance) % same as above, but with a new distance matrix
    if horizdistance_RT(ii,1) == 3
        RT_temp_3(ii,1) = horizdistance_RT(ii,2);
        RT_loc = find(RT_temp_3>0);
        RT_horiz_3 = RT_temp_3(RT_loc,1);
    end
end

meanRT_horiz_3 = mean(RT_horiz_3);

for ii = 1:size(vertdistance) % same as above, but with a new distance matrix
    if vertdistance_RT(ii,1) == 1
        RT_temp_4(ii,1) = vertdistance_RT(ii,2);
        RT_loc = find(RT_temp_4>0);
        RT_vert_1 = RT_temp_4(RT_loc,1);
    end
end

meanRT_vert_1 = mean(RT_vert_1);

for ii = 1:size(vertdistance) % same as above, but with a new distance matrix
    if vertdistance_RT(ii,1) == 2
        RT_temp_5(ii,1) = vertdistance_RT(ii,2);
        RT_loc = find(RT_temp_5>0);
        RT_vert_2 = RT_temp_5(RT_loc,1);
    end
end

meanRT_vert_2 = mean(RT_vert_2);

for ii = 1:size(vertdistance) % same as above, but with a new distance matrix
    if vertdistance_RT(ii,1) == 3
        RT_temp_6(ii,1) = vertdistance_RT(ii,2);
        RT_loc = find(RT_temp_6>0);
        RT_vert_3 = RT_temp_6(RT_loc,1);
    end
end

meanRT_vert_3 = mean(RT_vert_3);

for ii = 1:size(totaldistance) % same as above, but with a new distance matrix
    if totaldistance_RT(ii,1) < 2
        RT_temp_7(ii,1) = totaldistance_RT(ii,2);
        RT_loc = find(RT_temp_7>0);
        RT_td_1 = RT_temp_7(RT_loc,1);
    end
end

meanRT_td_1 = mean(RT_td_1);

for ii = 1:size(totaldistance) % same as above, but with a new distance matrix
    if totaldistance_RT(ii,1) > 2 && totaldistance_RT(ii,1) < 2.5
        RT_temp_8(ii,1) = totaldistance_RT(ii,2);
        RT_loc = find(RT_temp_8>0);
        RT_td_2 = RT_temp_8(RT_loc,1);
    end
end

meanRT_td_2 = mean(RT_td_2);

for ii = 1:size(totaldistance) % same as above, but with a new distance matrix
    if totaldistance_RT(ii,1) > 2.5 && totaldistance_RT(ii,1) < 3
        RT_temp_9(ii,1) = totaldistance_RT(ii,2);
        RT_loc = find(RT_temp_9>0);
        RT_td_3 = RT_temp_9(RT_loc,1);
    end
end

meanRT_td_3 = mean(RT_td_3);

for ii = 1:size(totaldistance) % same as above, but with a new distance matrix
    if totaldistance_RT(ii,1) > 3 && totaldistance_RT(ii,1) < 3.2
        RT_temp_10(ii,1) = totaldistance_RT(ii,2);
        RT_loc = find(RT_temp_10>0);
        RT_td_4 = RT_temp_10(RT_loc,1);
    end
end

meanRT_td_4 = mean(RT_td_4);

for ii = 1:size(totaldistance) % same as above, but with a new distance matrix
    if totaldistance_RT(ii,1) > 3.5 && totaldistance_RT(ii,1) < 4
        RT_temp_11(ii,1) = totaldistance_RT(ii,2);
        RT_loc = find(RT_temp_11>0);
        RT_td_5 = RT_temp_11(RT_loc,1);
    end
end

meanRT_td_5 = mean(RT_td_5);

for ii = 1:size(totaldistance) % same as above, but with a new distance matrix
    if totaldistance_RT(ii,1) > 4
        RT_temp_12(ii,1) = totaldistance_RT(ii,2);
        RT_loc = find(RT_temp_12>0);
        RT_td_6 = RT_temp_12(RT_loc,1);
    end
end

meanRT_td_6 = mean(RT_td_6);
%% 9 Plotting the distances


x1 = [1.4142 2.2361 2.8284 3.1623 3.6056 4.2426]; % creates a new matrix of distances values
y1 = [meanRT_td_1 meanRT_td_2 meanRT_td_3 meanRT_td_4 meanRT_td_5 meanRT_td_6]; % creates a new matrix of all the means for total distance
    
x2 = [1 2 3]; % creates a new matrix of distances values
y2 = [meanRT_horiz_1 meanRT_horiz_2 meanRT_horiz_2]; % creates a new matrix of all the means for total distance

x3 = [1 2 3]; % creates a new matrix of distances values
y3 = [meanRT_vert_1 meanRT_vert_2 meanRT_vert_3]; % creates a new matrix of all the means for total distance


%does the distance between the cue and the target matter?

figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1],'menu','none'); %creates a figure full screen on a white background with no menu
subplot(1,2,1) % creates a subplot in the first column and first row of a two column subplot group
h1 = plot(x1,y1); % plots the above variables corresponding to the means of the total distance and the means of the reaction times in total distance
set(h1,'linewidth',2) % sets the line width of the graph to 2
hold on % holds the current graph on the figure (allowing for new graphs to plot on top of it)
h2 = plot(x2,y2) % plots the above variables corresponding to the means of the horizontal distance and the means of the reaction times in horizontal distance
set(h2,'linewidth',2) % sets the line width of the graph to 2
hold on % holds the current graph on the figure (allowing for new graphs to plot on top of it)
h3 = plot(x3,y3) % plots the above variables corresponding to the means of the vertical distance and the means of the reaction times in vertical distance
set(h3,'linewidth',2) % sets the line width of the graph to 2
title('Aspect of Distance Between Cue and Target of Invalid Trials','Fontsize',20) % titles the graph
xlabel('Distance between cue and target','Fontsize',15) % labels the x-axis of the graph
ylabel('Reaction Time (s)','Fontsize',15) % labels the y-axis of the graph
l1 = legend([h1,h2,h3],'total distance','horizontal distance','vertical distance','Location','northwest'); %creates a legend and puts it in the upper left corner of the figure
set(l1,'FontSize',15); %sets the fontsize of the legend
axis square % centers the axis and makes the graph an even square in size
box off % removes the box that outlines the graph

reportstr1 = 'The significance and p value for valid vs invalid trials is'; % creates a variable with with a string 'The significance and p value for valid vs invalid trials is'
reportstr2 = num2str ([sig_valid_vs_invalid,p_valid_vs_invalid]); % converts numbers from the t-test into strings and puts them into a matrix
reportstr3 = 'The significance and p value for 100ms vs 300ms delay is'; % creates a variable with a string 'The significance and p value for 100ms vs 300ms delay is'
reportstr4 = num2str ([sig,p]); % converts numbers from the t-test into strings and puts them into a matrix
resultstring = {reportstr1,reportstr2,reportstr3,reportstr4}; % concatenates all string variables into the same row of a new matrix
subplot(1,2,2) % creates a subplot in the second column and first row of a two column subplot group
h4 = text(.1,.9,resultstring); % plots the newly made variable 'resultstring' as a text function
h4.FontSize = 15; % makes the font size of the text into size 15
box off % removes the box that outlines the graph
axis off % removes the axis from the figure
axis square % centers the axis and makes the graph an even square in size

