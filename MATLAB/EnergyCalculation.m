%% CALCULATE SIGNAL ENERGY FROM EVERY SUBJECT ALL CHANNEL
close all; clear all;
N = 200; % Banyak data atau lebar data, lihat notebook lengkapnya

%% MALE SUBJECT
disp('Process Male Subject Now')
subjekMale = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'};

for sub = 1:length(subjekMale)
    % LOAD DATA
    fileName = sprintf('matdata/SubjekData_%s.mat', subjekMale{sub})
    load(fileName);

    % CHANNEL ITERATION
    for ch = 1:4
        % KONGRUEN
        temp = SubjekData(ch).meanK_ERP;
        rmsK = rms(temp); % calc RMS signal
        energyK = rmsK*N; % hitung energy
        SubjekData(ch).energyK = energyK; % tambah data ke struct 

        % INKONGRUEN
        temp = SubjekData(ch).meanI_ERP;
        rmsI = rms(temp); % calc RMS signal
        energyI = rmsI*N; % hitung energy
        SubjekData(ch).energyI = energyI; % tambah data ke struct

        % NETRAL
        temp = SubjekData(ch).meanN_ERP;
        rmsN = rms(temp); % calc RMS signal
        energyN = rmsN*N; % hitung energy
        SubjekData(ch).energyN = energyN; % tambah data ke struct
    end
    save(fileName, 'SubjekData');
end

%% FEMALE SUBJECT
disp('Process Female Subject Now')
subjekFemale ={'Nia', 'Ipon'};

for sub = 1:length(subjekFemale)
    % LOAD DATA
    fileName = sprintf('matdata/SubjekData_%s.mat', subjekFemale{sub})
    load(fileName);

    % CHANNEL ITERATION
    for ch = 1:4
        % KONGRUEN
        temp = SubjekData(ch).meanK_ERP;
        rmsK = rms(temp); % calc RMS signal
        energyK = rmsK*N; % hitung energy
        SubjekData(ch).energyK = energyK; % tambah data ke struct 

        % INKONGRUEN
        temp = SubjekData(ch).meanI_ERP;
        rmsI = rms(temp); % calc RMS signal
        energyI = rmsI*N; % hitung energy
        SubjekData(ch).energyI = energyI; % tambah data ke struct

        % NETRAL
        temp = SubjekData(ch).meanN_ERP;
        rmsN = rms(temp); % calc RMS signal
        energyN = rmsN*N; % hitung energy
        SubjekData(ch).energyN = energyN; % tambah data ke struct
    end
    save(fileName, 'SubjekData');
end