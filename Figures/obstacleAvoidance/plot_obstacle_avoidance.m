% toggle flags
plot_sagittal = 1;
plot_lateral = 1;

make_behavioral_phase_figure = 1;
save_figures = 1;

% set colors
color_sag_high = hex2rgb('#036602');
color_sag_med = hex2rgb('#469637');
color_sag_low = hex2rgb('#79c965');


color_lat_05 = hex2rgb('#fcaf1c');
color_lat_10 = hex2rgb('#ff8b0d');
color_lat_15 = hex2rgb('#ff6200');

color_med_05 = hex2rgb('#01ccfc');
color_med_10 = hex2rgb('#2196ed');
color_med_15 = hex2rgb('#0062dd');


% color_lat_20 = hex2rgb('#ff6200');
% color_med_20 = hex2rgb('#0062dd');

patch_color = [0 0 0];
patch_alpha = 0.05;

figure_size = [800 400];

% Plotting options
linewidth = 9;

setDataRoot;
if plot_sagittal
    % load
    data_normal = load([data_root filesep 'obstacleAvoidance' filesep 'out_normal.mat']);
    data_sagittal_15 = load([data_root filesep 'obstacleAvoidance' filesep 'out_sagittal_15.mat']);
    data_sagittal_20 = load([data_root filesep 'obstacleAvoidance' filesep 'out_sagittal_20.mat']);
    data_sagittal_25 = load([data_root filesep 'obstacleAvoidance' filesep 'out_sagittal_25.mat']);
    
    % find events
