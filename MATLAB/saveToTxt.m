%=======================================%
%         FUNGSI SIMPAN DATA .TXT       %
%          funct name: saveToTxt        %
%=======================================%

% Menyalin data yang disimpan ke text file dengan format .txt

%% Save to TXT
% namaFile sebagai nama text file tujuan
% namaData sebagai nama data yang ingin di salin

function saveToTxt(namaFile, dataInput)

for i = 1:4

    dataPrint = dataInput{1,i}{1,1};
    %append data ke text file
    namaFile = fopen('DataCampur.txt', 'a');
    fprintf(namaFile, '%f,\t', dataPrint(1:800));
    fprintf(namaFile, '\n');
end
fclose(namaFile);

end %End Function
