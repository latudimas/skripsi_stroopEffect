%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               PRE-PRCOSSING           %
%           Riswandha Latu Dimas        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear;

%% Variabel
fs = 200; % frekuensi sampling

timeOverlap = 1;
tStart = 0;
tEnd = 60; %ambil sampai stimulus ke-30
% range data untuk dipotong
rangeTime = (((tStart+timeOverlap)*fs)+1) : ((tEnd+timeOverlap)*fs); 

tStart = 0;
tStop = 4;
tPlot = (0:((tStop-tStart)*fs)-1)/fs; %untuk sumbu X plot

%% Load Data
load Data/OpenBCI-RAW-Jaler_25_10_01.txt;
% Potong Data dari START RECORDING(App) ~ STOP STREAMING(OpenBCI) 
dataRaw = OpenBCI_RAW_Jaler_25_10_01((21523-6):end,2:5); %Potong Data(baris, kolom) 
dataRaw = dataRaw';

%% Cell Array RAW
% Simpan data raw kedalam cell array
for i = 1:4
    dataRawCell{i} = dataRaw(i, 1:end);
end

%% Cacah dan Plotting Data RAW
 cacahRaw = cacahData(dataRawCell);
 %plottingCacah(cacahRaw, tPlot, 'RAW');

%% Filtering
[bF aF] = butter(2, [1 10]/(fs/2)); %COBA FILTER
% [bA aA] = butter(2, [7 13]/(fs/2)); %ALPHA FILTER
[bN aN] = butter(2, [49 51]/(fs/2), 'stop'); %NOTCH FILTER

% Konvolusi filter
bC = conv(bF, bN);
aC = conv(aF, aN);

%% Cell Array Filter
% buat Cell Array untuk simpan data Filter
for i = 1:4
    dataFilterCell{i} = filter(bC, aC, dataRawCell{i});
end

%% Potong Data [rangeTime]
%figure;
for i = 1:4
    dataPotongFilter{i} = dataFilterCell{i}(rangeTime);
    %subplot(4,1,i); plot(dataPotongFilter{i}); title(sprintf('Channel%d', i)); 
end

%% Cacah dan Plotting data FILTER
cacahFilter = cacahData(dataPotongFilter);
plottingCacah(cacahFilter, tPlot, 'FILTER');

%% PRINT DATA INTO .txt
%Buat text file 
% fileID = fopen('DataCampur.txt', 'wt');
% saveToTxt(fileID, cacah);

%% FFT DATA 
% %% FFT
% Ak = abs(fft(dataPotongFilter{1}) / length(dataPotongFilter{1}));
% k = 0:1:length(dataPotongFilter{1})-1;
% f = k*fs/length(dataPotongFilter{1});