%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           FUNGSI CACAH DATA         %%
%          funct name: cacahData        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Memotong data utuh (Start-Stop Streaming) menjadi bagian per-stimulus
% Data yang dipotong disimpan kedalam cell array
% Penyimpanan dibagi menjadi 4 cell kanal dan di dalamanya ada 15 cell stimulus

%% Potong Data
% ouputnya berupa cell array bernama cacah
% inputnya berupa cell array yang bernama dataInput

function cacah = cacahData(dataInput)

for i = 1:4 %Loop untuk buat cell 4 channel
    cacahStart = 1;
    cacahStop = 800;
    for j = 1:15 %Loop untuk membuat 15 data uji
        % jika cacahstop >12000, stop
        if cacahStop < 12800
            %disp('dalem'); disp(i); disp(j); potong data sesuai time
            cacah{1,i}{1,j}= dataInput{i}(cacahStart:cacahStop);

            %update batas potong
            cacahStart = cacahStop+1;
            cacahStop = cacahStop+800;
        end
    end
end

end %%End Function