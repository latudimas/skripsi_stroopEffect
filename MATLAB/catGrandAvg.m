% moving data from "SubjekData" Struct to "NewGrandAverageFemale" Data

% Lokasi Data Target
fileTarget = 'matdata/NewGrandAverageFemale.mat';
load(fileTarget);

% Lokasi Data Asal
fileOrigin = 'matdata/SubjekData_Peni.mat';
load(fileOrigin);

for ch = 1:4
    disp(ch);
    % KONGRUEN
    temp =  SubjekData(ch).meanK_ERP;
    NewGrandAverage(ch).meanK_Subjek =cat(1, NewGrandAverage(ch).meanK_Subjek, temp); 

    % INKONGRUEN
    temp =  SubjekData(ch).meanI_ERP;
    NewGrandAverage(ch).meanI_Subjek =cat(1, NewGrandAverage(ch).meanI_Subjek, temp); 

    % NETRAL
    temp =  SubjekData(ch).meanN_ERP;
    NewGrandAverage(ch).meanN_Subjek =cat(1, NewGrandAverage(ch).meanN_Subjek, temp); 
end
