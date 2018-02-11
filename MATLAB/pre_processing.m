%=======================================%
%             PRE-PROCESSING            %
%=======================================%

%------------------------ Data Subjek------------------------%
% Ahmad [6114 (5464), 4113 (3463), 4363 (3713)]              %
% Jaler [21523 (20873), 4894 (4244), 5507 (4857)]            % ADD 650 data (3detik) buffer before start
% Mudin [14562 (13912), 7158 (6508), 6562 (5912)]            % 6114 ==> 5514
% Ricahyo [8807 (8157), 5445 (4795), 4699 (4049)]            %
% Ipon [9342 (8692), 4164 (3514), 10617 (9967)]              %
% Nia [7637 (6987), 4486 (3836), 3272 (2622)]                %
%------------------------------------------------------------%

close all;
clear;
fs = 200;

%% Load Data--------------------------------------------------------------------
sName = 'Ipon'; %subjectName
trial = '03'; %trial Number in string
t = 9967;
nTrial = str2num(trial); %convert string to number for marker
dName = sprintf('Data/RAW_%s_%s.txt', sName, trial);
rawData = load (sprintf('%s', dName));
rawData = rawData((t-6):(t-7+12650), 2:5)'; % 12650 = 12000  + 650 data buffer, data mulai dari 0, jadi akhirnya harus -1

%% Struct Check ----------------------------------------------------------------
fileName = sprintf('matdata/SubjekData_%s.mat', sName);
if exist(fileName) == 2
	sprintf('Exist %s',fileName) % cetak Nama file
else
	% buat struct dengan 5 field name
	SubjekData = struct('RAW', [], 'FilterHigh', [], 'FilterLow', [], 'Kongruen', [], 'Inkongruen', [], 'Netral', [], 'K_emd', [], 'I_emd', [], 'N_emd', []);

	% sediakan field untuk 4 Channel
	SubjekData(1).RAW = [];
	SubjekData(2).RAW = [];
	SubjekData(3).RAW = [];
	SubjekData(4).RAW = [];

	% Save sebagai struct baru
	save(fileName, 'SubjekData');
	sprintf('Created %s', fileName)
end

%% RAW Data---------------------------------------------------------------------
for i = 1:4
	rawDataCell{i} = rawData(i, :);
end

% Simpan ke struct
rawStruct(rawDataCell, fileName, nTrial); % lebar data yang disimpan 12650

%% Filter-----------------------------------------------------------------------
[bBLow, aBLow] = butter(2, [1 5]/(fs/2)); % BPF 0.5-5Hz
[bBHigh, aBHigh] = butter(2, [1 30]/(fs/2)); % BPF 0.5-30Hz
[bN, aN] = butter(2, [49 51]/(fs/2), 'stop'); %Notch Filter 49-51

% Convolusi High
bH = conv(bBHigh, bN);
aH = conv(aBHigh, aN);

% Proses Filtering HIGH
for i = 1:4
	filterDataHigh{i} = filter(bH, aH, rawDataCell{i});
	filterDataHigh{i} = filterDataHigh{i}(651:end); % Potong 651 karena untuk menghilangkan buffer anomali filter sebanyk 650 data
end

% Add to Struct Filter HIGH
filterStruct(filterDataHigh, 'H', fileName, nTrial);

% Convolusi Low
bL = conv(bBLow, bN);
aL = conv(aBLow, aN);

%Proses Filtering LOW
for i = 1:4
	filterDataLow{i} = filter(bL, aL, rawDataCell{i});
	filterDataLow{i} = filterDataLow{i}(651:end);
end

% Add to Struct Filter LOW
filterStruct(filterDataLow, 'L',fileName, nTrial);

%% Epoch------------------------------------------------------------------------
% Range Epoch 1 detik (-200 ~ 800ms)
% INGAT!!!!, patokan perhitungan timing diagram dimulai dari program start (detik 0)
epochCellEMD = epoch(filterDataHigh); % pembuatan epoch data EMD
[KHigh, IHigh, NHigh] = grouping(epochCellEMD); % pengelompokkan data untuk epoch HIGH
epochStruct(KHigh, IHigh, NHigh, fileName, 'H'); %simpan Epoch ke struct
epochCellERP = epoch(filterDataLow); %pembuatan epoch dari hasil filter rendah
[KLow, ILow, NLow] = grouping(epochCellERP);
epochStruct(KLow, ILow, NLow, fileName, 'L');