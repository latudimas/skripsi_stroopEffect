close all;
clear;

% FEMALE
% load('matdata/GrandAverage_Female.mat');
%  MALE
load('matdata/GrandAverage_Male.mat');

tPlot = -200:1000/200:799;
cPlot = ['b', 'g', 'r', 'm', 'k'];

for ch=1:4
  %% Kongruen Plot
  figure;
  for row = 1:size(GrandAverage(ch).meanK_ERP, 1)
    plot(tPlot, GrandAverage(ch).meanK_ERP(row,:), 'Color', cPlot(row));
    % title(sprintf('Average Female Subject Kongruen Channel %d', ch));
    title(sprintf('Average Male Subject Kongruen Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo')
    hold on;
  end
  hold off;
  legend ('Ahmad', 'Jaler', 'Mudin', 'Ricahyo');
  % legend ('Ipon', 'Nia');

  %% Inkongruen Plot
  figure;
  for row = 1:size(GrandAverage(ch).meanI_ERP, 1)
    plot(tPlot, GrandAverage(ch).meanI_ERP(row,:), 'Color', cPlot(row));
    % title(sprintf('Average Female Subject Inkongruen Channel %d', ch));
    title(sprintf('Average Male Subject Inkongruen Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo')
    hold on;
  end
  hold off;
  legend ('Ahmad', 'Jaler', 'Mudin', 'Ricahyo');
  % legend ('Ipon', 'Nia');

  %% Netral Plot
  figure;
  for row = 1:size(GrandAverage(ch).meanN_ERP, 1)
    plot(tPlot, GrandAverage(ch).meanN_ERP(row,:), 'Color', cPlot(row));
    % title(sprintf('Average Female Subject Netral Channel %d', ch));
    title(sprintf('Average Male Subject Netral Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo')
    hold on;
  end
  hold off;
  legend ('Ahmad', 'Jaler', 'Mudin', 'Ricahyo');
  % legend ('Ipon', 'Nia');

  %% Grand Average Tiap Kondisi
  meanK = mean(GrandAverage(ch).meanK_ERP);
  meanI = mean(GrandAverage(ch).meanI_ERP);
  meanN = mean(GrandAverage(ch).meanN_ERP);
  figure;
  plot(tPlot, meanK, tPlot, meanI, tPlot, meanN);
  title(sprintf('Grand Average Female Subject All Condition Channel %d', ch));
  xlabel('Waktu(ms)'); ylabel('Amplitudo')
  legend('Kongruen', 'Inkongruen', 'Netral')

end
