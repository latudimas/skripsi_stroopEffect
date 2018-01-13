close all;
clear;

subjek = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'};
fileNameNew = sprintf('matdata/GrandAverage.mat');
% save(fileNameNew);
% load(fileNameNew);

GrandAverage = struct('meanK_EMD', [], 'meanI_EMD', [], 'meanN_EMD', [], 'meanK_ERP', [], 'meanI_ERP', [],'meanN_ERP', [] );

for sub = 1:length(subjek)
  fileNameOrigin = sprintf('matdata/SubjekData_%s.mat', subjek{sub});
  load(fileNameOrigin);

  for ch = 1:4
    % Kongruen Condition
    GrandAverage(ch).meanK_EMD(sub,:) = mean(SubjekData(ch).K_emd);
    GrandAverage(ch).meanK_ERP(sub,:) = mean(SubjekData(ch).Kongruen);

    % Inkongruen Condition
    GrandAverage(ch).meanI_EMD(sub,:) = mean(SubjekData(ch).I_emd);
    GrandAverage(ch).meanI_ERP(sub,:) = mean(SubjekData(ch).Inkongruen);

    % Netral Condition
    GrandAverage(ch).meanN_EMD(sub,:) = mean(SubjekData(ch).N_emd);
    GrandAverage(ch).meanN_ERP(sub,:) = mean(SubjekData(ch).Netral);
  end
  save(fileNameNew, 'GrandAverage');
end
