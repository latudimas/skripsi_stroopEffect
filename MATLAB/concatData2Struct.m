% moving data from "SubjekData" Struct to "GrandAverage_M/F" Struct

% Lokasi Data Target
fileTarget = 'matdata/GrandAverage_Female.mat';
if exist(fileTarget) == 2
    disp(sprintf('File Exist: %s ', fileTarget));
%     load(fileTarget);
    disp('Open file Target : GrandAverage_Female.mat');
else
    GrandAverage = struct('meanK_ERP', [], 'meanI_ERP', [], 'meanN_ERP', [], 'meanK_EMD', [], 'meanI_EMD', [], 'meanN_EMD', []);
    
    % Space Up
    GrandAverage(1).meanK_ERP=[];
    GrandAverage(2).meanK_ERP=[];
    GrandAverage(3).meanK_ERP=[];
    GrandAverage(4).meanK_ERP=[];

    % Save struct sebagai matfile
    save(fileTarget, 'GrandAverage');
    disp('Struct Created');
end

% subName = {'Nia', 'Ipon'}; % #1
% subName = {'Sania', 'Nia2'}; % #2
subName = {'Nia', 'Peni', 'Sania', 'Nia2'}; % FEMALE
% subName = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'}; %MALE


for sub = 1: length(subName);
    % Buka struct data subjek
    fileOrigin = sprintf('matdata/SubjekData_%s.mat', subName{sub});
    disp(sprintf('Open %s Struct', subName{sub}));
    load(fileOrigin);    

    %Proses penyalinan data tiap kondisi dan tiap channel
    for ch = 1:4
        disp(sprintf('Channel : %d', ch ));
        % KONGRUEN
        temp1 = SubjekData(ch).meanK_ERP; % Sinyal Filter Low
        temp2 = SubjekData(ch).meanK_EMD; % Sinyal filter High
        % temp = SubjekData(ch).NewMeanK_ERP; % Nia dan Ipon only
        GrandAverage(ch).meanK_ERP =cat(1, GrandAverage(ch).meanK_ERP, temp1); 
        GrandAverage(ch).meanK_EMD =cat(1, GrandAverage(ch).meanK_EMD, temp2);
        GrandAverage(ch).avgTotalK_ERP = mean(GrandAverage(ch).meanK_ERP); % Rerata total ERP
        GrandAverage(ch).avgTotalK_EMD = mean(GrandAverage(ch).meanK_EMD); % Rerata total EMD

        % INKONGRUEN
        temp1 = SubjekData(ch).meanI_ERP; % Sinyal filter Low
        temp2 = SubjekData(ch).meanI_EMD; % Sinyal filter High
        % temp =  SubjekData(ch).NewMeanI_ERP; % Nia dan Ipon only
        GrandAverage(ch).meanI_ERP =cat(1, GrandAverage(ch).meanI_ERP, temp1); 
        GrandAverage(ch).meanI_EMD =cat(1, GrandAverage(ch).meanI_EMD, temp2);
        GrandAverage(ch).avgTotalI_ERP = mean(GrandAverage(ch).meanI_ERP);
        GrandAverage(ch).avgTotalI_EMD = mean(GrandAverage(ch).meanI_EMD); 

        % NETRAL
        temp1 = SubjekData(ch).meanN_ERP; % Sinyal filter Low
        temp2 = SubjekData(ch).meanN_EMD; % Sinyal filter High
        % temp =  SubjekData(ch).NewMeanN_ERP; % Nia dan Ipon only
        GrandAverage(ch).meanN_ERP =cat(1, GrandAverage(ch).meanN_ERP, temp1); 
        GrandAverage(ch).meanN_EMD =cat(1, GrandAverage(ch).meanN_EMD, temp2);
        GrandAverage(ch).avgTotalN_ERP = mean(GrandAverage(ch).meanN_ERP);
        GrandAverage(ch).avgTotalN_EMD = mean(GrandAverage(ch).meanN_EMD); 
    end

    % GRAND AVERAGE UNTUK TIAP KONDISI

end

save(fileTarget, 'GrandAverage');