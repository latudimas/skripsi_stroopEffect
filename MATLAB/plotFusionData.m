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
    plot(tPlot, temp(1,:), tPlot, temp(2,:), 'LineWidth', 2);
    grid on;
    hline(0, 'r'); vline(0, 'r');
    % set(gca, 'FontSize', 12);
    % plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    % title(sprintf('Rerata Total Subjek Laki-Laki vs Perempuan KONGRUEN Channel %d', ch));
    xlabel('Waktu(ms)', 'FontSize', 12); ylabel('Amplitudo (\muV)', 'FontSize', 12);
    legend({'L', 'P'}, 'FontSize', 12);
    saveas(fig, sprintf('Pictures/FusionData/Fusion Data Kongruen GRID %d.png', ch));

    % INKONGRUEN
    temp = FusionData(ch).Inkongruen_ERP;
    % temp = smooth(temp, 0.1, 'moving');
    fig = figure;
    plot(tPlot, temp(1,:), tPlot, temp(2,:), 'LineWidth', 2);
    grid on;
    hline(0, 'r'); vline(0, 'r');
    % plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    % title(sprintf('Rerata Total Subjek Laki-Laki vs Perempuan INKONGRUEN Channel %d', ch));
    xlabel('Waktu(ms)', 'FontSize', 12); ylabel('Amplitudo (\muV)', 'FontSize', 12);
    legend({'L', 'P'}, 'FontSize', 12);
    saveas(fig, sprintf('Pictures/FusionData/Fusion Data Inkongruen GRID %d.png', ch));

    % NETRAL
    temp = FusionData(ch).Netral_ERP;
    % temp = smooth(temp, 0.1, 'moving');
    fig = figure;
    plot(tPlot, temp(1,:), tPlot, temp(2,:), 'LineWidth', 2);
    grid on;
    hline(0, 'r'); vline(0, 'r');
    % plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    % title(sprintf('Rerata Total Subjek Laki-Laki vs Perempuan NETRAL Channel %d', ch));
    xlabel('Waktu(ms)', 'FontSize', 12); ylabel('Amplitudo (\muV)', 'FontSize', 12);
    legend({'L', 'P'}, 'FontSize', 12);
    saveas(fig, sprintf('Pictures/FusionData/Fusion Data Netral GRID %d.png', ch));
end