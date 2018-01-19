%% Plotting Instantaneous Frequency Dari IMF
% Yang ditampilkan hanya 1/2 dari IMF
close all;

load('matdata/SubjekData_Ahmad.mat');

fs = 200;
tPlot = -200:1000/200:800-1;
x = SubjekData(1).IMF_Kongruen;
figure;
hold on;
for i = 1: size(x, 1)/2;
  temp = x(i,:);

  z = hilbert(temp);
  inst = fs/(2*pi)*diff(unwrap(angle(z)));
  plot(tPlot(2:end), inst);
end
