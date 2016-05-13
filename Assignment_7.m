%% Assignment 7
%V1: 04/05/2016
 
%% 0 Init
clear all; close all; clc %clears the workspace, closes all figures, clears the command window
 
%% 1 Loader - Loads the data
 
load Top_100_male_midwestern.mat; %loads the data into the workspace
 
%% 2 Reformatting the Data
 
clearvars fs bits %deletes the variables fs and bits, leaving only the data
DATA = whos; %creates a new structure called DATA of all the data expluding fs and bits
 
fs = 44100; %recreates fs
bits = 16; %recreates bits
 
%% 3 Plotting Amplitude over Time
 
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1]); %opens a new figure full screen on a white background
 
for ii = 1:100 %loop through 100 times
    subplot (10,10,ii); %subplot in spot ii of 100
    plot(eval(DATA(ii).name)); %plot each word from row ii of DATA
    claim = DATA(ii).name;
    new_claim = strrep(claim, '1','');
    DATA(ii).name = new_claim;
    title(DATA(ii).name);
    axis off %turns axes off
    box off %turns box off
end


%% 4 Plotting Spectrograms

wind = hamming(8 % uses a window of 8, hamming method
overl = 7; % overlap of 7
Fpoints = 0:1:512; % creates frequency points from 0 to 512 in steps of 1

figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(about1, wind, overl, Fpoints, fs, 'yaxis');
title('About');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(into1, wind, overl, Fpoints, fs, 'yaxis');
title('Into');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(people1, wind, overl, Fpoints, fs, 'yaxis');
title('People');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(water1, wind, overl, Fpoints, fs, 'yaxis');
title('Water');
%%
kwind = kaiser(8);
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(about1, kwind, overl, Fpoints, fs, 'yaxis');
title('About');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(into1, kwind, overl, Fpoints, fs, 'yaxis');
title('Into');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(people1, kwind, overl, Fpoints, fs, 'yaxis');
title('People');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(water1, kwind, overl, Fpoints, fs, 'yaxis');
title('Water');
%%
wind2 = hamming(512); % uses a window of 512, hamming method
overl2 = 511; % overlap of 511
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(about1, wind2, overl2, Fpoints, fs, 'yaxis');
title('About');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(into1, wind2, overl2, Fpoints, fs, 'yaxis');
title('Into');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(people1, wind2, overl2, Fpoints, fs, 'yaxis');
title('People');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(water1, wind2, overl2, Fpoints, fs, 'yaxis');
title('Water');
%%
kwind2 = kaiser(512); % creates a kaiser window of 512
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(about1, kwind2, overl2, Fpoints, fs, 'yaxis');
title('About');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(into1, kwind2, overl2, Fpoints, fs, 'yaxis');
title('Into');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(people1, kwind2, overl2, Fpoints, fs, 'yaxis');
title('People');
%%
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1])
spectrogram(water1, kwind2, overl2, Fpoints, fs, 'yaxis');
title('Water');
