%% LET COOK THEM TOGETHER HAHAHAH!!!!!

%---------------------------------------------------------------------
% % Male First (Gender Equality)
% load('matdata/GrandAverage_Male.mat');
% urut = 1;
% FusionData = struct('K', [], 'I', [], 'N', []);

% for ch = 1:4
%     % KONGRUEN
%     FusionData(ch).K(urut,:) =  mean(GrandAverage(ch).meanK_ERP);
    
%     % INKONGRUEN
%     FusionData(ch).I(urut,:) =  mean(GrandAverage(ch).meanI_ERP);

%     % KONGRUEN
%     FusionData(ch).N(urut,:) =  mean(GrandAverage(ch).meanN_ERP);        
% end

% % Female Data
% load('matdata/NewGrandAverageFemale.mat');
% urut =2;

% for ch = 1:4
%     % KONGRUEN
%     FusionData(ch).K(urut,:) =  NewGrandAverage(ch).GrandAvgK;
    
%     % INKONGRUEN
%     FusionData(ch).I(urut,:) =  NewGrandAverage(ch).GrandAvgI;

%     % KONGRUEN
%     FusionData(ch).N(urut,:) =  NewGrandAverage(ch).GrandAvgN;        
% end

% save('matdata/FusionData.mat', 'FusionData');
%---------------------------------------------------------------------


%% Plot Data

for ch = 1:4 
    % KONGRUEN
    temp = FusionData(ch).K;
    temp = smooth(temp, 0.1, 'moving');
    figure;
    plot(tPlot, temp(1,:), tPlot, temp(2,:));
    title(sprintf('Grand Average Subjek Male vs Female Kongruen Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (µV)');
    legend('Male', 'Female');

    % INKONGRUEN
    temp = FusionData(ch).I;
    temp = smooth(temp, 0.1, 'moving');
    figure;
    plot(tPlot, temp(1,:), tPlot, temp(2,:));
    title(sprintf('Grand Average Subjek Male vs Female Inkongruen Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (µV)');
    legend('Male', 'Female');

    % NETRAL
    temp = FusionData(ch).N;
    temp = smooth(temp, 0.1, 'moving');
    figure;
    plot(tPlot, temp(1,:), tPlot, temp(2,:));
    title(sprintf('Grand Average Subjek Male vs Female Netral Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (µV)');
    legend('Male', 'Female');
end