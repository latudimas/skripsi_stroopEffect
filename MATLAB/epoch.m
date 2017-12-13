%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        	   FUNGSI EPOCH            %%
%          function name: epoch         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Membuat Epoch dengan rentang waktu 1 detik
%Mulai dari -200 pre-stimulus hingga 800ms setelah stimulus onset

function outputCell = epoch(inputData)

for i = 1:4
    eStart = 361; % 1.8*200ms
    eStop = 560;  % 2.8*200ms
	for j = 1:15
		if eStart <= 12000;
			outputCell{1,i}{1,j} = inputData{i}(eStart:eStop);

			eStart = eStop + 601 ; %interval 3 detik
			eStop =  eStart + 199;
		end
	end
end

end %END FUNCTION
