%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%										%
%             PRE-PROCESSING            %
%										%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear;

fs = 200;

% Range Potong Data Besar
tRangeStart = 0;
tRangeStop = 60;
rangeTime = (tRangeStart*fs)+1 : (tRangeStop*fs); %Potong dari 0-60

%% Load Data
sName = 'Mudin';
dName = sprintf('Data/RAW_%s_03.txt', sName);
rawData = load (sprintf('%s', dName));
rawData = rawData((6562-6):end, 2:5)'; %potong data dari awal program stroop mulai sampai akhir data

%% RAW Data 
for i = 1:4
	rawDataCell{i} = rawData(i, (rangeTime));
end

%% Filter
[bB, aB] = butter(2, [1 10]/(fs/2)); %BPF 1-10Hz
[bN, aN] = butter(2, [49 51]/(fs/2), 'stop'); %Notch Filter 49-51

bC = conv(bB, bN);
aC = conv(aB, aN);

% Proses Filtering
for i = 1:4
	filterData{i} = filter(bC, aC, rawDataCell{i});
%     figure;
%     plot(filterData{i}); title(sprintf('Channel%d #3', i)); 
end

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

%% Plotting Epoch 
tPlotStart = -200;
tPlotStop = 800;
tPlot = tPlotStart:1000/200:tPlotStop-1; % sumbu X untuk grafik
cPlot = ['b', 'g', 'r', 'm', 'k']; % colour palette untuk grafik

%plot(tPlot, epochCell{1,1}{1,1}); %Plot grafik awal
%plot(0, min(epochCell{1,1}{1,1}):max(epochCell{1,1}{1,1})); %Plot grafik tegak lurus
%plot(tPlot, epochCell{1,1}{1,1}, 0, min(epochCell{1,1}{1,1}):max(epochCell{1,1}{1,1}));

% % Plotting 5 stimulus Ch1
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

% % INKONGRUEN
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

%% Averaging Epoch

% % Hitung Rerata
% temp = kongruen{1,1};
% meanK = mean(temp);
% figure;
% meanPlot = plot(tPlot, meanK); 
% title('Grafik Rerata Kondisi Kongruen Ch1'); xlabel('Waktu (ms)'); ylabel('Amplitudo');
% 
% temp = inkongruen{1,1};
% meanK = mean(temp);
% figure;
% meanPlot = plot(tPlot, meanK); 
% title('Grafik Rerata Kondisi Inkongruen Ch1'); xlabel('Waktu (ms)'); ylabel('Amplitudo');
% 
% temp = netral{1,1};
% meanK = mean(temp);
% figure;
% meanPlot = plot(tPlot, meanK); 
% title('Grafik Rerata Kondisi Netral Ch1'); xlabel('Waktu (ms)'); ylabel('Amplitudo');

%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$%

%% STRUCT Simpan Mean Data
% % Mean Inkongruen
% for i=1:4 % looping channel
% 	temp = mean(inkongruen{1,i});
% 	inkongruen{1,i} = temp;
% end
% fileName = 'IMATFILE.mat';
% save(fileName, 'inkongruen', '-append');
% 
% % Mean Netral
% for i=1:4 % looping channel
% 	temp = mean(netral{1,i});
% 	netral{1,i} = temp;
% end
% fileName = 'NMATFILE.mat';
% save(fileName, 'netral', '-append');

% sKondisi = struct('KONGRUEN', [], 'INKONGRUEN', [], 'NETRAL', []);
% fileName = 'avgStruct.mat';
% load('avgStruct.mat');

% % KONGRUEN Fields
% for i = 1:4
% 	temp = mean(kongruen{1,i});
%     sKondisi(i).KONGRUEN = [];
% 	if isempty(sKondisi(i).KONGRUEN) % Check jika kosong
% 		sKondisi(i).KONGRUEN = cat(1, temp); % isi data di baris pertama
% 	else
% 		sKondisi(i).KONGRUEN = cat(1, sKondisi.KONGRUEN, temp); % append data
% 	end
% end

% % INKONGRUEN Fields
% for i = 1:4
% 	temp = mean(inkongruen{1,i});
%     sKondisi(i).INKONGRUEN = [];
% 	if isempty(sKondisi(i).INKONGRUEN) % Check jika kosong
% 		sKondisi(i).INKONGRUEN = cat(1, temp); % isi data di baris pertama
% 	else
% 		sKondisi(i).INKONGRUEN = cat(1, sKondisi.KONGRUEN, temp); % append data
% 	end
% end
% 
% % NETRAL Fields
% for i = 1:4
% 	temp = mean(netral{1,i});
%     sKondisi(i).NETRAL = [];
% 	if isempty(sKondisi(i).NETRAL) % Check jika kosong
% 		sKondisi(i).NETRAL = cat(1, temp); % isi data di baris pertama
% 	else
% 		sKondisi(i).NETRAL = cat(1, sKondisi.NETRAL, temp); % append data
% 	end
% end

% simpan ke matfile
% save(fileName, 'sKondisi');

% for i = 1:4
% 	temp = mean(kongruen{1,i});
% 	if exist('sKondisi') == 1
% 	    sKondisi(i).KONGRUEN = [];
% 		if isempty(sKondisi(i).KONGRUEN) % Check jika kosong
% 			sKondisi(i).KONGRUEN = cat(1, temp); % isi data di baris pertama
% 		else
% 			sKondisi(i).KONGRUEN = cat(1, sKondisi.KONGRUEN, temp); % append data
% 		end
% 	end
% end

fileName = 'avgStruct.mat';

if exist(fileName) == 2
	load(fileName);
else
	sKondisi = struct('KONGRUEN', [], 'INKONGRUEN', [], 'NETRAL', []);
	% buat struct tiap channel
	sKondisi(1).KONGRUEN = [];
	sKondisi(2).KONGRUEN = [];
	sKondisi(3).KONGRUEN = [];
	sKondisi(4).KONGRUEN = [];

	% save data di .mat baru
	save(fileName, 'sKondisi');
	load(fileName);
end

for i = 1:4
	temp = mean(kongruen{1,i}); % hitung rerata dan simpan di temp

	if isempty(sKondisi(i).KONGRUEN)
		sKondisi(i).KONGRUEN = cat(1, temp); 
	else
		sKondisi(i).KONGRUEN = cat (1, sKondisi(i).KONGRUEN, temp);
	end
end

save(fileName, 'sKondisi');