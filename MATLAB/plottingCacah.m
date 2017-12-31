%=======================================%
%         FUNGSI PLOTTING CACAH         %
%         funct name: cacahData         %
%=======================================%

function plottingCacah(dataInput, timeAxis, tipeData)
% variabel tipeData yang dimaksud disini adalah apakah data berupa data RAW
% atau data FILTER
figure;
for i = 1:15
    %figure(i);
    for j = 1:4
            subplot(4,1,j); plot(timeAxis, dataInput{1,j}{1,i}); title(sprintf('Channel%d stimulus ke-%d %s', j,i, tipeData));
    end
    print(sprintf('Plot Stimulus %d Jaler01 %s', i, tipeData), '-dpng');
    movefile(sprintf('Plot Stimulus %d Jaler01 %s.png', i, tipeData), 'Picture\Jaler 01 Coba');
end

end %END FUNCTION
