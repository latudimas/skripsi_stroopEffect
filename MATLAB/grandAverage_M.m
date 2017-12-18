%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%										%
%             Grand Averaging           %
%										%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear;


sName = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'};

fileName2 = sprintf('matdata/GrandAverage_M.mat');
% save (fileName2);
if exist(fileName2) == 2
	load(fileName2);
else
	GrandAverage_M = struct('KONGRUEN', [], 'INKONGRUEN', [], 'NETRAL', []);
	% buat struct tiap channel
	GrandAverage_M(1).KONGRUEN = [];
	GrandAverage_M(2).KONGRUEN = [];
	GrandAverage_M(3).KONGRUEN = [];
	GrandAverage_M(4).KONGRUEN = [];

	% save data di .mat baru
	save(fileName2, 'GrandAverage_M');
	load(fileName2);
end


for x = 1:4 % untuk Load Data berdasarkan Nama array
    
	fileName = sprintf('matdata/Struct%s.mat', sName{x})
	load (fileName);

	% Kondisi Kongruen
	for i = 1:4
		temp = mean(sKondisi(i).KONGRUEN);
		if isempty(GrandAverage_M(i).KONGRUEN)
			GrandAverage_M(i).KONGRUEN = cat(1, temp); 
		else
			GrandAverage_M(i).KONGRUEN = cat (1, GrandAverage_M(i).KONGRUEN, temp);
		end
	end

	% Kondisi Inkongruen
	for i = 1:4
		temp = mean(sKondisi(i).INKONGRUEN);
		if isempty(GrandAverage_M(i).INKONGRUEN)
			GrandAverage_M(i).INKONGRUEN = cat(1, temp); 
		else
			GrandAverage_M(i).INKONGRUEN = cat (1, GrandAverage_M(i).INKONGRUEN, temp);
		end
	end

	% Kondisi Netral
	for i = 1:4
		temp = mean(sKondisi(i).NETRAL);
		if isempty(GrandAverage_M(i).NETRAL)
			GrandAverage_M(i).NETRAL = cat(1, temp); 
		else
			GrandAverage_M(i).NETRAL = cat (1, GrandAverage_M(i).NETRAL, temp);
		end
    end

	save(fileName2, 'GrandAverage_M');
end
