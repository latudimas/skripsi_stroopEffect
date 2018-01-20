%% Fungsi Pengelompokan Epoch menjadi 3 kategori
% K = Kelompok Kongruen
% I = Kelompok Inkongruen
% N = Kelompok Netral
% dataInput = data epochCell

function [kongruen, inkongruen, netral] = grouping(dataInput)
  seq = [2 1 1 2 3 2 1 3 3 1 2 1 3 3 2]; %data sequence

  for i = 1:4 % looping channel
      ck = 1; ci = 1; cn = 1; %Counter tiap kondisi;
      for j = 1:15 % looping tiap epoch stimulus
          switch seq(j)
              case 1 % kondisi kongruen
                kongruen{1,i}(ck,:) = dataInput{1,i}{1,j}; % Shortest Way
              	ck=ck+1;
              case 2 % kondisi inkonguen
                inkongruen{1,i}(ci,:) = dataInput{1,i}{1,j};
              	ci=ci+1;
              case 3 % kondisi netral
                netral{1,i}(cn,:) = dataInput{1,i}{1,j};
              	cn=cn+1;
          end
      end
  end

end
