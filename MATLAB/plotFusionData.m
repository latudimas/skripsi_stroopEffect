%% Plot Data FusionData
% Data yang di plot Male vs Female
close all; clear;

load('matdata/FusionData.mat');
tPlot = -200:1000/200:799;
for ch = 1:4 
    % KONGRUEN
    temp = FusionData(ch).Kongruen_ERP;
    % temp = smooth(temp, 0.1, 'moving');
    fig = figure;
    plot(tPlot, temp(1,:), tPlot, temp(2,:));
    % plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    title(sprintf('Rerata Total Subjek Laki-Laki vs Perempuan KONGRUEN Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (\muV)');
    legend('L', 'P');
    saveas(fig, sprintf('Pictures/FusionData/Fusion Data Kongruen %d.png', ch));

    % INKONGRUEN
    temp = FusionData(ch).Inkongruen_ERP;
    % temp = smooth(temp, 0.1, 'moving');
    fig = figure;
    plot(tPlot, temp(1,:), tPlot, temp(2,:));
    % plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    title(sprintf('Rerata Total Subjek Laki-Laki vs Perempuan INKONGRUEN Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (\muV)');
    legend('L', 'P');
    saveas(fig, sprintf('Pictures/FusionData/Fusion Data Inkongruen %d.png', ch));

    % NETRAL
    temp = FusionData(ch).Netral_ERP;
    % temp = smooth(temp, 0.1, 'moving');
    fig = figure;
    plot(tPlot, temp(1,:), tPlot, temp(2,:));
    % plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    title(sprintf('Rerata Total Subjek Laki-Laki vs Perempuan NETRAL Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (\muV)');
    legend('L', 'P');
    saveas(fig, sprintf('Pictures/FusionData/Fusion Data Netral %d.png', ch));
end