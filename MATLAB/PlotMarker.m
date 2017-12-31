%=======================================%
%              PLOT & MARKER            %
%=======================================%

% Plotting data dan memberikan marker berupa garis vertikal sesuai dengan sumbu X

close all;
clear;

tPlotStart = -200;
tPlotStop = 800;
tPlot = tPlotStart:1000/200:tPlotStop-1;

sName = {'Ahmad', 'Jaler', 'Mudin', 'Ricahyo'};


for x = 1:4
	fileName = sprintf('matdata/Struct%s', sName{x})
	load (fileName)

	% Kondisi Kongruen
	for i = 1:4
		for j =1:3
			fig = figure('visible','off');
			plot(tPlot,sKondisi(i).KONGRUEN(j,:));
            v = vline(0, 'r');
            title(sprintf('Plot Kongruen %s CH%d Trial ke-%d', sName{x}, i, j));
            xlabel('Waktu (ms)'); ylabel('Amplitudo');
            saveas(fig, sprintf('Pictures/K/K %s CH%d Trial %d.png', sName{x}, i, j));
		end
    end

    % Kondisi Inkongruen
	for i = 1:4
		for j =1:3
			fig = figure('visible','off');
			plot(tPlot,sKondisi(i).INKONGRUEN(j,:));
            v = vline(0, 'r');
            title(sprintf('Plot Inkongruen %s CH%d Trial ke-%d', sName{x}, i, j));
            xlabel('Waktu (ms)'); ylabel('Amplitudo');
            saveas(fig, sprintf('Pictures/I/I %s CH%d Trial %d.png', sName{x}, i, j));
		end
    end

    % Kondisi Netral
	for i = 1:4
		for j =1:3
			fig = figure('visible','off');
			plot(tPlot,sKondisi(i).NETRAL(j,:));
            v = vline(0, 'r');
            title(sprintf('Plot Netral %s CH%d Trial ke-%d', sName{x}, i, j));
            xlabel('Waktu (ms)'); ylabel('Amplitudo');
            saveas(fig, sprintf('Pictures/N/N %s CH%d Trial %d.png', sName{x}, i, j));
		end
    end

end % end for x