%     time_event_detection = (12:0.001:16);
    t_0 = 13.7;
    left_heelstrike_times_normal = data_normal.out_normal.tout(find(diff(data_normal.out_normal.Contact(:, 1)) > 0 & data_normal.out_normal.tout(1:end-1) > t_0));
    left_pushoff_times_normal = data_normal.out_normal.tout(find(diff(data_normal.out_normal.Contact(:, 1)) < 0 & data_normal.out_normal.tout(1:end-1) > t_0));
    right_heelstrike_times_normal = data_normal.out_normal.tout(find(diff(data_normal.out_normal.Contact(:, 2)) > 0 & data_normal.out_normal.tout(1:end-1) > t_0));
    right_pushoff_times_normal = data_normal.out_normal.tout(find(diff(data_normal.out_normal.Contact(:, 2)) < 0 & data_normal.out_normal.tout(1:end-1) > t_0));
    step_times_normal = [left_heelstrike_times_normal(1) right_pushoff_times_normal(1) right_heelstrike_times_normal(1) left_pushoff_times_normal(1) left_heelstrike_times_normal(2)];

    left_heelstrike_times_sagittal_15 = data_sagittal_15.out_sagittal_15.tout(find(diff(data_sagittal_15.out_sagittal_15.Contact(:, 1)) > 0 & data_sagittal_15.out_sagittal_15.tout(1:end-1) > t_0));
    left_pushoff_times_sagittal_15 = data_sagittal_15.out_sagittal_15.tout(find(diff(data_sagittal_15.out_sagittal_15.Contact(:, 1)) < 0 & data_sagittal_15.out_sagittal_15.tout(1:end-1) > t_0));
    right_heelstrike_times_sagittal_15 = data_sagittal_15.out_sagittal_15.tout(find(diff(data_sagittal_15.out_sagittal_15.Contact(:, 2)) > 0 & data_sagittal_15.out_sagittal_15.tout(1:end-1) > t_0));
    right_pushoff_times_sagittal_15 = data_sagittal_15.out_sagittal_15.tout(find(diff(data_sagittal_15.out_sagittal_15.Contact(:, 2)) < 0 & data_sagittal_15.out_sagittal_15.tout(1:end-1) > t_0));
    step_times_sagittal_15 = [left_heelstrike_times_sagittal_15(1) right_pushoff_times_sagittal_15(1) right_heelstrike_times_sagittal_15(1) left_pushoff_times_sagittal_15(1) left_heelstrike_times_sagittal_15(2)];
    
    left_heelstrike_times_sagittal_20 = data_sagittal_20.out_sagittal_20.tout(find(diff(data_sagittal_20.out_sagittal_20.Contact(:, 1)) > 0 & data_sagittal_20.out_sagittal_20.tout(1:end-1) > t_0));
    left_pushoff_times_sagittal_20 = data_sagittal_20.out_sagittal_20.tout(find(diff(data_sagittal_20.out_sagittal_20.Contact(:, 1)) < 0 & data_sagittal_20.out_sagittal_20.tout(1:end-1) > t_0));
    right_heelstrike_times_sagittal_20 = data_sagittal_20.out_sagittal_20.tout(find(diff(data_sagittal_20.out_sagittal_20.Contact(:, 2)) > 0 & data_sagittal_20.out_sagittal_20.tout(1:end-1) > t_0));
    right_pushoff_times_sagittal_20 = data_sagittal_20.out_sagittal_20.tout(find(diff(data_sagittal_20.out_sagittal_20.Contact(:, 2)) < 0 & data_sagittal_20.out_sagittal_20.tout(1:end-1) > t_0));
    step_times_sagittal_20 = [left_heelstrike_times_sagittal_20(1) right_pushoff_times_sagittal_20(1) right_heelstrike_times_sagittal_20(1) left_pushoff_times_sagittal_20(1) left_heelstrike_times_sagittal_20(2)];
    
    left_heelstrike_times_sagittal_25 = data_sagittal_25.out_sagittal_25.tout(find(diff(data_sagittal_25.out_sagittal_25.Contact(:, 1)) > 0 & data_sagittal_25.out_sagittal_25.tout(1:end-1) > t_0));
    left_pushoff_times_sagittal_25 = data_sagittal_25.out_sagittal_25.tout(find(diff(data_sagittal_25.out_sagittal_25.Contact(:, 1)) < 0 & data_sagittal_25.out_sagittal_25.tout(1:end-1) > t_0));
    right_heelstrike_times_sagittal_25 = data_sagittal_25.out_sagittal_25.tout(find(diff(data_sagittal_25.out_sagittal_25.Contact(:, 2)) > 0 & data_sagittal_25.out_sagittal_25.tout(1:end-1) > t_0));
    right_pushoff_times_sagittal_25 = data_sagittal_25.out_sagittal_25.tout(find(diff(data_sagittal_25.out_sagittal_25.Contact(:, 2)) < 0 & data_sagittal_25.out_sagittal_25.tout(1:end-1) > t_0));
    step_times_sagittal_25 = [left_heelstrike_times_sagittal_25(1) right_pushoff_times_sagittal_25(1) right_heelstrike_times_sagittal_25(1) left_pushoff_times_sagittal_25(1) left_heelstrike_times_sagittal_25(2)];
    

    % calculate average times
    step_times_average = (step_times_normal + step_times_sagittal_15 + step_times_sagittal_20 + step_times_sagittal_25) * 0.25;
    step_one_duration = step_times_average(3) - step_times_average(1);
    step_two_duration = step_times_average(5) - step_times_average(3);
    double_stance_one_duration = step_times_average(2) - step_times_average(1);
    double_stance_two_duration = step_times_average(4) - step_times_average(3);
    pushoff_ratio_one = double_stance_one_duration / step_one_duration;
    pushoff_ratio_two = double_stance_two_duration / step_two_duration;
    
    % resample
    sagittal_00_1 = interp1(data_normal.out_normal.tout, data_normal.out_normal.Ball_right(:,2), linspace(step_times_normal(1), step_times_normal(3), 101));
    sagittal_00_2 = interp1(data_normal.out_normal.tout, data_normal.out_normal.Ball_right(:,2), linspace(step_times_normal(3), step_times_normal(5), 101));
    sagittal_00 = [sagittal_00_1 sagittal_00_2(2:end)];
    sagittal_15_1 = interp1(data_sagittal_15.out_sagittal_15.tout, data_sagittal_15.out_sagittal_15.Ball_right(:,2), linspace(step_times_sagittal_15(1), step_times_sagittal_15(3), 101));
    sagittal_15_2 = interp1(data_sagittal_15.out_sagittal_15.tout, data_sagittal_15.out_sagittal_15.Ball_right(:,2), linspace(step_times_sagittal_15(3), step_times_sagittal_15(5), 101));
    sagittal_15 = [sagittal_15_1 sagittal_15_2(2:end)];
    sagittal_20_1 = interp1(data_sagittal_20.out_sagittal_20.tout, data_sagittal_20.out_sagittal_20.Ball_right(:,2), linspace(step_times_sagittal_20(1), step_times_sagittal_20(3), 101));
    sagittal_20_2 = interp1(data_sagittal_20.out_sagittal_20.tout, data_sagittal_20.out_sagittal_20.Ball_right(:,2), linspace(step_times_sagittal_20(3), step_times_sagittal_20(5), 101));
    sagittal_20 = [sagittal_20_1 sagittal_20_2(2:end)];
    sagittal_25_1 = interp1(data_sagittal_25.out_sagittal_25.tout, data_sagittal_25.out_sagittal_25.Ball_right(:,2), linspace(step_times_sagittal_25(1), step_times_sagittal_25(3), 101));
    sagittal_25_2 = interp1(data_sagittal_25.out_sagittal_25.tout, data_sagittal_25.out_sagittal_25.Ball_right(:,2), linspace(step_times_sagittal_25(3), step_times_sagittal_25(5), 101));
    sagittal_25 = [sagittal_25_1 sagittal_25_2(2:end)];
    
    % resample
