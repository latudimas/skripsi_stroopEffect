%=======================================%
%             PRE-PROCESSING            %
%=======================================%

%------------------------ Data Subjek------------------------%
% Ahmad [6114 (5464), 4113 (3463), 4363 (3713)]              %
% Jaler [21523 (20873), 4894 (4244), 5507 (5307)]            % ADD 600 data (3detik) buffer before start
% Mudin [14562 (13912), 7158 (6508), 6562 (5912)]            % 6114 ==> 5514
% Ricahyo [8807 (8157), 5445 (4795), 4699 (4049)]            %
%------------------------------------------------------------%

close all;
clear;

fs = 200;

% Range Potong Data Besar
% tRangeStart = 0;
% tRangeStop = 60;
% rangeTime = (tRangeStart*fs)+1 : (tRangeStop*fs); %Potong dari 0-60
% rangeTime = 1:12200; % dari 3 detik sebelum start sampai detik ke-60 (2 detiks sebelum END)

%% Load Data--------------------------------------------------------------------
sName = 'Ricahyo'; %subjectName
trial = '03'; %trial Number in string
t = 4049;
nTrial = str2num(trial); %convert string to number for marker
dName = sprintf('Data/RAW_%s_%s.txt', sName, trial);
rawData = load (sprintf('%s', dName));
rawData = rawData((t-6):(t-7+12650), 2:5)'; % 12650 = 12000  + 650 data buffer, data mulai dari 0, jadi akhirnya harus -1

%% Struct Check ----------------------------------------------------------------
fileName = sprintf('matdata/SubjekData_%s.mat', sName);
if exist(fileName) == 2
	sprintf('Exist %s',fileName) % cetak Nama file
%     load(fileName);
%     save(fileName, 'SubjekData');
else
	% buat struct dengan 5 field name
	SubjekData = struct('RAW', [], 'FilterHigh', [], 'FilterLow', [], 'Kongruen', [], 'Inkongruen', [], 'Netral', []);

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
[bBLow, aBLow] = butter(2, [0.5 5]/(fs/2)); % BPF 0.5-5Hz
[bBHigh, aBHigh] = butter(2, [0.5 30]/(fs/2)); % BPF 0.5-30Hz
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
% INGAT!!!!, patokan perhitungan timing diagram berdasarkan rangeTime
% detik ke-1 rawData = detik ke-0 filterData
epochCell = epoch(filterDataLow); %pembuatan epoch dari sinyal yang difilter

%Pengelompokkan Epoch sesuai Kondisi dan channel
% "kongruen = 1", "inkongruen = 2", dan "netral = 3"
seq = [2 1 1 2 3 2 1 3 3 1 2 1 3 3 2]; %data sequence

for i = 1:4
    ck = 1; ci = 1; cn = 1; %Counter tiap kondisi;
    for j = 1:15
        switch seq(j)
            case 1
                %kongruen{1,i}{1,ck} = epochCell{1,i}{1,j};
                kongruen{1,i}(ck,:) = epochCell{1,i}{1,j}; % Shortest Way
            	ck=ck+1;
            case 2
            	%inkongruen{1,i}{1,ci} = epochCell{1,i}{1,j};
                inkongruen{1,i}(ci,:) = epochCell{1,i}{1,j};
            	ci=ci+1;
            case 3
            	%netral{1,i}{1,cn} = epochCell{1,i}{1,j};
                netral{1,i}(cn,:) = epochCell{1,i}{1,j};
            	cn=cn+1;
        end
    end
end

% simpan ke struct
epochStruct(kongruen, inkongruen, netral, fileName, nTrial);

%% Plotting Epoch
% tPlotStart = -200;
% tPlotStop = 800;
% tPlot = tPlotStart:1000/200:tPlotStop-1; % sumbu X untuk grafik
% cPlot = ['b', 'g', 'r', 'm', 'k']; % colour palette untuk grafik

%plot(tPlot, epochCell{1,1}{1,1}); %Plot grafik awal
%plot(0, min(epochCell{1,1}{1,1}):max(epochCell{1,1}{1,1})); %Plot grafik tegak lurus
%plot(tPlot, epochCell{1,1}{1,1}, 0, min(epochCell{1,1}{1,1}):max(epochCell{1,1}{1,1}));

% Plotting 5 stimulus Ch1
% % KONGRUEN
% figure;
% for i = 1:5
%     %p = plot(tPlot, kongruen{1,1}{1,i}, 'Color', cPlot(i));
% 	plot(tPlot, kongruen{1,1}(i,:), 'Color', cPlot(i));
% 	title('Plot Kondisi Kongruen CH1 Filter');
% 	xlabel('Waktu (ms)'); ylabel('Amplitudo');
%     hold on;
% end
% hold off;

% INKONGRUEN
% figure;
% for i = 1:5
%     %p = plot(tPlot, kongruen{1,1}{1,i}, 'Color', cPlot(i));
% 	plot(tPlot, inkongruen{1,1}(i,:), 'Color', cPlot(i));
% 	title('Grafik Kondisi Inkongruen CH1 Filter');
% 	xlabel('Waktu (ms)'); ylabel('Amplitudo');
%     hold on;
% end
% hold off;

% %NETRAL
% figure;
% for i = 1:5
%     %p = plot(tPlot, kongruen{1,1}{1,i}, 'Color', cPlot(i));
% 	plot(tPlot, netral{1,1}(i,:), 'Color', cPlot(i));
% 	title('Grafik Kondisi Netral CH1 Filter');
% 	xlabel('Waktu (ms)'); ylabel('Amplitudo');
%     hold on;
% end
% hold off;
