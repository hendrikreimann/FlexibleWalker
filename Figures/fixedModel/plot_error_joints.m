% toggle flags
save_figures = 1;

% get data
index = 'Llegq';
setDataRoot;
% [stdvecLlegq, stdvecLlegq_noGAS] = create_stdvec_joints(index);

% define vector of movement times
time_vec = [0.1, 0.18, 0.2, 0.22, 0.25, 0.3, 0.4, 0.5, 0.6];

% set graphics parameters
colors = [hex2rgb('#003e69'); hex2rgb('#0077a6'); hex2rgb('#02b5e6'); hex2rgb('#77f5ff')];
joint_labels = {'Hip Flexion', 'Hip Adduction', 'Knee Flexion', 'Ankle Flexion'};
plot_order = [2 1 3 4];
linewidth = 6;
xlimits = [0.09 0.61];
ylimits = [-1 19];

% plot
figure_size = [800 300];
figure('position', [50 50 figure_size]); hold on
xlim(xlimits);
ylim(ylimits);
plot(xlimits, [0 0], 'color', [0.7 0.7 0.7], 'linewidth', 2);

number_of_joints = size(stdvecLlegq, 2);
for i_joint = 1 : number_of_joints
    plot ...
      ( ...
        time_vec, rad2deg(stdvecLlegq(:, plot_order(i_joint))), ...
        'linewidth', linewidth, ...
        'color', colors(i_joint, :), ...
        'Marker', 'o', ...
        'MarkerSize', 12, ...
        'MarkerEdgeColor', 'none', ...
        'MarkerFaceColor', colors(i_joint, :), ...
        'DisplayName', joint_labels{plot_order(i_joint)} ...
      )
end
legend('show')
xlabel('movement times')
ylabel('RMS (deg)')

if save_figures
    save_folder = [data_root filesep 'fixedModel'];
    filename = [save_folder filesep 'error'];
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
    filename = [save_folder filesep 'error_clean'];
    print(gcf, filename, '-dpdf')
    close(gcf)
end

