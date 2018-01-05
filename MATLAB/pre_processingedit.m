%=======================================%
%             PRE-PROCESSING            %
%=======================================%

%------------- Data Subjek--------------%
% Ahmad [6114, 4113, 4363]              %
% Jaler [21523, 4894, 5507]             %
% Mudin [14562, 7158, 6562]             %
% Ricahyo [8807, 5445, 4699]            %
%---------------------------------------%

close all;
clear;

fs = 200;

% Range Potong Data Besar
tRangeStart = 0;
tRangeStop = 60;
rangeTime = (tRangeStart*fs)+1 : (tRangeStop*fs); %Potong dari 0-60

%% Load Data
sName = 'Ricahyo'; %subjectName
trial = '03'; %trial Number in string
nTrial = str2num(trial); %convert string to number for marker
dName = sprintf('Data/RAW_%s_%s.txt', sName, trial);
rawData = load (sprintf('%s', dName));
rawData = rawData((4699-6):end, 2:5)'; % EDIT DISINI COEG <<<<<<<<<<<<<<<<<<<<<<<<<<
%% Struct Check ----------------------------------------------------------------
fileName = sprintf('matdata/TESTSubjekData_%s.mat', sName);
if exist(fileName) == 2
	sprintf('Exist %s',fileName) % cetak Nama file
%     load(fileName);
%     save(fileName, 'SubjekData');
else
	% buat struct dengan 5 field name
	SubjekData = struct('RAW', [], 'Filter', [], 'Kongruen', [], 'Inkongruen', [], 'Netral', [], 'meanK', [], 'meanI', [], 'meanN', []);

	% sediakan field untuk 4 Channel
	SubjekData(1).RAW = [];
	SubjekData(2).RAW = [];
	SubjekData(3).RAW = [];
	SubjekData(4).RAW = [];

	% Save sebagai struct baru
	save(fileName, 'SubjekData');
	sprintf('Created %s', fileName)
end
%-------------------------------------------------------------------------------

%% RAW Data
for i = 1:4
	rawDataCell{i} = rawData(i, (rangeTime));
end

% Simpan ke struct
rawStruct(rawDataCell, fileName, nTrial);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load(fileName);
% nTrial
% for i = 1:4
%   temp = rawDataCell{1,i};
%   SubjekData(i).RAW(nTrial, :) = temp;
% end
%
% save(fileName, 'SubjekData');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Filter
[bB, aB] = butter(2, [0.5 5]/(fs/2)); %BPF 1-10Hz
[bN, aN] = butter(2, [49 51]/(fs/2), 'stop'); %Notch Filter 49-51

bC = conv(bB, bN);
aC = conv(aB, aN);

% Proses Filtering
for i = 1:4
	filterData{i} = filter(bC, aC, rawDataCell{i});
end

% simpan ke struct
filterStruct(filterData, fileName, nTrial);

%% Epoch
% Range Epoch 1 detik (-200 ~ 800ms)
% INGAT!!!!, patokan perhitungan timing diagram berdasarkan rangeTime
% detik ke-1 rawData = detik ke-0 filterData
epochCell = epoch(filterData); %pembuatan epoch dari sinyal yang difilter

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
tPlotStart = -200;
tPlotStop = 800;
tPlot = tPlotStart:1000/200:tPlotStop-1; % sumbu X untuk grafik
cPlot = ['b', 'g', 'r', 'm', 'k']; % colour palette untuk grafik

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
