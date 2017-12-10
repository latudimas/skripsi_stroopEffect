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
load Data/OpenBCI-RAW-Jaler_25_10_01.txt;
rawData = OpenBCI_RAW_Jaler_25_10_01((21523-6):end, 2:5)'; %potong data dari awal program stroop mulai sampai akhir data

%% RAW Data 
for i = 1:4
	rawDataCell{i} = rawData(i, (rangeTime));
end

%% Filter
[bB aB] = butter(2, [1 10]/(fs/2)); %BPF 1-10Hz
[bN aN] = butter(2, [49 51]/(fs/2), 'stop'); %Notch Filter 49-51

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
cond = [2 1 1 2 3 2 1 3 3 1 2 1 3 3 2];

for i = 1:4
    ck = 1; ci = 1; cn = 1; %Counter tiap kondisi;
    for j = 1:15
        switch cond(j)
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

% inisialisasi Cell dengan ukuran sama dengan epoch (200 data)
% kongruen{5} = zeros(size(epochCell{1,1}{1,1}));
% inkongruen{5} = zeros(size(epochCell{1,1}{1,1}));
% netral{5}= zeros(size(epochCell{1,1}{1,1}));

% for i = 1:4
%     for j = 1:15
%         switch cond(j)
%             case 1 
%                 %kongruen{1,i} = epochCell{1,i}{1,j};
%                 temp = epochCell{1,i}{1,j};
%                 kongruen {1,i} = cat (1, kongruen{1,i}, temp);
%             case 2
%             	temp = epochCell{1,i}{1,j};
%                 inkongruen{1,i} = cat (1, inkongruen{1,i}, temp);
%             case 3
%             	temp = epochCell{1,i}{1,j};
%                 netral{1,i} = cat (1, netral{1,i}, temp);
%         end
%     end
% end


%% Plotting Epoch 
tPlotStart = -200;
tPlotStop = 800;
tPlot = tPlotStart:1000/200:tPlotStop-1; % sumbu X untuk grafik
cPlot = ['b', 'g', 'r', 'm', 'k']; % colour palette untuk grafik

%plot(tPlot, epochCell{1,1}{1,1}); %Plot grafik awal
%plot(0, min(epochCell{1,1}{1,1}):max(epochCell{1,1}{1,1})); %Plot grafik tegak lurus
%plot(tPlot, epochCell{1,1}{1,1}, 0, min(epochCell{1,1}{1,1}):max(epochCell{1,1}{1,1}));

% Plotting 5 stimulus Ch1
% KONGRUEN
figure;
for i = 1:5
    %p = plot(tPlot, kongruen{1,1}{1,i}, 'Color', cPlot(i));
	p = plot(tPlot, kongruen{1,1}(i,:), 'Color', cPlot(i));
	title('Plot Kondisi Kongruen CH1 Filter');
	xlabel('Waktu (ms)'); ylabel('Amplitudo');
    hold on;
end
hold off;

% INKONGRUEN
figure;
for i = 1:5
    %p = plot(tPlot, kongruen{1,1}{1,i}, 'Color', cPlot(i));
	p = plot(tPlot, inkongruen{1,1}(i,:), 'Color', cPlot(i));
	title('Grafik Kondisi Inkongruen CH1 Filter');
	xlabel('Waktu (ms)'); ylabel('Amplitudo');
    hold on;
end
hold off;

%NETRAL
figure;
for i = 1:5
    %p = plot(tPlot, kongruen{1,1}{1,i}, 'Color', cPlot(i));
	p = plot(tPlot, netral{1,1}(i,:), 'Color', cPlot(i));
	title('Grafik Kondisi Netral CH1 Filter');
	xlabel('Waktu (ms)'); ylabel('Amplitudo');
    hold on;
end
hold off;

%Looping
for x = 1:3 % Looping tiap kondisi
	for y = 1:4 % Looping tiap channel
		figure;
		for i = 1:5 % Looping stimulus
		    %p = plot(tPlot, kongruen{1,1}{1,i}, 'Color', cPlot(i));
			p = plot(tPlot, netral{1,1}(i,:), 'Color', cPlot(i));
			title('Grafik Kondisi Netral CH1 Filter');
			xlabel('Waktu (ms)'); ylabel('Amplitudo');
		    hold on;
		end
		hold off;
	end
end

%% Averaging Epoch
% temp = zeros(size(kongruen{1,1}{1,i}));
% for i = 1:5
% 	temp = cat(1, kongruen{1,1}{1,i}, temp);
% end

% % Tampung ke dalam 1 tabel
% temp = zeros(5,200); % buat matrik 5x200 (5row, 200column)
% for i=1:5
% 	temp(i,:) = kongruen{1,1}{1,i};
% end

% Hitung Rerata
% temp = kongruen{1,1};
% meanK = mean(temp);
% figure;
% meanPlot = plot(tPlot, meanK); 
% title('Grafik Rerata Kondisi Kongruen Ch1'); xlabel('Waktu (ms)'); ylabel('Amplitudo');

temp = inkongruen{1,1};
meanK = mean(temp);
figure;
meanPlot = plot(tPlot, meanK); 
title('Grafik Rerata Kondisi Inkongruen Ch1'); xlabel('Waktu (ms)'); ylabel('Amplitudo');

% temp = netral{1,1};
% meanK = mean(temp);
% figure;
% meanPlot = plot(tPlot, meanK); 
% title('Grafik Rerata Kondisi Netral Ch1'); xlabel('Waktu (ms)'); ylabel('Amplitudo');