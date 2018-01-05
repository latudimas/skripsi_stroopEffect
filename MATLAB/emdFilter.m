% Band Pass Filter 0.5-30 Hz from RAW data
% Data saved into new field in SubjekData Struct

function emdFilterData(dataInput, fileName, numTrial)

fs = 200;
load(fileName);

%filter Coefficient
[bB aB] = butter(2, [0.5 30]/(fs/2));
[bN aN] = butter(2, [49 51]/(fs/2), 'stop');
bC = conv(bB, bN);
aC = conv(aB, aN);

for i=1:4
  rawData = SubjekData.RAW(i); % load data from struct and save it rawData variable
  rawData = filter(bC, aC, rawData); % filter data

  % append filtered data to new field
  SubjekData(i).emdFilter(numTrial, :) = rawData; % save data to Field emdFilter
end

save(fileName,'SubjekData'); % save added data
