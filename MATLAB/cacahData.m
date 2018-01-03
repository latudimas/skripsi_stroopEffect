%=======================================%
%            FUNGSI CACAH DATA          %
%          funct name: cacahData        %
%=======================================%

% Memotong data utuh (Start-Stop Streaming) menjadi bagian per-stimulus
% Data yang dipotong disimpan kedalam cell array
% Penyimpanan dibagi menjadi 4 cell kanal dan di dalamanya ada 15 cell stimulus

%% Potong Data
% ouputnya berupa cell array bernama cacah
% inputnya berupa cell array yang bernama dataInput

function cacah = cacahData(dataInput)

cacahStart = 361;
cacahStop = 560;

dataProcess = dataInput(1,:);

for j = 1:15 %Loop untuk membuat 15 data uji
    % jika cacahstop >12000, stop
    if cacahStop <= 12000
        %disp('dalem'); disp(i); disp(j); potong data sesuai time
        % cacah{1,i}{1,j}= dataInput{i}(cacahStart:cacahStop);
        cacah{1,j} = dataProcess(cacahStart:cacahStop);

        %update batas potong
        cacahStart = cacahStop+601;
        cacahStop = cacahStart+199;
    end
end

end %%End Function
