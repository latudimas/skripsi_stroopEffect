%% Fungsi mmebuat epoch struct

function epochStruct(kongruen, inkongruen, netral, fileName, tipe)
load(fileName);

if tipe == 'L' % For Low Epoch
  %% KONGRUEN
  for i = 1:4
    temp = kongruen{i}; % temporary variabel untuk nyimpan data Kondisi

    % Salin data berukuran 5*200 ke field Kongruen
    if isempty(SubjekData(i).Kongruen) % First time isi ke field
      SubjekData(i).Kongruen = temp;
    elseif size(SubjekData(i).Kongruen, 1) < 15
       % append data jika field udah ada yang isi
      SubjekData(i).Kongruen = cat(1, SubjekData(i).Kongruen, temp);
    end
  end

  %% INKONGRUEN
  for i = 1:4
    temp = inkongruen{i}; % temporary variabel untuk nyimpan data Kondisi

    % Salin data berukuran 5*200 ke field Inkongruen
    if isempty(SubjekData(i).Inkongruen) % First time isi ke field
      SubjekData(i).Inkongruen = temp;
    elseif size(SubjekData(i).Inkongruen, 1) < 15
      SubjekData(i).Inkongruen = cat(1, SubjekData(i).Inkongruen, temp);
    end
  end

  %% NETRAL
  for i = 1:4
    temp = netral{i}; % temporary variabel untuk nyimpan data Kondisi

    % Salin data berukuran 5*200 ke field Netral
    if isempty(SubjekData(i).Netral) % First time isi ke field
      SubjekData(i).Netral = temp;
    elseif size(SubjekData(i).Netral, 1) < 15
      SubjekData(i).Netral = cat(1, SubjekData(i).Netral, temp);
    end
  end

elseif tipe == 'H'
  %% KONGRUEN
  for i = 1:4
    temp = kongruen{i}; % temporary variabel untuk nyimpan data Kondisi

    % Salin data berukuran 5*200 ke field Kongruen
    if isempty(SubjekData(i).K_emd) % First time isi ke field
      SubjekData(i).K_emd = temp;
    elseif size(SubjekData(i).K_emd, 1) < 15
       % append data jika field udah ada yang isi
      SubjekData(i).K_emd = cat(1, SubjekData(i).K_emd, temp);
    end
  end

  %% INKONGRUEN
  for i = 1:4
    temp = inkongruen{i}; % temporary variabel untuk nyimpan data Kondisi

    % Salin data berukuran 5*200 ke field Inkongruen
    if isempty(SubjekData(i).I_emd) % First time isi ke field
      SubjekData(i).I_emd = temp;
    elseif size(SubjekData(i).I_emd, 1) < 15
      SubjekData(i).I_emd = cat(1, SubjekData(i).I_emd, temp);
    end
  end

  %% NETRAL
  for i = 1:4
    temp = netral{i}; % temporary variabel untuk nyimpan data Kondisi

    % Salin data berukuran 5*200 ke field Netral
    if isempty(SubjekData(i).N_emd) % First time isi ke field
      SubjekData(i).N_emd = temp;
    elseif size(SubjekData(i).N_emd, 1) < 15
      SubjekData(i).N_emd = cat(1, SubjekData(i).N_emd, temp);
    end
  end
end
save(fileName, 'SubjekData');
end %end function
