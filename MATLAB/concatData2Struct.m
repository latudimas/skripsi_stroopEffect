% moving data from "SubjekData" Struct to "GrandAverage_M/F" Struct

% Lokasi Data Target
fileTarget = 'matdata/GrandAverage_Female.mat';
if exist(fileTarget) == 2
    disp(sprintf('File Exist: %s ', fileTarget));
    load(fileTarget);
    disp('Open file Target : GrandAverage_Female.mat');
else
    GrandAverage = struct('meanK_ERP', [], 'meanI_ERP', [], 'meanN_ERP', []);
    
    % Space Up
    GrandAverage(1).meanK_ERP=[];
    GrandAverage(2).meanK_ERP=[];
    GrandAverage(3).meanK_ERP=[];
    GrandAverage(4).meanK_ERP=[];

    % Save struct sebagai matfile
    save(fileTarget, 'GrandAverage');
    disp('Struct Created');
end

% Nama Subjek FEMALE
% subName = {'Nia', 'Ipon'}; % #1
subName = {'Sania', 'Nia2'}; % #2

for sub = 1: length(subName);
    % Buka struct data subjek
    fileOrigin = sprintf('matdata/SubjekData_%s.mat', subName{sub});
    disp(sprintf('Open %s Struct', subName{sub}));
    load(fileOrigin);    

    %Proses penyalinan data tiap kondisi dan tiap channel
    for ch = 1:4
        disp(sprintf('Channel : %d', ch ));
        % KONGRUEN
        temp = SubjekData(ch).meanK_ERP; % Peni, Sania, Nia2
        % temp = SubjekData(ch).NewMeanK_ERP; % Nia dan Ipon only
        GrandAverage(ch).meanK_ERP =cat(1, GrandAverage(ch).meanK_ERP, temp); 

        % INKONGRUEN
        temp = SubjekData(ch).meanI_ERP; % Peni, Sania, Nia2
        % temp =  SubjekData(ch).NewMeanI_ERP; % Nia dan Ipon only
        GrandAverage(ch).meanI_ERP =cat(1, GrandAverage(ch).meanI_ERP, temp); 

        % NETRAL
        temp = SubjekData(ch).meanN_ERP; % Peni, Sania, Nia2
        % temp =  SubjekData(ch).NewMeanN_ERP; % Nia dan Ipon only
        GrandAverage(ch).meanN_ERP =cat(1, GrandAverage(ch).meanN_ERP, temp); 
    end
end

save(fileTarget, 'GrandAverage');