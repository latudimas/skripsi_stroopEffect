close all;
clear;

%% Bukan menghitung Grand Average, tapi menghitung rerata total tiap subjek
%% MALE
% subjek = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'}; % List of Male Subject
% fileNameNew = sprintf('matdata/GrandAverage_Male.mat'); % For Female Averaging Calculation
%% FEMALE
subjek = {'Ipon', 'Nia'};
% fileNameNew = sprintf('matdata/GrandAverage_Female.mat'); % For Female Averaging Calculation

%% Struct
% GrandAverage = struct('meanK_EMD', [], 'meanI_EMD', [], 'meanN_EMD', [], 'meanK_ERP', [], 'meanI_ERP', [],'meanN_ERP', [] );

for sub = 1:length(subjek)
  fileNameOrigin = sprintf('matdata/SubjekData_%s.mat', subjek{sub});
  load(fileNameOrigin);

  for ch = 1:4
    % Kongruen Condition
    SubjekData(ch).meanK_EMD = mean(SubjekData(ch).K_emd);
    SubjekData(ch).meanK_ERP = mean(SubjekData(ch).Kongruen);

    % Inkongruen Condition
    SubjekData(ch).meanI_EMD = mean(SubjekData(ch).I_emd);
    SubjekData(ch).meanI_ERP = mean(SubjekData(ch).Inkongruen);

    % Netral Condition
    SubjekData(ch).meanN_EMD = mean(SubjekData(ch).N_emd);
    SubjekData(ch).meanN_ERP = mean(SubjekData(ch).Netral);
  end
  save(fileNameOrigin, 'SubjekData');
end
