%%---------------------------------%%
%          PENELITIAN EEG           %
%           MAHMUDIN AMIN           %
%        13/347641/PA/15343         %
%        ELINS - UGM - 2013         %
%%---------------------------------%%

% Data EEG Analysis
% Plot Data Uji

clc;
clear;

%% Load Data

load s4p102.txt          %ambil data dari file
rawdata = s4p102;        %data dipindah ke variabel
rawdata = rawdata(:,2:5)';     %pemotongan data (kolom,baris) (semua baris, kolom ke2-5) {')untuk ngebalik kolom jadi baris
fs = 200;                      %frekuensi sampling
detik = 19;                    %data yg di skip
ttw = 10;                      %total time window
%save('namafile.mat','variabel');

%% koef filter 7-13Hz (ALFA)
%[b,a] = butter(2,[11 13]/(fs/2));                %filter butterworth orde 2(orde,frequensi filter/frekuensi cuplik)

[b,a] = butter(2,[10 11]/(fs/2));
% koef filter 0.5-4Hz (DELTA)
% [b,a] = butter(2,[0.5 4]/(fs/2));  

% koef filter 4-8Hz (THETA)
%[b,a] = butter(2,[4 8]/(fs/2));                

% koef filter 13-30Hz (BETA)
% [b,a] = butter(2,[13 30]/(fs/2));                

% notch filter 50Hz
[bn,an] = butter(2,[49 51]/(fs/2),'stop');      %notch filter DC bias OpenBCI

%% filtering & notch
for i=1:4                                            %data ke 1-4
    rawdata(i,:) = filter(b,a,rawdata(i,:));         %filtering data ke-i
    rawdata(i,:) = filter(bn,an,rawdata(i,:));       %notch data ke-i
end    


%% data dalam cell
for j=1:4                                         %4channel data elektroda EEG
    for i=1:6                                     %6buah jenis rangsangan gambar

        x = (((detik*fs)+1)+((i-1)*fs*10));         %mulai awal detik ke 11 range pergeseran 5 detik
        data{j,i} = rawdata(j,x:(x+(10*fs)-1));     %ngambil 10detik data berikutnya
    end  
  i=1;
end         

%% penyimpanan data sementara
datatemp = data{j,i};
        
%% plot data 
        
for j=1:4
    figure(j)
            
    for i=1:6
    y = 2000*(i-1);
    tt = (y:((fs*ttw)-1)+y)/fs; % time limit 0 s/d (y+10)-1
    
        subplot(6,1,i); 
        plot(tt,data{j,i});          % namplin data plot i(ada6), j+1(ganti channel)            
        
        if i==1          
            title(sprintf('Potogan Data %d',i));axis([y/fs (((fs*ttw)-1)+y)/fs -30 30]);
        elseif i==2
            title(sprintf('Potogan Data %d',i));axis([y/fs (((fs*ttw)-1)+y)/fs -30 30]);
        elseif i==3
            title(sprintf('Potogan Data %d',i));axis([y/fs (((fs*ttw)-1)+y)/fs -30 30]);
        elseif i==4
            title(sprintf('Potogan Data %d',i));axis([y/fs (((fs*ttw)-1)+y)/fs -30 30]);
        elseif i==5
            title(sprintf('Potogan Data %d',i));axis([y/fs (((fs*ttw)-1)+y)/fs -30 30]);
        else
            title(sprintf('Potogan Data %d',i));axis([y/fs (((fs*ttw)-1)+y)/fs -30 30]);
        end       
    end 
    str = sprintf('Ploting-Data-Uji-Pola-2-CH-%d',j); % namefile figure
    print(str,'-dpng'); % print as png-data
end    

