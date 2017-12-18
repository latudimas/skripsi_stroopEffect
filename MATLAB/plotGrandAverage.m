%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%										%
%        Cetak Grafik Averagin          %
%										%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear;

fileName =  sprintf('matdata/GrandAverage_M.mat');
load (fileName);

kondisi =  struct('K', [], 'I', [], 'N', []);

tPlotStart = -200;
tPlotStop = 800;
tPlot = tPlotStart:1000/200:tPlotStop-1; % sumbu X untuk grafik

for i = 1:4
	tempK = mean(GrandAverage_M(i).KONGRUEN);
	figure;
	plot(tPlot, tempK);
	title(sprintf('Grand Average Kondisi Kongruen CH%d', i));
	xlabel('Waktu (ms)'); ylabel('Amplitudo');
end

for i = 1:4
	tempI = mean(GrandAverage_M(i).INKONGRUEN);
	figure;
	plot(tPlot, tempI);
	title(sprintf('Grand Average Kondisi Inkongruen CH%d', i));
	xlabel('Waktu (ms)'); ylabel('Amplitudo');
end

for i = 1:4
	tempN = mean(GrandAverage_M(i).NETRAL);
	figure;
	plot(tPlot, temp);
	title(sprintf('Grand Average Kondisi Netral CH%d', i));
	xlabel('Waktu (ms)'); ylabel('Amplitudo');
end

