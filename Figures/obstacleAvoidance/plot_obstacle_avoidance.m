% toggle flags
plot_sagittal = 1;
plot_lateral = 1;

save_figures = 1;

% set colors
color_hip_p=[1 0 0];
color_hip_r=[0.3010, 0.7450, 0.9330];
color_knee=[0, 0.5, 0];
color_ankle=[0.8500 0.3250 0.0980];
colorvec={color_hip_p,color_hip_r, color_knee, color_ankle};

% Plotting options
linewidth = 3;

setDataRoot;
if plot_sagittal
    % load
    data_normal = load([data_root filesep 'obstacleAvoidance' filesep 'out_normal.mat']);
    data_sagittal_15 = load([data_root filesep 'obstacleAvoidance' filesep 'out_sagittal_15.mat']);
    data_sagittal_20 = load([data_root filesep 'obstacleAvoidance' filesep 'out_sagittal_20.mat']);
    data_sagittal_25 = load([data_root filesep 'obstacleAvoidance' filesep 'out_sagittal_25.mat']);
    
    % resample
    time=(12:0.001:16);

    sagittal_15 = interp1(data_sagittal_15.out_sagittal_15.tout, data_sagittal_15.out_sagittal_15.Ball_right(:,2), time);
    sagittal_20 = interp1(data_sagittal_20.out_sagittal_20.tout, data_sagittal_20.out_sagittal_20.Ball_right(:,2), time);
    sagittal_25 = interp1(data_sagittal_25.out_sagittal_25.tout, data_sagittal_25.out_sagittal_25.Ball_right(:,2), time);
    sagittal_00 = interp1(data_normal.out_normal.tout, data_normal.out_normal.Ball_right(:,2), time);

    sagittal_15 = sagittal_15 - sagittal_00;
    sagittal_20 = sagittal_20 - sagittal_00;
    sagittal_25 = sagittal_25 - sagittal_00;
    sagittal_00 = sagittal_00 - sagittal_00;

    figure_size = [800 600];
    figure('position', [0 0 figure_size]); 
    hold on
    plot(time, sagittal_15, 'linewidth', linewidth);
    plot(time, sagittal_20, 'linewidth', linewidth);
    plot(time, sagittal_25, 'linewidth', linewidth);
    
    title('Right Ball')
    xlabel('time in s')
    ylabel('height of ball relative to basis step in m')
    ylim([-0.05 0.2])
    xlim([13.75 14.74])
    legend('Avoid small', 'Avoid mid', 'Avoid large')
    
    if save_figures
        save_folder = [data_root filesep 'obstacleAvoidance'];
        filename = [save_folder filesep 'obstacleSagittal'];
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

        filename = [save_folder filesep 'obstacleSagittal_clean'];
        print(gcf, filename, '-dpdf')
    end
    
end



if plot_lateral
    
    % load
    data_lateral_05 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_05.mat']);
    data_lateral_10 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_10.mat']);
    data_lateral_15 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_15.mat']);
    data_lateral_20 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_20.mat']);
    data_lateral_00 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_00.mat']);
    data_lateral_m05 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_m05.mat']);
    data_lateral_m10 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_m10.mat']);
    data_lateral_m15 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_m15.mat']);
    data_lateral_m20 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_m20.mat']);
    
    time=(13:0.001:15);

    p05 = interp1(data_lateral_05.out_lateral_05.tout,   data_lateral_05.out_lateral_05.AnklePosR_body, time);
    p10 = interp1(data_lateral_10.out_lateral_10.tout,   data_lateral_10.out_lateral_10.AnklePosR_body, time);
    p15 = interp1(data_lateral_15.out_lateral_15.tout,   data_lateral_15.out_lateral_15.AnklePosR_body, time);
    m05 = interp1(data_lateral_m05.out_lateral_m05.tout, data_lateral_m05.out_lateral_m05.AnklePosR_body, time);
    m10 = interp1(data_lateral_m10.out_lateral_m10.tout, data_lateral_m10.out_lateral_m10.AnklePosR_body, time);
    m15 = interp1(data_lateral_m15.out_lateral_m15.tout, data_lateral_m15.out_lateral_m15.AnklePosR_body, time);
    m00 = interp1(data_lateral_00.out_lateral_00.tout,   data_lateral_00.out_lateral_00.AnklePosR_body, time);


    p05=p05(:,3)-m00(:,3);
    p10=p10(:,3)-m00(:,3);
    p15=p15(:,3)-m00(:,3);
    m05=m05(:,3)-m00(:,3);
    m10=m10(:,3)-m00(:,3);
    m15=m15(:,3)-m00(:,3);
    p00=m00(:,3)-m00(:,3);
    
      
    figure_size = [800 600];
    figure('position', [0 0 figure_size]); 
    hold on
    plot(time, p10, 'linewidth', linewidth);
    plot(time, p15, 'linewidth', linewidth);
    plot(time, m10, 'linewidth', linewidth);
    plot(time, m15, 'linewidth', linewidth);
    legend('Avoid small (r)', 'Avoid large (r)', 'Avoid small (l)', 'Avoid Large (l)')
    xlabel('time in s')
    ylabel('z position of ankle relative to basis step in m')
    xlim([13.3 14.74])

    if save_figures
        save_folder = [data_root filesep 'obstacleAvoidance'];
        filename = [save_folder filesep 'obstacleLateral'];
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

        filename = [save_folder filesep 'obstacleLateral_clean'];
        print(gcf, filename, '-dpdf')
    end

end