%% FUNGSI freqDist 
% Menghitung Frequency Distribution dan Probabilit Freqeuncy dari RT
%----------------------------------------------------------------------
% count     = frekuensi dari tiap bins (sumbu X)
% center    = bins (sumbu Y)
% dataExcel = Array Reaction Time
% opt       = opsi untuk program

function [count, center] = freqDist(dataExcel, opt)

y = dataExcel; 
numInterval = 16; % dari 450 - 1200
intervalWidth = (1250-450)/numInterval; % hasilnya 50
x = 450:intervalWidth:1200; 
nCount = histc(y,x); % perhitungan frekuensi tiap interval

switch nargin
    case 2  % Opsi FD dan PD
        pCount = nCount/sum(nCount);
        figure; bar(x, nCount); % plot untuk FD
        title('Distribusi Frekuensi Reaction Time');
        figure; bar(x, pCount);
        title('Probabilitas Frekuensi Reaction Time');
    case 1 
        figure; bar(x, nCount);
        title('Distribusi Frekuensi Reaction Time');
%     otherwise
%         disp('Nothin to Do');
end

if nargout ~= 0
    disp('Plot Only');
elseif nargout == 2 
    count = nCount;
    center =x;
end

end % end function
