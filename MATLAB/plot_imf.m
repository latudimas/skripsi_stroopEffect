%% Plotting IMF
% Membuat plot berdasarkan IMF yang dihasilkan

% close all;
% clear;

% subjek = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'};
% tPlot = -200:1000/200:800-1;

% for sub = 1:length(subjek)
%   fileNameOrigin = sprintf('matdata/SubjekData_%s.mat', subjek{sub});
%   load(fileNameOrigin);

%   for ch = 1:4
%     h = figure('Name', sprintf('IMF Netral Ch %d %s', ch, subjek{sub}));
%     %Plot IMF dan FFT
%     temp = SubjekData(ch).IMF_Netral;
%     s = size(temp, 1);
%     for row = 1:s
%       subplot(s, 1, row); plot(tPlot, temp(row,:));
%     end
%     saveas(h, sprintf('Pictures/IMF/IMF Netral Ch %d %s', ch, subjek{sub}));
%   end
% end

%%-----------------------------------------------------------------------

fileName = 'matdata/FusionData.mat';
load(fileName);

tPlot = -200:1000/200:799;

for ch = 1:4
  %% KONGRUEN
  % Male Subjek
  temp = FusionData(ch).imfKMale;
  s = size(temp,1);
  h = figure('Name', sprintf('IMF MALE Ch %d', ch));
  % figure; title(sprintf('IMF MALE Ch %d, ch'));
  for row = 1:s
    subplot(s,1,row); plot(tPlot,temp(row,:));
  end
  
  % Female Subjek
  temp = FusionData(ch).imfKFemale;
  s = size(temp,1);
  h = figure('Name', sprintf('IMF FEMALE Ch %d', ch));
  % figure; title(sprintf('IMF FEMALE Ch %d, ch'));
  for row = 1:s
    subplot(s,1,row); plot(tPlot,temp(row,:));
  end

  
end