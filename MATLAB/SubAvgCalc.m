%% Menghitung rerata dari epoch tiap kondisi
close all;
clear;

subjek = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo', 'Nia', 'Peni', 'Sania', 'Nia2'};

for sub = 1:length(subjek)
  disp(subjek(sub));
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
