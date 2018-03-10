%% LET COOK THEM TOGETHER HAHAHAH!!!!!
% Fungsi dari program ini adalah untuk membuat struct yang isinya data rerata tiap kondisi dari dua kelas (Male and Female)
% Tujuannya adalah untuk mempermudah plotting data side-by-side antar kelas
clear; close all;

% CREATE STRUCT

fileName = 'matdata/FusionData.mat';
FusionData = struct('Kongruen_ERP', [], 'Inkongruen_ERP', [], 'Netral_ERP', [], 'Kongruen_EMD', [], 'Inkongruen_EMD', [], 'Netral_EMD', []);

%---------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%% Male First %%%%%%%%%%%%%%%%%%%%%%%%%%
load('matdata/GrandAverage_Male.mat');
urut = 1;

for ch = 1:4
    % KONGRUEN
    FusionData(ch).Kongruen_ERP(urut,:) =  GrandAverage(ch).avgTotalK_ERP;
    FusionData(ch).Kongruen_EMD(urut,:) =  GrandAverage(ch).avgTotalK_EMD;

    % INKONGRUEN
    FusionData(ch).Inkongruen_ERP(urut,:) =  GrandAverage(ch).avgTotalI_ERP;
    FusionData(ch).Inkongruen_EMD(urut,:) =  GrandAverage(ch).avgTotalI_EMD;

    % KONGRUEN
    FusionData(ch).Netral_ERP(urut,:) =  GrandAverage(ch).avgTotalN_ERP;        
    FusionData(ch).Netral_EMD(urut,:) =  GrandAverage(ch).avgTotalN_EMD;
end

%%%%%%%%%%%%%%%%%%%%%% Female Data %%%%%%%%%%%%%%%%%%%%%
load('matdata/GrandAverage_Female.mat');
urut =2;

for ch = 1:4
    % KONGRUEN
    FusionData(ch).Kongruen_ERP(urut,:) =  GrandAverage(ch).avgTotalK_ERP;
    FusionData(ch).Kongruen_EMD(urut,:) =  GrandAverage(ch).avgTotalK_EMD;

    % INKONGRUEN
    FusionData(ch).Inkongruen_ERP(urut,:) =  GrandAverage(ch).avgTotalI_ERP;
    FusionData(ch).Inkongruen_EMD(urut,:) =  GrandAverage(ch).avgTotalI_EMD;

    % KONGRUEN
    FusionData(ch).Netral_ERP(urut,:) =  GrandAverage(ch).avgTotalN_ERP;        
    FusionData(ch).Netral_EMD(urut,:) =  GrandAverage(ch).avgTotalN_EMD;
end


save('matdata/FusionData.mat', 'FusionData');
%---------------------------------------------------------------------


% %% Plot Data
% load('matdata/FusionData.mat');
% tPlot = -200:1000/200:799;
% for ch = 1:4 
%     % KONGRUEN
%     temp = FusionData(ch).K;
%     % temp = smooth(temp, 0.1, 'moving');
%     figure;
%     % plot(tPlot, temp(1,:), tPlot, temp(2,:));
%     plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
%     title(sprintf('Grand Average Subjek Male vs Female KONGRUEN Channel %d', ch));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo (�V)');
%     legend('Male', 'Female');

%     % INKONGRUEN
%     temp = FusionData(ch).I;
%     % temp = smooth(temp, 0.1, 'moving');
%     figure;
%     % plot(tPlot, temp(1,:), tPlot, temp(2,:));
%     plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
%     title(sprintf('Grand Average Subjek Male vs Female INKONGRUEN Channel %d', ch));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo (�V)');
%     legend('Male', 'Female');

%     % NETRAL
%     temp = FusionData(ch).N;
%     % temp = smooth(temp, 0.1, 'moving');
%     figure;
%     % plot(tPlot, temp(1,:), tPlot, temp(2,:));
%     plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
%     title(sprintf('Grand Average Subjek Male vs Female NETRAL Channel %d', ch));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo (�V)');
%     legend('Male', 'Female');
% end