%     time = (left_heelstrike : 0.001 : right_heelstrike);
% 
%     sagittal_15 = interp1(data_sagittal_15.out_sagittal_15.tout, data_sagittal_15.out_sagittal_15.Ball_right(:,2), time);
%     sagittal_20 = interp1(data_sagittal_20.out_sagittal_20.tout, data_sagittal_20.out_sagittal_20.Ball_right(:,2), time);
%     sagittal_25 = interp1(data_sagittal_25.out_sagittal_25.tout, data_sagittal_25.out_sagittal_25.Ball_right(:,2), time);
%     sagittal_00 = interp1(data_normal.out_normal.tout, data_normal.out_normal.Ball_right(:,2), time);
% 
    sagittal_15 = sagittal_15 - sagittal_00;
    sagittal_20 = sagittal_20 - sagittal_00;
    sagittal_25 = sagittal_25 - sagittal_00;
    sagittal_00 = sagittal_00 - sagittal_00;
    
    % time

    figure('position', [50 50 figure_size]);
    hold on
    plot(0:200, sagittal_15, 'linewidth', linewidth, 'color', color_sag_low, 'displayname', '15');
    plot(0:200, sagittal_20, 'linewidth', linewidth, 'color', color_sag_med, 'displayname', '20');
    plot(0:200, sagittal_25, 'linewidth', linewidth, 'color', color_sag_high, 'displayname', '25');
    
    ylimits = [-0.02 0.18];
    
    title('Right Ball')
    xlabel('time in s')
    ylabel('height of ball relative to basis step in m')
    xlim([0 100 + pushoff_ratio_two*100])
    ylim(ylimits);
    legend('show')
    
    if save_figures
        save_folder = [data_root filesep 'obstacleAvoidance'];
        filename = [save_folder filesep 'obstacleSagittal'];
        set(gcf, 'PaperUnits', 'points', 'PaperSize', figure_size);
        print(gcf, filename, '-dpdf')

        set(get(gca, 'xaxis'), 'visible', 'off');
        set(get(gca, 'yaxis'), 'visible', 'off');
        set(get(gca, 'xlabel'), 'visible', 'off');
        set(get(gca, 'ylabel'), 'visible', 'off');
        set(get(gca, 'title'), 'visible', 'off');
%         set(gca, 'Color', 'none');
        set(gca, 'xticklabel', '');
        set(gca, 'yticklabel', '');
        set(gca, 'position', [0 0 1 1]);
        legend(gca, 'hide');

        filename = [save_folder filesep 'obstacleSagittal_clean'];
        print(gcf, filename, '-dpdf')
    end
   
    
    
    if make_behavioral_phase_figure
        % create figure
        figure('position', [50 50 figure_size]); 
        hold on
        set(gca, 'FontSize', 16);
        title('behavioral phases');

        % first step early swing 
        patch_double_one_x = [0 pushoff_ratio_one pushoff_ratio_one 0] * 100;
        patch_double_one_y = [1 1 2 2];
        patch_single_one_x = [pushoff_ratio_one 1 1 pushoff_ratio_one] * 100;
        patch_single_one_y = [0 0 1 1];
        patch_double_two_x = 100 + [0 pushoff_ratio_two pushoff_ratio_two 0] * 100;
        patch_double_two_y = [1 1 2 2];
        patch_single_two_x = 100 + [pushoff_ratio_two 1 1 pushoff_ratio_two] * 100;
        patch_single_two_y = [0 0 1 1];


        patch_double_one_handle = patch(patch_double_one_x, patch_double_one_y, patch_color, 'EdgeColor', 'none', 'FaceAlpha', patch_alpha); 
        patch_single_one_handle = patch(patch_single_one_x, patch_single_one_y, patch_color, 'EdgeColor', 'none', 'FaceAlpha', patch_alpha); 
        patch_double_two_handle = patch(patch_double_two_x, patch_double_two_y, patch_color, 'EdgeColor', 'none', 'FaceAlpha', patch_alpha); 
        patch_single_two_handle = patch(patch_single_two_x, patch_single_two_y, patch_color, 'EdgeColor', 'none', 'FaceAlpha', patch_alpha); 

        xlim([0 100 + pushoff_ratio_two*100])

        if save_figures
            save_folder = [data_root filesep 'obstacleAvoidance'];
            set(gcf, 'PaperUnits', 'points', 'PaperSize', figure_size);

            set(get(gca, 'xaxis'), 'visible', 'off');
            set(get(gca, 'yaxis'), 'visible', 'off');
            set(get(gca, 'xlabel'), 'visible', 'off');
            set(get(gca, 'ylabel'), 'visible', 'off');
            set(get(gca, 'title'), 'visible', 'off');
            set(gca, 'xticklabel', '');
            set(gca, 'yticklabel', '');
            set(gca, 'position', [0 0 1 1]);
            legend(gca, 'hide');
            filename = [save_folder filesep 'obstacleSagittal_phases'];
            print(gcf, filename, '-dpdf')
        end

    end
    
    
    
    
