%% Plotting Grand Average dari tiap Subjek
% Output contoh dapat dilihat di Folder ../Pictures/Average New
close all;
clear;

% FEMALE
load('matdata/GrandAverage_Female.mat');
%  MALE
% load('matdata/GrandAverage_Male.mat');

tPlot = -200:1000/200:799;
cPlot = ['b', 'g', 'r', 'm', 'k'];
n = 0.1;

for ch=1:4
%   %% Kongruen Plot
%   figure;
%   for row = 1:size(GrandAverage(ch).meanK_ERP, 1)
%     plot(tPlot, GrandAverage(ch).meanK_ERP(row,:), 'Color', cPlot(row));
%     title(sprintf('Average Female Subject Kongruen Channel %d', ch));
% %     title(sprintf('Average Male Subject Kongruen Channel %d', ch));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo')
%     hold on;
%   end
%   hold off;
% %   legend ('Ahmad', 'Jaler', 'Mudin', 'Ricahyo');
%   legend ('Nia', 'Ipon', 'Peni');

%   %% Inkongruen Plot
%   figure;
%   for row = 1:size(GrandAverage(ch).meanI_ERP, 1)
%     plot(tPlot, GrandAverage(ch).meanI_ERP(row,:), 'Color', cPlot(row));
%     title(sprintf('Average Female Subject Inkongruen Channel %d', ch));
% %     title(sprintf('Average Male Subject Inkongruen Channel %d', ch));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo')
%     hold on;
%   end
%   hold off;
% %   legend ('Ahmad', 'Jaler', 'Mudin', 'Ricahyo');
%   legend ('Nia', 'Ipon', 'Peni');

%   %% Netral Plot
%   figure;
%   for row = 1:size(GrandAverage(ch).meanN_ERP, 1)
%     plot(tPlot, GrandAverage(ch).meanN_ERP(row,:), 'Color', cPlot(row));
%     title(sprintf('Average Female Subject Netral Channel %d', ch));
% %     title(sprintf('Average Male Subject Netral Channel %d', ch));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo')
%     hold on;
%   end
%   hold off;
% %   legend ('Ahmad', 'Jaler', 'Mudin', 'Ricahyo');
%   legend ('Nia', 'Ipon', 'Peni');

  %% Grand Average Tiap Kondisi
  GrandAvgK = mean(GrandAverage(ch).meanK_ERP);
  GrandAvgI = mean(GrandAverage(ch).meanI_ERP);
  GrandAvgN = mean(GrandAverage(ch).meanN_ERP);
  
  figure;
  plot(tPlot, GrandAvgK, tPlot, GrandAvgI, tPlot, GrandAvgN); % Non Smoothing Data
  title(sprintf('Grand Average Non-Smooth Female Subject All Condition Channel %d', ch));
  xlabel('Waktu(ms)'); ylabel('Amplitudo');
  legend('Kongruen', 'Inkongruen', 'Netral');
  
  figure;
  plot(tPlot, smooth(GrandAvgK, n, 'moving'), tPlot, smooth(GrandAvgI, n, 'moving'), tPlot, smooth(GrandAvgN, n, 'moving'));
  title(sprintf('Grand Average Smooth Female Subject All Condition Channel %d', ch));
  xlabel('Waktu(ms)'); ylabel('Amplitudo');
  legend('Kongruen', 'Inkongruen', 'Netral');

  % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % GrandAverage(ch).GrandAvg_Kongruen = GrandAvgK;
  % GrandAverage(ch).GrandAvg_Inkongruen = GrandAvgI;
  % GrandAverage(ch).GrandAvg_Netral = GrandAvgN;
  % save('matdata/GrandAverage_Female.mat', 'GrandAverage');
end
