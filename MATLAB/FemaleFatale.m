%% Buat ngerapikan data, data cewek masukin kesini
load('matdata/SubjekData_Ipon.mat');
numSubjek = 2;

tPlot = -200:1000/200:799;

% NEW STRUCT
NewGrandAverage = struct('meanK_Subjek', [], 'meanI_Subjek', [], 'meanN_Subjek', [], 'GrandAvgK', [], 'GrandAvgI', [], 'GrandAvgN', []);


for ch = 1:4
    % KONGRUEN
    NewGrandAverage(ch).meanK_Subjek(numSubjek,:) = SubjekData(ch).NewMeanK_ERP;
    NewGrandAverage(ch).GrandAvgK = mean(NewGrandAverage(ch).meanK_Subjek);

    % INKONGRUEN
    NewGrandAverage(ch).meanI_Subjek(numSubjek,:) = SubjekData(ch).NewMeanI_ERP;
    NewGrandAverage(ch).GrandAvgI = mean(NewGrandAverage(ch).meanI_Subjek);

    % NETRAL
    NewGrandAverage(ch).meanN_Subjek(numSubjek,:) = SubjekData(ch).NewMeanN_ERP;
    NewGrandAverage(ch).GrandAvgN = mean(NewGrandAverage(ch).meanN_Subjek);
end

save('matdata/NewGrandAverageFemale.mat', 'NewGrandAverage');