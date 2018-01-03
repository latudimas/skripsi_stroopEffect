%% Membuat struct filter

function filterStruct(filterData, fileName, numTrial)

load(fileName);

for i = 1:4
  temp = filterData{1,i};
  SubjekData(i).Filter(numTrial, :) = temp;
end

save(fileName, 'SubjekData');
end %end function