end

if plot_lateral
    % load
    data_normal = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_00.mat']);
    data_lat_05 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_05.mat']);
    data_lat_10 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_10.mat']);
    data_lat_15 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_15.mat']);
    data_lat_20 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_20.mat']);
    data_med_05 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_m05.mat']);
    data_med_10 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_m10.mat']);
    data_med_15 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_m15.mat']);
    data_med_20 = load([data_root filesep 'obstacleAvoidance' filesep 'out_lateral_m20.mat']);
    
    % find events
%     time_event_detection = (12:0.001:16);
    t_0 = 13.7;
    left_heelstrike_times_normal = data_normal.out_lateral_00.tout(find(diff(data_normal.out_lateral_00.Contact(:, 1)) > 0 & data_normal.out_lateral_00.tout(1:end-1) > t_0));
    left_pushoff_times_normal = data_normal.out_lateral_00.tout(find(diff(data_normal.out_lateral_00.Contact(:, 1)) < 0 & data_normal.out_lateral_00.tout(1:end-1) > t_0));
    right_heelstrike_times_normal = data_normal.out_lateral_00.tout(find(diff(data_normal.out_lateral_00.Contact(:, 2)) > 0 & data_normal.out_lateral_00.tout(1:end-1) > t_0));
    right_pushoff_times_normal = data_normal.out_lateral_00.tout(find(diff(data_normal.out_lateral_00.Contact(:, 2)) < 0 & data_normal.out_lateral_00.tout(1:end-1) > t_0));
    step_times_normal = [left_heelstrike_times_normal(1) right_pushoff_times_normal(1) right_heelstrike_times_normal(1) left_pushoff_times_normal(1) left_heelstrike_times_normal(2)];

    left_heelstrike_times_lat_05 = data_lat_05.out_lateral_05.tout(find(diff(data_lat_05.out_lateral_05.Contact(:, 1)) > 0 & data_lat_05.out_lateral_05.tout(1:end-1) > t_0));
    left_pushoff_times_lat_05 = data_lat_05.out_lateral_05.tout(find(diff(data_lat_05.out_lateral_05.Contact(:, 1)) < 0 & data_lat_05.out_lateral_05.tout(1:end-1) > t_0));
    right_heelstrike_times_lat_05 = data_lat_05.out_lateral_05.tout(find(diff(data_lat_05.out_lateral_05.Contact(:, 2)) > 0 & data_lat_05.out_lateral_05.tout(1:end-1) > t_0));
    right_pushoff_times_lat_05 = data_lat_05.out_lateral_05.tout(find(diff(data_lat_05.out_lateral_05.Contact(:, 2)) < 0 & data_lat_05.out_lateral_05.tout(1:end-1) > t_0));
    step_times_lat_05 = [left_heelstrike_times_lat_05(1) right_pushoff_times_lat_05(1) right_heelstrike_times_lat_05(1) left_pushoff_times_lat_05(1) left_heelstrike_times_lat_05(2)];
    
    left_heelstrike_times_lat_10 = data_lat_10.out_lateral_10.tout(find(diff(data_lat_10.out_lateral_10.Contact(:, 1)) > 0 & data_lat_10.out_lateral_10.tout(1:end-1) > t_0));
    left_pushoff_times_lat_10 = data_lat_10.out_lateral_10.tout(find(diff(data_lat_10.out_lateral_10.Contact(:, 1)) < 0 & data_lat_10.out_lateral_10.tout(1:end-1) > t_0));
    right_heelstrike_times_lat_10 = data_lat_10.out_lateral_10.tout(find(diff(data_lat_10.out_lateral_10.Contact(:, 2)) > 0 & data_lat_10.out_lateral_10.tout(1:end-1) > t_0));
    right_pushoff_times_lat_10 = data_lat_10.out_lateral_10.tout(find(diff(data_lat_10.out_lateral_10.Contact(:, 2)) < 0 & data_lat_10.out_lateral_10.tout(1:end-1) > t_0));
    step_times_lat_10 = [left_heelstrike_times_lat_10(1) right_pushoff_times_lat_10(1) right_heelstrike_times_lat_10(1) left_pushoff_times_lat_10(1) left_heelstrike_times_lat_10(2)];
    
    left_heelstrike_times_lat_15 = data_lat_15.out_lateral_15.tout(find(diff(data_lat_15.out_lateral_15.Contact(:, 1)) > 0 & data_lat_15.out_lateral_15.tout(1:end-1) > t_0));
    left_pushoff_times_lat_15 = data_lat_15.out_lateral_15.tout(find(diff(data_lat_15.out_lateral_15.Contact(:, 1)) < 0 & data_lat_15.out_lateral_15.tout(1:end-1) > t_0));
    right_heelstrike_times_lat_15 = data_lat_15.out_lateral_15.tout(find(diff(data_lat_15.out_lateral_15.Contact(:, 2)) > 0 & data_lat_15.out_lateral_15.tout(1:end-1) > t_0));
    right_pushoff_times_lat_15 = data_lat_15.out_lateral_15.tout(find(diff(data_lat_15.out_lateral_15.Contact(:, 2)) < 0 & data_lat_15.out_lateral_15.tout(1:end-1) > t_0));
    step_times_lat_15 = [left_heelstrike_times_lat_15(1) right_pushoff_times_lat_15(1) right_heelstrike_times_lat_15(1) left_pushoff_times_lat_15(1) left_heelstrike_times_lat_15(2)];
    
    left_heelstrike_times_lat_20 = data_lat_20.out_lateral_20.tout(find(diff(data_lat_20.out_lateral_20.Contact(:, 1)) > 0 & data_lat_20.out_lateral_20.tout(1:end-1) > t_0));
    left_pushoff_times_lat_20 = data_lat_20.out_lateral_20.tout(find(diff(data_lat_20.out_lateral_20.Contact(:, 1)) < 0 & data_lat_20.out_lateral_20.tout(1:end-1) > t_0));
    right_heelstrike_times_lat_20 = data_lat_20.out_lateral_20.tout(find(diff(data_lat_20.out_lateral_20.Contact(:, 2)) > 0 & data_lat_20.out_lateral_20.tout(1:end-1) > t_0));
    right_pushoff_times_lat_20 = data_lat_20.out_lateral_20.tout(find(diff(data_lat_20.out_lateral_20.Contact(:, 2)) < 0 & data_lat_20.out_lateral_20.tout(1:end-1) > t_0));
    step_times_lat_20 = [left_heelstrike_times_lat_20(1) right_pushoff_times_lat_20(1) right_heelstrike_times_lat_20(1) left_pushoff_times_lat_20(1) left_heelstrike_times_lat_20(2)];

    left_heelstrike_times_med_05 = data_med_05.out_lateral_m05.tout(find(diff(data_med_05.out_lateral_m05.Contact(:, 1)) > 0 & data_med_05.out_lateral_m05.tout(1:end-1) > t_0));
    left_pushoff_times_med_05 = data_med_05.out_lateral_m05.tout(find(diff(data_med_05.out_lateral_m05.Contact(:, 1)) < 0 & data_med_05.out_lateral_m05.tout(1:end-1) > t_0));
    right_heelstrike_times_med_05 = data_med_05.out_lateral_m05.tout(find(diff(data_med_05.out_lateral_m05.Contact(:, 2)) > 0 & data_med_05.out_lateral_m05.tout(1:end-1) > t_0));
    right_pushoff_times_med_05 = data_med_05.out_lateral_m05.tout(find(diff(data_med_05.out_lateral_m05.Contact(:, 2)) < 0 & data_med_05.out_lateral_m05.tout(1:end-1) > t_0));
    step_times_med_05 = [left_heelstrike_times_med_05(1) right_pushoff_times_med_05(1) right_heelstrike_times_med_05(1) left_pushoff_times_med_05(1) left_heelstrike_times_med_05(2)];
    
    left_heelstrike_times_med_10 = data_med_10.out_lateral_m10.tout(find(diff(data_med_10.out_lateral_m10.Contact(:, 1)) > 0 & data_med_10.out_lateral_m10.tout(1:end-1) > t_0));
    left_pushoff_times_med_10 = data_med_10.out_lateral_m10.tout(find(diff(data_med_10.out_lateral_m10.Contact(:, 1)) < 0 & data_med_10.out_lateral_m10.tout(1:end-1) > t_0));
    right_heelstrike_times_med_10 = data_med_10.out_lateral_m10.tout(find(diff(data_med_10.out_lateral_m10.Contact(:, 2)) > 0 & data_med_10.out_lateral_m10.tout(1:end-1) > t_0));
    right_pushoff_times_med_10 = data_med_10.out_lateral_m10.tout(find(diff(data_med_10.out_lateral_m10.Contact(:, 2)) < 0 & data_med_10.out_lateral_m10.tout(1:end-1) > t_0));
    step_times_med_10 = [left_heelstrike_times_med_10(1) right_pushoff_times_med_10(1) right_heelstrike_times_med_10(1) left_pushoff_times_med_10(1) left_heelstrike_times_med_10(2)];
    
    left_heelstrike_times_med_15 = data_med_15.out_lateral_m15.tout(find(diff(data_med_15.out_lateral_m15.Contact(:, 1)) > 0 & data_med_15.out_lateral_m15.tout(1:end-1) > t_0));
    left_pushoff_times_med_15 = data_med_15.out_lateral_m15.tout(find(diff(data_med_15.out_lateral_m15.Contact(:, 1)) < 0 & data_med_15.out_lateral_m15.tout(1:end-1) > t_0));
    right_heelstrike_times_med_15 = data_med_15.out_lateral_m15.tout(find(diff(data_med_15.out_lateral_m15.Contact(:, 2)) > 0 & data_med_15.out_lateral_m15.tout(1:end-1) > t_0));
    right_pushoff_times_med_15 = data_med_15.out_lateral_m15.tout(find(diff(data_med_15.out_lateral_m15.Contact(:, 2)) < 0 & data_med_15.out_lateral_m15.tout(1:end-1) > t_0));
    step_times_med_15 = [left_heelstrike_times_med_15(1) right_pushoff_times_med_15(1) right_heelstrike_times_med_15(1) left_pushoff_times_med_15(1) left_heelstrike_times_med_15(2)];
    
    left_heelstrike_times_med_20 = data_med_20.out_lateral_m20.tout(find(diff(data_med_20.out_lateral_m20.Contact(:, 1)) > 0 & data_med_20.out_lateral_m20.tout(1:end-1) > t_0));
    left_pushoff_times_med_20 = data_med_20.out_lateral_m20.tout(find(diff(data_med_20.out_lateral_m20.Contact(:, 1)) < 0 & data_med_20.out_lateral_m20.tout(1:end-1) > t_0));
    right_heelstrike_times_med_20 = data_med_20.out_lateral_m20.tout(find(diff(data_med_20.out_lateral_m20.Contact(:, 2)) > 0 & data_med_20.out_lateral_m20.tout(1:end-1) > t_0));
    right_pushoff_times_med_20 = data_med_20.out_lateral_m20.tout(find(diff(data_med_20.out_lateral_m20.Contact(:, 2)) < 0 & data_med_20.out_lateral_m20.tout(1:end-1) > t_0));
    step_times_med_20 = [left_heelstrike_times_med_20(1) right_pushoff_times_med_20(1) right_heelstrike_times_med_20(1) left_pushoff_times_med_20(1) left_heelstrike_times_med_20(2)];
    
    
    
    % calculate average times
    step_times = ...
      [ ...
        step_times_normal; ...
        step_times_lat_05; ...
        step_times_lat_10; ...
        step_times_lat_15; ...
        step_times_lat_20; ...
        step_times_med_05; ...
        step_times_med_10; ...
        step_times_med_15; ...
        step_times_med_20; ...
      ];
    step_times_average = mean(step_times);
    step_one_duration = step_times_average(3) - step_times_average(1);
    step_two_duration = step_times_average(5) - step_times_average(3);
    double_stance_one_duration = step_times_average(2) - step_times_average(1);
    double_stance_two_duration = step_times_average(4) - step_times_average(3);
    pushoff_ratio_one = double_stance_one_duration / step_one_duration;
    pushoff_ratio_two = double_stance_two_duration / step_two_duration;
