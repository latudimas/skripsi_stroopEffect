%% CALCULATE SIGNAL ENERGY FROM EVERY SUBJECT ALL CHANNEL
close all; clear all;
N = 160; % Banyak data atau lebar data, lihat notebook lengkapnya

%% SUBJECT
subjek = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo', 'Nia', 'Peni', 'Sania', 'Nia2'};

% Output File 
outputFile = 'matdata/Energy.mat';
Energy_ERP = struct('Energy_Kongruen', [], 'Energy_Inkongruen', [], 'Energy_Netral', []);

for sub = 1:length(subjek)
    % LOAD DATA
    fileName = sprintf('matdata/SubjekData_%s.mat', subjek{sub});
    load(fileName);
    disp(sprintf('Subjek : %s', subjek{sub}));

    % CHANNEL ITERATION
    for ch = 1:4
        % KONGRUEN
        temp = SubjekData(ch).meanK_ERP(41:end); % 41 karena data yag terpakai dari detik ke 0 (0-800ms)
        rmsK = rms(temp); % calc RMS signal
        energyK = rmsK*rmsK*N; % hitung energy
        Energy_ERP.Energy_Kongruen(sub, ch) = energyK; 
        % SubjekData(ch).energyK = energyK; % tambah data ke struct 

        % INKONGRUEN
        temp = SubjekData(ch).meanI_ERP(41:end);
        rmsI = rms(temp); % calc RMS signal
        energyI = rmsI*rmsI*N; % hitung energy
        Energy_ERP.Energy_Inkongruen(sub, ch) = energyI;
        % SubjekData(ch).energyI = energyI; % tambah data ke struct

        % NETRAL
        temp = SubjekData(ch).meanN_ERP(41:end);
        rmsN = rms(temp); % calc RMS signal
        energyN = rmsN*rmsN*N; % hitung energy
        Energy_ERP.Energy_Netral(sub, ch) = energyN;
        % SubjekData(ch).energyN = energyN; % tambah data ke struct
    end
end

save(outputFile, 'Energy_ERP');

