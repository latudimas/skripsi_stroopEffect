%=======================================%
%         	  FUNGSI STRUCT             %
%      function name: save2struct       %
%=======================================%

function save2struct(dataInput, subjectName)

fileName = sprintf('matdata/FilterData%s.mat', subjectName);

if exist(fileName) == 2 % Check .mat file jika udah ada
  load(fileName);
else
  filtered = struct('Data', []);
  % buat struct untuk tiap Channel
  filtered(1).Data = [];
  filtered(2).Data = [];
  filtered(3).Data = [];
  filtered(4).Data = [];

  % simpan di .mat baru
  save(fileName, 'filtered');
  load(fileName);
end

for i = 1:4
  temp = dataInput{1,i};

  if isempty(filtered(i).Data)
    filtered(i).Data = cat(1,temp);
  else
    filtered(i).Data = cat(1, filtered(i).Data, temp);
  end
end

save(fileName, 'filtered');

end % END FUNCTION