%     
%     figure; hold on
%     plot(data_normal.out_lateral_00.tout, data_normal.out_lateral_00.Ball_right(:,3))
%     plot(data_lat_05.out_lateral_05.tout, data_lat_05.out_lateral_05.Ball_right(:,3))
    
    % resample
    normal_1 = interp1(data_normal.out_lateral_00.tout, data_normal.out_lateral_00.Ball_right(:,3), linspace(step_times_normal(1), step_times_normal(3), 101));
    normal_2 = interp1(data_normal.out_lateral_00.tout, data_normal.out_lateral_00.Ball_right(:,3), linspace(step_times_normal(3), step_times_normal(5), 101));
    normal = [normal_1 normal_2(2:end)];
    
    lat_05_1 = interp1(data_lat_05.out_lateral_05.tout, data_lat_05.out_lateral_05.Ball_right(:,3), linspace(step_times_lat_05(1), step_times_lat_05(3), 101));
    lat_05_2 = interp1(data_lat_05.out_lateral_05.tout, data_lat_05.out_lateral_05.Ball_right(:,3), linspace(step_times_lat_05(3), step_times_lat_05(5), 101));
    lat_05 = [lat_05_1 lat_05_2(2:end)];
    lat_10_1 = interp1(data_lat_10.out_lateral_10.tout, data_lat_10.out_lateral_10.Ball_right(:,3), linspace(step_times_lat_10(1), step_times_lat_10(3), 101));
    lat_10_2 = interp1(data_lat_10.out_lateral_10.tout, data_lat_10.out_lateral_10.Ball_right(:,3), linspace(step_times_lat_10(3), step_times_lat_10(5), 101));
    lat_10 = [lat_10_1 lat_10_2(2:end)];
    lat_15_1 = interp1(data_lat_15.out_lateral_15.tout, data_lat_15.out_lateral_15.Ball_right(:,3), linspace(step_times_lat_15(1), step_times_lat_15(3), 101));
    lat_15_2 = interp1(data_lat_15.out_lateral_15.tout, data_lat_15.out_lateral_15.Ball_right(:,3), linspace(step_times_lat_15(3), step_times_lat_15(5), 101));
    lat_15 = [lat_15_1 lat_15_2(2:end)];
    lat_20_1 = interp1(data_lat_20.out_lateral_20.tout, data_lat_20.out_lateral_20.Ball_right(:,3), linspace(step_times_lat_20(1), step_times_lat_20(3), 101));
    lat_20_2 = interp1(data_lat_20.out_lateral_20.tout, data_lat_20.out_lateral_20.Ball_right(:,3), linspace(step_times_lat_20(3), step_times_lat_20(5), 101));
    lat_20 = [lat_20_1 lat_20_2(2:end)];
    
    med_05_1 = interp1(data_med_05.out_lateral_m05.tout, data_med_05.out_lateral_m05.Ball_right(:,3), linspace(step_times_med_05(1), step_times_med_05(3), 101));
    med_05_2 = interp1(data_med_05.out_lateral_m05.tout, data_med_05.out_lateral_m05.Ball_right(:,3), linspace(step_times_med_05(3), step_times_med_05(5), 101));
    med_05 = [med_05_1 med_05_2(2:end)];
    med_10_1 = interp1(data_med_10.out_lateral_m10.tout, data_med_10.out_lateral_m10.Ball_right(:,3), linspace(step_times_med_10(1), step_times_med_10(3), 101));
    med_10_2 = interp1(data_med_10.out_lateral_m10.tout, data_med_10.out_lateral_m10.Ball_right(:,3), linspace(step_times_med_10(3), step_times_med_10(5), 101));
    med_10 = [med_10_1 med_10_2(2:end)];
    med_15_1 = interp1(data_med_15.out_lateral_m15.tout, data_med_15.out_lateral_m15.Ball_right(:,3), linspace(step_times_med_15(1), step_times_med_15(3), 101));
    med_15_2 = interp1(data_med_15.out_lateral_m15.tout, data_med_15.out_lateral_m15.Ball_right(:,3), linspace(step_times_med_15(3), step_times_med_15(5), 101));
    med_15 = [med_15_1 med_15_2(2:end)];
    med_20_1 = interp1(data_med_20.out_lateral_m20.tout, data_med_20.out_lateral_m20.Ball_right(:,3), linspace(step_times_med_20(1), step_times_med_20(3), 101));
    med_20_2 = interp1(data_med_20.out_lateral_m20.tout, data_med_20.out_lateral_m20.Ball_right(:,3), linspace(step_times_med_20(3), step_times_med_20(5), 101));
    med_20 = [med_20_1 med_20_2(2:end)];
    
    % calculate differences
    delta_lat_05 = lat_05 - normal;
    delta_lat_10 = lat_10 - normal;
    delta_lat_15 = lat_15 - normal;
    delta_lat_20 = lat_20 - normal;

    delta_med_05 = med_05 - normal;
    delta_med_10 = med_10 - normal;
    delta_med_15 = med_15 - normal;
    delta_med_20 = med_20 - normal;
    
    % time
    figure('position', [50 50 figure_size]); 
    hold on
    
    ylimits = [-0.15 0.15];
    
