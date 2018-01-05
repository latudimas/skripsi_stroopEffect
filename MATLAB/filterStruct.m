%% Membuat struct filter
% Filter dibagi menjadi 2, 0.5-30Hz dan 0.5-5Hz
% Tambah argument HIGH (H) atau LOW (L)

function filterStruct(filterData, tipe, fileName, numTrial)

load(fileName);
if tipe == 'H'
  for i = 1:4
    temp = filterData{1,i};
    SubjekData(i).FilterHigh(numTrial, :) = temp;
  end
elseif tipe == 'L'
  for i = 1:4
    temp = filterData{1,i};
    SubjekData(i).FilterLow(numTrial, :) = temp;
  end
end

save(fileName, 'SubjekData');
end %end function
