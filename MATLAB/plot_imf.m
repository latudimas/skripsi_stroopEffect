close all;
clear;

subjek = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'};
tPlot = -200:1000/200:800-1;

for sub = 1:length(subjek)
  fileNameOrigin = sprintf('matdata/SubjekData_%s.mat', subjek{sub});
  load(fileNameOrigin);

  for ch = 1:4
    h = figure('Name', sprintf('IMF Netral Ch %d %s', ch, subjek{sub}));
    %Plot IMF dan FFT
    temp = SubjekData(ch).IMF_Netral;
    s = size(temp, 1);
    for row = 1:s
      subplot(s, 1, row); plot(tPlot, temp(row,:));
    end
    saveas(h, sprintf('Pictures/IMF/IMF Netral Ch %d %s', ch, subjek{sub}));
  end
end
