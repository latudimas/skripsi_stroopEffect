%% Menghitung Nilai IMF
% Input berupa data rerata tiap Kondisi
% Output berupa matrik dengan dimensi (row, column)

close all;
clear;

%% MALE
subjek = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'}; % List of Male Subject
% fileNameNew = sprintf('matdata/IMF_%s.mat',subjek); % For Female Averaging Calculation
%% FEMALE
% subjek = {'Ipon', 'Nia'};
% fileNameNew = sprintf('matdata/GrandAverage_Female.mat'); % For Female Averaging Calculation

for sub = 1: length(subjek)
  fileNameOrigin = sprintf('matdata/SubjekData_%s.mat', subjek{sub});
  load(fileNameOrigin);

  for ch = 1:4
    % Kongruen
    temp = emd(SubjekData(ch).meanK_EMD);
    SubjekData(ch).IMF_Kongruen = temp;

    % Inkongruen
    temp = emd(SubjekData(ch).meanI_EMD);
    SubjekData(ch).IMF_Inkongruen = temp;

    % Netral
    temp = emd(SubjekData(ch).meanN_EMD);
    SubjekData(ch).IMF_Netral = temp;
  end
  save(fileNameOrigin, 'SubjekData');
end
