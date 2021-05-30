% toggle flags
load_data       = 0;
preprocess_data = 1;
save_figures    = 1;

plot_cartesian  = 1;
plot_polar      = 1;

% load data
if load_data
    setDataRoot
    
    % load raw data
    load([data_root filesep 'directionControl' filesep 'out_m15b.mat']);
    load([data_root filesep 'directionControl' filesep 'out_m30b.mat']);
    load([data_root filesep 'directionControl' filesep 'out_m45b.mat']);
    load([data_root filesep 'directionControl' filesep 'out_p15b.mat']);
    load([data_root filesep 'directionControl' filesep 'out_p30c.mat']);
    load([data_root filesep 'directionControl' filesep 'out_p45c.mat']);
    load([data_root filesep 'directionControl' filesep 'out_0b.mat']);
    
    % resample
    data_raw = ...
      { ...
        out_0b, ...
        out_m15b, ...
        out_m30b, ...
        out_m45b, ...
        out_p15b, ...
        out_p30c, ...
        out_p45c, ...
      };
end    
    
if preprocess_data
    
    
    % set parameters
    dt = 1e-3;
    fs = dt^(-1);
    filter_order = 2;
    cutoff_frequency = 0.1; % in Hz
    [b_filter, a_filter] = butter(filter_order, cutoff_frequency/(fs/2), 'low');
    
    % resample
    trunk_pos_all = cell(size(data_raw));
    time_all = cell(size(data_raw));
    for i_data = 1 : length(data_raw)
        data_here = data_raw{i_data};
        T = data_here.tout(end);
        time_here = dt : dt : T;
        trunk_pos_resampled = interp1(data_here.tout, data_here.xyzHAT, time_here);
        % invert z-axis to have top-down view
        trunk_pos_resampled(:, 3) = -trunk_pos_resampled(:, 3);
        trunk_pos_all{i_data} = trunk_pos_resampled;
        time_all{i_data} = time_here;
    end
    
    % calculate velocities
    trunk_vel_all = cell(size(data_raw));
    trunk_dir_all = cell(size(data_raw));
    for i_data = 1 : length(data_raw)
        trunk_vel_all{i_data} = deriveByTime(trunk_pos_all{i_data}, time_all{i_data});
        trunk_dir = atan2(trunk_vel_all{i_data}(:, 3), trunk_vel_all{i_data}(:, 1));
        trunk_dir_all{i_data} = filtfilt(b_filter, a_filter, trunk_dir);

        
    end    

    
    target_angles = deg2rad([0 -15 -30 -45 15 30 45]);
    
    
    % color_0 = hex2rgb('#036602');
    color_0 = hex2rgb('#469637');
    % color_0 = hex2rgb('#79c965');

    color_m15 = hex2rgb('#01ccfc');
    color_m30 = hex2rgb('#2196ed');
    color_m45 = hex2rgb('#0062dd');

    color_p15 = hex2rgb('#fcaf1c');
    color_p30 = hex2rgb('#ff8b0d');
    color_p45 = hex2rgb('#ff6200');

    colors = ...
      [ ...
        color_0; ...
        color_m15; ...
        color_m30; ...
        color_m45; ...
        color_p15; ...
        color_p30; ...
        color_p45; ...
      ];
end

if plot_cartesian
    figure_size = [180 180]*4;
    figure('position', [50 50 figure_size]); hold on
    axis equal
    linewidth = 6;
    
    line_length_pre = 50;
    line_length_post = 10;
    
    % determine end points and plot target line
    for i_line = 1 : length(target_angles)
        end_point = trunk_pos_all{i_line}(end, [1 3]);
        line_start_point = end_point - line_length_pre * [cos(target_angles(i_line)), sin(target_angles(i_line))];
        line_end_point = end_point + line_length_post * [cos(target_angles(i_line)), sin(target_angles(i_line))];
        plot([line_start_point(1) line_end_point(1)], [line_start_point(2) line_end_point(2)], '--', 'color', [0.7 0.7 0.7], 'linewidth', 2, 'HandleVisibility', 'off')
        
        plot(trunk_pos_all{i_line}(:,1), trunk_pos_all{i_line}(:,3), 'displayname', num2str(rad2deg(target_angles(i_line))), 'linewidth', linewidth, 'color', colors(i_line, :))
    end
    
    xlim([-15 165])
    ylim([-90 90])
    xlabel('x in m')
    ylabel('z in m')
    legend('show', 'location', 'northwest')
    
    
    
    if save_figures
        save_folder = [data_root filesep 'directionControl'];
        filename = [save_folder filesep 'directionCartesian'];
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
        filename = [save_folder filesep 'directionCartesian_clean'];
        print(gcf, filename, '-dpdf')
        close(gcf)
    end
    
end

if plot_polar
    figure_size = [720 360];
    figure('position', [50 50 figure_size]); hold on
    
    for i_line = 1 : length(target_angles)
        plot(time_all{i_line}([1 end]), -rad2deg(target_angles(i_line))*[1 1], '--', 'linewidth', 2, 'displayname', num2str(rad2deg(target_angles(i_line))), 'linewidth', 2, 'color', [0.7 0.7 0.7])
    end
    for i_line = 1 : length(target_angles)
        plot(time_all{i_line}, rad2deg(trunk_dir_all{i_line}), 'displayname', num2str(rad2deg(target_angles(i_line))), 'linewidth', linewidth, 'color', colors(i_line, :))
    end
    
    if save_figures
        save_folder = [data_root filesep 'directionControl'];
        filename = [save_folder filesep 'directionPolar'];
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
        filename = [save_folder filesep 'directionPolar_clean'];
        print(gcf, filename, '-dpdf')
        close(gcf)
    end
    
%     plot(out_m15b.tout, out_m15b.RotationTrunk(:, 2), 'linewidth', 2)
%     plot(out_m30b.tout, out_m30b.RotationTrunk(:, 2), 'linewidth', 2)
%     plot(out_m45b.tout, out_m45b.RotationTrunk(:, 2), 'linewidth', 2)
%     plot(out_p15b.tout, out_p15b.RotationTrunk(:, 2), 'linewidth', 2)
%     plot(out_p30c.tout, out_p30c.RotationTrunk(:, 2), 'linewidth', 2)
%     plot(out_p45c.tout, out_p45c.RotationTrunk(:, 2), 'linewidth', 2)
%     plot(out_0b.tout, out_0b.RotationTrunk(:, 2), 'linewidth', 2)

    %     plot([-5  95], [-31 69], ':k')
%     plot([0  100], [35 -65], ':k')
%     plot([0  100], [-23 35], ':k')
%     plot([0  100], [37 -21], ':k')
%     plot([0  100], [0 20], ':k')
%     plot([0  100], [17 -10], ':k')
%     plot([0  100], [0 0], ':k')

%     xlim([0 100])
%     ylim([-70 70])
%     xlabel('x in m')
%     ylabel('z in m')
%     legend('-15 deg', '-30 deg', '-45 deg', '15 deg', '30 deg', '45 deg', '0 deg', 'target angles')
    
    
    
end