%     plot(0:200, normal, 'linewidth', linewidth, 'color', [0.7 0.7 0.7], 'displayname', 'normal');
%     plot(0:200, lat_05, 'linewidth', linewidth, 'color', color_lat_05, 'displayname', 'lat 05');
%     plot(0:200, lat_10, 'linewidth', linewidth, 'color', color_lat_10, 'displayname', 'lat 10');
%     plot(0:200, lat_15, 'linewidth', linewidth, 'color', color_lat_15, 'displayname', 'lat 15');
%     plot(0:200, lat_20, 'linewidth', linewidth, 'color', color_lat_20, 'displayname', 'lat 20');
%     plot(0:200, med_05, 'linewidth', linewidth, 'color', color_med_05, 'displayname', 'med 05');
%     plot(0:200, med_10, 'linewidth', linewidth, 'color', color_med_10, 'displayname', 'med 10');
%     plot(0:200, med_15, 'linewidth', linewidth, 'color', color_med_15, 'displayname', 'med 15');
%     plot(0:200, med_20, 'linewidth', linewidth, 'color', color_med_20, 'displayname', 'med 20');
    
    plot(0:200, delta_lat_05, 'linewidth', linewidth, 'color', color_lat_05, 'displayname', 'lat 05');
    plot(0:200, delta_lat_10, 'linewidth', linewidth, 'color', color_lat_10, 'displayname', 'lat 10');
    plot(0:200, delta_lat_15, 'linewidth', linewidth, 'color', color_lat_15, 'displayname', 'lat 15');
