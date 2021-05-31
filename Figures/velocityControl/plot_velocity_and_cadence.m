% flags
load_data = 1;

create_speed_figure = 1;
create_cadence_figure = 1;
save_figures = 1;

% load data
setDataRoot;
data_velocity = load([data_root filesep 'velocityControl' filesep 'velocity.mat']);
data_cadence = load([data_root filesep 'velocityControl' filesep 'cadence.mat']);
data_theta = load([data_root filesep 'velocityControl' filesep 'theta_tar.mat']);

vel = data_velocity.vel;
cad = data_cadence.cad;
theta_tar = rad2deg(data_theta.theta_tar);
xlimits = [6 8.5];

% linear fit
[pvel, Svel] = polyfit(theta_tar, vel, 1);
y_vel = polyval(pvel, xlimits);
[pcad, Scad] = polyfit(theta_tar, cad, 1);
y_cad = polyval(pcad, xlimits);

% calculate R^2 values
yfit_vel = polyval(pvel, theta_tar);
yresiduals_vel = vel - yfit_vel;
SSresid_vel = sum(yresiduals_vel.^2);
SStotal_vel = (length(vel)-1) * var(vel);
rsqare_vel = 1 - SSresid_vel/SStotal_vel;

yfit_cad = polyval(pcad, theta_tar);
yresiduals_cad = cad - yfit_cad;
SSresid_cad = sum(yresiduals_cad.^2);
SStotal_cad = (length(cad)-1) * var(cad);
rsqare_cad = 1 - SSresid_cad/SStotal_cad;




color_fit = hex2rgb('#d23d00');
color_data = hex2rgb('#0062dd');

figure_size = [800 400];

if create_speed_figure
    % speed figure
    figure('position', [50 50 figure_size])
    axes; hold on
    plot(xlimits, y_vel, 'linewidth', 6, 'color', color_fit, 'DisplayName', 'data');
    plot(theta_tar, vel, 'o', 'markersize', 12, 'markeredgecolor', 'none', 'markerfacecolor', color_data, 'DisplayName', 'fit');
    xlabel('Trunk Pitch Target Orientation in rad')
    ylabel('Walking Speed in m/s')
    legend('show')
    xlim(xlimits);

    if save_figures
        save_folder = [data_root filesep 'velocityControl'];
        filename = [save_folder filesep 'velocity'];
        set(gcf, 'PaperUnits', 'points', 'PaperSize', figure_size);
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
        close(gcf)
    end
end

if create_cadence_figure
    % cadence figure
    figure('position', [50+figure_size(1) 50 figure_size])
    axes; hold on
    plot(xlimits, y_cad * 60, 'linewidth', 6, 'color', color_fit, 'DisplayName', 'data');
    plot(theta_tar, cad * 60, 'o', 'markersize', 12, 'markeredgecolor', 'none', 'markerfacecolor', color_data, 'DisplayName', 'fit');
    xlabel('Trunk Pitch Target Orientation in rad')
    ylabel('Cadence (steps/min)')
    legend('show')
    xlim(xlimits);

    if save_figures
        save_folder = [data_root filesep 'velocityControl'];
        filename = [save_folder filesep 'cadence'];
        set(gcf, 'PaperUnits', 'points', 'PaperSize', figure_size);
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
        filename = [save_folder filesep 'cadence_clean'];
        print(gcf, filename, '-dpdf')
        close(gcf)
    end
end
