% flags
load_data = 1;

create_speed_figure = 1;
create_cadence_figure = 0;
save_figures = 0;

% load data
setDataRoot;
data_velocity = load([data_root filesep 'velocityControl' filesep 'velocity.mat']);
data_cadence = load([data_root filesep 'velocityControl' filesep 'cadence.mat']);
data_time = load([data_root filesep 'velocityControl' filesep 'time.mat']);

vel = data_velocity.vel;
cad = data_cadence.cad;
time = data_time.time;

% linear fit
[py,Sy]=polyfit(time,vel,1);
y1=polyval(py,time);
[pcad,Scad]=polyfit(time,cad,1);
y2=polyval(pcad,time);

if create_speed_figure
    % speed figure
    figure_size = [800 600];
    figure('position', [0 0 figure_size])
    axes; hold on
    scatter(time,vel,'linewidth', 2);
    plot(time,y1, 'linewidth', 2);
    xlabel('Trunk Pitch Target Orientation in rad')
    ylabel('Walking Speed in m/s')
    legend('Sample Data', 'Linear Fit')

    if save_figures
        save_folder = [data_root filesep 'velocityControl'];
        filename = [save_folder filesep 'velocity'];
%         saveas(gcf, [filename '_filtered'], 'pdf')
        set(gcf, 'PaperUnits', 'points', 'PaperSize', [800 600]);
        print(gcf, filename, '-dpdf')

        set(get(gca, 'xaxis'), 'visible', 'off');
        set(get(gca, 'yaxis'), 'visible', 'off');
        set(get(gca, 'xlabel'), 'visible', 'off');
        set(get(gca, 'ylabel'), 'visible', 'off');
        set(get(gca, 'title'), 'visible', 'off');
        set(gca, 'xticklabel', '');
        set(gca, 'yticklabel', '');
        set(gca, 'position', [0 0 1 1]);
        legend(gca, 'hide');

        filename = [save_folder filesep 'velocity_clean'];
        print(gcf, filename, '-dpdf')
    end
end

if create_cadence_figure
    % cadence figure
    figure('position', [0 0 800 600])
    axes; hold on
    scatter(time,cad,'linewidth', 2);
    plot(time,y2, 'linewidth', 2);
    xlabel('Trunk Pitch Target Orientation in rad')
    ylabel('Cadence in steps/s')
    legend('Sample Data', 'Linear Fit')

    if save_figures
        save_folder = [data_root filesep 'velocityControl'];
        filename = [save_folder filesep 'velocity'];
%         print(gcf, filename, '-djpeg', '-r300')
        saveas(gcf, ['figures' filesep 'pdf' filesep filename '_filtered'], 'pdf')

        set(get(gca, 'xaxis'), 'visible', 'off');
        set(get(gca, 'yaxis'), 'visible', 'off');
        set(get(gca, 'xlabel'), 'visible', 'off');
        set(get(gca, 'ylabel'), 'visible', 'off');
        set(get(gca, 'title'), 'visible', 'off');
        set(gca, 'xticklabel', '');
        set(gca, 'yticklabel', '');
        set(gca, 'position', [0 0 1 1]);
        legend(gca, 'hide');

        filename = [save_folder filesep 'velocity_clean'];
        print(gcf, filename, '-djpeg', '-r300')
        close(gcf)
    end
end