%     plot(0:200, delta_lat_20, 'linewidth', linewidth, 'color', color_lat_20, 'displayname', 'lat 20');
    plot(0:200, delta_med_05, 'linewidth', linewidth, 'color', color_med_05, 'displayname', 'med 05');
    plot(0:200, delta_med_10, 'linewidth', linewidth, 'color', color_med_10, 'displayname', 'med 10');
    plot(0:200, delta_med_15, 'linewidth', linewidth, 'color', color_med_15, 'displayname', 'med 15');
%     plot(0:200, delta_med_20, 'linewidth', linewidth, 'color', color_med_20, 'displayname', 'med 20');
    
    title('Right Ball')
    xlabel('time in s')
    ylabel('height of ball relative to basis step in m')
    xlim([0 100 + pushoff_ratio_two*100])
    ylim(ylimits);
    legend('show')
    
    if save_figures
        save_folder = [data_root filesep 'obstacleAvoidance'];
        filename = [save_folder filesep 'obstacleLateral'];
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

        filename = [save_folder filesep 'obstacleLateral_clean'];
        print(gcf, filename, '-dpdf')
    end
   
    
    if make_behavioral_phase_figure
        % create figure
        figure('position', [50 50 figure_size]); 
        hold on
        set(gca, 'FontSize', 16);
        title('behavioral phases');

        % first step early swing 
        patch_double_one_x = [0 pushoff_ratio_one pushoff_ratio_one 0] * 100;
        patch_double_one_y = [1 1 2 2];
        patch_single_one_x = [pushoff_ratio_one 1 1 pushoff_ratio_one] * 100;
        patch_single_one_y = [0 0 1 1];
        patch_double_two_x = 100 + [0 pushoff_ratio_two pushoff_ratio_two 0] * 100;
        patch_double_two_y = [1 1 2 2];
        patch_single_two_x = 100 + [pushoff_ratio_two 1 1 pushoff_ratio_two] * 100;
        patch_single_two_y = [0 0 1 1];


        patch_double_one_handle = patch(patch_double_one_x, patch_double_one_y, patch_color, 'EdgeColor', 'none', 'FaceAlpha', patch_alpha); 
        patch_single_one_handle = patch(patch_single_one_x, patch_single_one_y, patch_color, 'EdgeColor', 'none', 'FaceAlpha', patch_alpha); 
        patch_double_two_handle = patch(patch_double_two_x, patch_double_two_y, patch_color, 'EdgeColor', 'none', 'FaceAlpha', patch_alpha); 
        patch_single_two_handle = patch(patch_single_two_x, patch_single_two_y, patch_color, 'EdgeColor', 'none', 'FaceAlpha', patch_alpha); 

        xlim([0 100 + pushoff_ratio_two*100])

        if save_figures
            save_folder = [data_root filesep 'obstacleAvoidance'];
            set(gcf, 'PaperUnits', 'points', 'PaperSize', figure_size);

            set(get(gca, 'xaxis'), 'visible', 'off');
            set(get(gca, 'yaxis'), 'visible', 'off');
            set(get(gca, 'xlabel'), 'visible', 'off');
            set(get(gca, 'ylabel'), 'visible', 'off');
            set(get(gca, 'title'), 'visible', 'off');
            set(gca, 'xticklabel', '');
            set(gca, 'yticklabel', '');
            set(gca, 'position', [0 0 1 1]);
            legend(gca, 'hide');
            filename = [save_folder filesep 'obstacleLateral_phases'];
            print(gcf, filename, '-dpdf')
        end

    end

    
    
    
    
    
end


if false % plot_lateral
    
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

        filename = [save_folder filesep 'obstacleLateral_clean'];
        print(gcf, filename, '-dpdf')
    end

end