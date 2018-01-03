% EMD test 1-10 data

close all;
clear;

subjectName = 'Ahmad';
fileName = sprintf('matdata/SubjekData_%s_10.mat', subjectName);

load(fileName);

EMDStruct = struct('rawFull', [], 'rawEpoch', []);
EMDStruct.rawFull = SubjekData(1).RAW; % holder raw data

% WARNING :fungsi cacah Data hanya untuk 1 baris vektor matrik, lain kata 1 channel input only
% Looping jika ingin mengeksekusi 4 data
tempEpoch = cacahData(EMDStruct.rawFull); % potong data raw
EMDStruct.rawEpoch = tempEpoch;

% input dari EMD itu hanya 1 matrix (column vector)
% Untuk mengolah 4 channel berarti harus looping (pemanggilan fungsinya)
imfMat = emd(tempEpoch{1,1});
sz = size(imfMat,1);
tStart =-200;
tStop = 800;
tPlot = tStart:1000/200:tStop-1;

figure;
for i = 1:sz
  subplot(sz,1,i);
  plot(tPlot, imfMat(i,:));
end
