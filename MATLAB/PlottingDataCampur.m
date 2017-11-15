%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          PROGRAM PLOTING DATA         %
%          Riswandha Latu Dimas         %
%                                       %
%          Data: DataCampur.txt         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear;
fs = 200;

% load data
load DataCampur.txt;
M = DataCampur;

% bagi data jadi dua bagian
A = M(1:4,:);
B = M(5:8,:);

% plot data dalam 1 figure
tStart = 0;
tStop = 4;
tPlot = (0:((tStop-tStart)*fs)-1)/fs;

for i = 1:4
    figure(i);
    plot(tPlot,A(i,:),'b',tPlot,B(i,:),'g');
    print(sprintf('Compare Stimulus1 CH%d', i), '-dpng');
    legend('S1(Ahmad)','S2(Jaler)');
end
