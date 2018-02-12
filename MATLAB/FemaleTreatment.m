%% Untuk Salin Data Normal, menjadi 3 Subjek
fileName = 'matdata/SubjekData_Ipon.mat'
load(fileName);

for ch = 1:4
    %KONGRUEN
    temp = SubjekData(ch).Kongruen(6:10,:);
    SubjekData(ch).NewKongruen = temp;
    meanTemp = mean(temp); % Rata"
    SubjekData(ch).NewMeanK_ERP = meanTemp;

    %INKONGRUEN
    temp = SubjekData(ch).Inkongruen(6:10,:);
    SubjekData(ch).NewInkongruen = temp;
    meanTemp = mean(temp); % Rata"
    SubjekData(ch).NewMeanI_ERP = meanTemp;

    %NETRAL
    temp = SubjekData(ch).Netral(6:10,:);
    SubjekData(ch).NewNetral = temp;
    meanTemp = mean(temp); % Rata"
    SubjekData(ch).NewMeanN_ERP = meanTemp;

end

save(fileName, 'SubjekData');

%% CETAK DATA 
% for i = 1:4
% figure;
% tt = -200:1000/200:799;
% plot(tt, SubjekData(i).NewMeanK_ERP, tt, SubjekData(i).NewMeanI_ERP, tt, SubjekData(i).NewMeanN_ERP);
% legend('Kongruen', 'Inkongruen', 'Netral');
% end
% 