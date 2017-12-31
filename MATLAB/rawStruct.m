function rawStruct(rawData, fileName, numTrial)

load(fileName);

for i = 1:4
  temp = rawData{1,i};
  SubjekData(i).RAW(numTrial, :) = temp;
end

save(fileName, 'SubjekData');
end %end function
