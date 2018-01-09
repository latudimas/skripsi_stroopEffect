% EMD Calculation
% Create imf from average

close all;
clear;

subjectName = 'Ahmad';
fileName = sprintf('matdata/SubjekData_%s.mat', subjectName);
load(fileName);

for i = 1:4
  for j = 1:3
    temp(j,:) = SubjekData(i).FilterHigh(j,:);
  end
  SubjekData(i).KongruenHigh = temp;
end

% tempEpoch = cacahData(EMDStruct.rawFull); % potong data raw
% EMDStruct.rawEpoch = tempEpoch;
%
% % input dari EMD itu hanya 1 matrix (column vector)
% % Untuk mengolah 4 channel berarti harus looping (pemanggilan fungsinya)
% imfMat = emd(tempEpoch{1,1});
% sz = size(imfMat,1);
% tStart =-200;
% tStop = 800;
% tPlot = tStart:1000/200:tStop-1;
%
% figure;
% for i = 1:sz
%   subplot(sz,1,i);
%   plot(tPlot, imfMat(i,:));
% end
