%% Untuk melihat respon stimulus tiap subjek tiap kondisi
% 15 stimulus -> per figure 5 stimulus * 3
clc; clear;

fileName = 'matdata/SubjekData_Nia2.mat';
load(fileName); 
disp(sprintf('Load data : %s', fileName));
tt = -200:1000/200:799;

for ch = 1:4;
    temp = SubjekData(ch).FilterLow;
    
end

% for ch = 1:4;
%     %% Data Kongruen
%     temp = SubjekData(ch).Kongruen;
%     figure;
%     plot(tt, temp(1:5,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 1 Kongruen Ch %d', ch));
%     legend('1', '2', '3', '4', '5');
%     
%     figure;
%     plot(tt, temp(6:10,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 2 Kongruen Ch %d', ch));
%     legend('6', '7', '8', '9', '10');
%     
%     figure;
%     plot(tt, temp(11:15,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 3 Kongruen Ch %d', ch));
%     legend('11', '12', '13', '14', '15');
%     
%     %% Data Inkongruen
%     temp = SubjekData(ch).Inkongruen;
%     figure;
%     plot(tt, temp(1:5,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 1 Inkongruen Ch %d', ch));
%     legend('1', '2', '3', '4', '5');
%     
%     figure;
%     plot(tt, temp(6:10,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 2 Inkongruen Ch %d', ch));
%     legend('6', '7', '8', '9', '10');
%     
%     figure;
%     plot(tt, temp(11:15,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 3 Inkongruen Ch %d', ch));
%     legend('11', '12', '13', '14', '15');
%     
%     %% Data Netral
%     temp = SubjekData(ch).Netral;
%     figure;
%     plot(tt, temp(1:5,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 1 Netral Ch %d', ch));
%     legend('1', '2', '3', '4', '5');
%     
%     figure;
%     plot(tt, temp(6:10,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 2 Netral Ch %d', ch));
%     legend('6', '7', '8', '9', '10');
%     
%     figure;
%     plot(tt, temp(11:15,:));
%     xlabel('Waktu(ms)'); ylabel('Amplitudo(µV)'); title(sprintf('Sesi 3 Netral Ch %d', ch));
%     legend('11', '12', '13', '14', '15');
% end