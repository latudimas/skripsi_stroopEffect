%% LET COOK THEM TOGETHER HAHAHAH!!!!!

%---------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%% Male First %%%%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%% Female Data %%%%%%%%%%%%%%%%%%%%%
% load('matdata/GrandAverage_Female.mat');
% urut =2;
% 
% for ch = 1:4
%     % KONGRUEN
%     FusionData(ch).K(urut,:) =  mean(GrandAverage(ch).meanK_ERP(2:end,:));
%     
%     % INKONGRUEN
%     FusionData(ch).I(urut,:) =  mean(GrandAverage(ch).meanI_ERP(2:end,:));
% 
%     % KONGRUEN
%     FusionData(ch).N(urut,:) =  mean(GrandAverage(ch).meanK_ERP(2:end,:));        
% end
% 
% save('matdata/FusionData.mat', 'FusionData');
%---------------------------------------------------------------------


%% Plot Data
load('matdata/FusionData.mat');
tPlot = -200:1000/200:799;
for ch = 1:4 
    % KONGRUEN
    temp = FusionData(ch).K;
    % temp = smooth(temp, 0.1, 'moving');
    figure;
    % plot(tPlot, temp(1,:), tPlot, temp(2,:));
    plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    title(sprintf('Grand Average Subjek Male vs Female KONGRUEN Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (�V)');
    legend('Male', 'Female');

    % INKONGRUEN
    temp = FusionData(ch).I;
    % temp = smooth(temp, 0.1, 'moving');
    figure;
    % plot(tPlot, temp(1,:), tPlot, temp(2,:));
    plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    title(sprintf('Grand Average Subjek Male vs Female INKONGRUEN Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (�V)');
    legend('Male', 'Female');

    % NETRAL
    temp = FusionData(ch).N;
    % temp = smooth(temp, 0.1, 'moving');
    figure;
    % plot(tPlot, temp(1,:), tPlot, temp(2,:));
    plot(tPlot, smooth(temp(1,:), 0.1, 'moving'), tPlot, smooth(temp(2,:), 0.1, 'moving')); %SMOOTHING DATA
    title(sprintf('Grand Average Subjek Male vs Female NETRAL Channel %d', ch));
    xlabel('Waktu(ms)'); ylabel('Amplitudo (�V)');
    legend('Male', 'Female');
end