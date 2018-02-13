%% PLOT GRAND AVERAGE FEMALE
load('matdata/NewGrandAverageFemale.mat');
tPlot = -200:1000/200:799;

for ch = 1:4
    meanK = NewGrandAverage(ch).GrandAvgK;
    meanI = NewGrandAverage(ch).GrandAvgI;
    meanN = NewGrandAverage(ch).GrandAvgN;

    figure;
    plot(tPlot, meanK, tPlot, meanI, tPlot, meanN);
    title(sprintf('Grand Average Female Subject All Condition Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (µV)');
    legend('Kongruen', 'Inkongruen', 'Netral');
end