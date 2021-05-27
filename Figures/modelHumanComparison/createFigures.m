% load data
setDataRoot
loaded_data_model = load([data_root filesep 'modelHumanComparison' filesep 'results.mat']);
loaded_data_human = load([data_root filesep 'modelHumanComparison' filesep 'results_human.mat']);



figure_settings = SettingsCustodian('figureSettings.txt');

% initialize
variables_to_plot = figure_settings.get('variables_to_plot');
variables_to_plot_header = figure_settings.get('variables_to_plot_header');
number_of_variables_to_plot = size(variables_to_plot, 1);
double_stance_patch_color = figure_settings.get('stance_double_color');
edge_color = figure_settings.get('edge_color');
color_model = figure_settings.get('color_model');
color_human = figure_settings.get('color_human');

stance_alpha = figure_settings.get('stance_alpha');
show_outliers = figure_settings.get('show_outliers');
box_width = figure_settings.get('box_width');
plot_zero = figure_settings.get('plot_zero');

%% collect variables
variable_data_model = cell(number_of_variables_to_plot, 1);
variable_data_human = cell(number_of_variables_to_plot, 1);

for i_variable = 1 : number_of_variables_to_plot
    % model
    this_variable_name_model = variables_to_plot{i_variable, strcmp(variables_to_plot_header, 'variable_model')};
    this_variable_data_model = loaded_data_model.variable_data{strcmp(loaded_data_model.variable_names, this_variable_name_model)};
    variable_data_model{i_variable} = this_variable_data_model;

    this_variable_name_human = variables_to_plot{i_variable, strcmp(variables_to_plot_header, 'variable_human')};
    this_variable_data_human = loaded_data_human.variable_data{strcmp(loaded_data_human.variable_names, this_variable_name_human)};
    variable_data_human{i_variable} = this_variable_data_human;
end

%% calculate means
variable_means_model = cell(number_of_variables_to_plot, 1);
variable_cinvs_model = cell(number_of_variables_to_plot, 1);
variable_stds_model = cell(number_of_variables_to_plot, 1);
variable_means_human = cell(number_of_variables_to_plot, 1);
variable_cinvs_human = cell(number_of_variables_to_plot, 1);
variable_stds_human = cell(number_of_variables_to_plot, 1);

for i_variable = 1 : number_of_variables_to_plot
    this_variable_data_model = variable_data_model{i_variable};
    variable_means_model{i_variable} = mean(this_variable_data_model, 2);
    variable_cinvs_model{i_variable} = cinv(this_variable_data_model, 2);
    variable_stds_model{i_variable} = std(this_variable_data_model, 1, 2);
    this_variable_data_human = variable_data_human{i_variable};
    variable_means_human{i_variable} = mean(this_variable_data_human, 2);
    variable_cinvs_human{i_variable} = cinv(this_variable_data_human, 2);
    variable_stds_human{i_variable} = std(this_variable_data_human, 1, 2);
end

%% events
step_times = loaded_data_model.variable_data{strcmp(loaded_data_model.variable_names, 'step_time')};
pushoff_times = loaded_data_model.variable_data{strcmp(loaded_data_model.variable_names, 'pushoff_time')};
midswing_times = loaded_data_model.variable_data{strcmp(loaded_data_model.variable_names, 'midswing_time')};
pushoff_ratio = pushoff_times ./ step_times;
midswing_ratio = midswing_times ./ step_times;
pushoff_ratio_means = mean(pushoff_ratio);
midswing_ratio_means = mean(midswing_ratio);

%% plot
T_normalized = 200;
time_model = linspace(0, T_normalized, 201);
time_human = linspace(0, T_normalized, 101);

% plot 
for i_variable = 1 : number_of_variables_to_plot
    
    % create figure
    figure_size = [800 600];
    figure('position', [50 50 figure_size]); 
    hold on
    set(gca, 'FontSize', 16);
    title(strrep(variables_to_plot{i_variable, 1}, '_', ' '));
    if figure_settings.get('dictate_axes')
        set(gca, 'ylim', [str2double(variables_to_plot{i_variable, 5}), str2double(variables_to_plot{i_variable, 6})]);
    end
    
    % plot model
%     shadedErrorBar(time_model, variable_means_model{i_variable}', variable_cinvs_model{i_variable}', {'color', color_model, 'linewidth', 9}, 1);
    shadedErrorBar(time_model, variable_means_model{i_variable}', variable_stds_model{i_variable}', {'color', color_model, 'linewidth', 9}, 1);
    
    % plot human
%     shadedErrorBar(time_human, variable_means_human{i_variable}', variable_cinvs_human{i_variable}', {'color', color_human, 'linewidth', 9}, 1);
    shadedErrorBar(time_human, variable_means_human{i_variable}', variable_stds_human{i_variable}', {'color', color_human, 'linewidth', 9}, 1);
    
    % mark double stance
    double_stance_patch_color = figure_settings.get('stance_double_color');
    midswing_color = figure_settings.get('midswing_color');
    ylimits = get(gca, 'ylim');
    
    patch_x1 = 0;
    patch_x2 = pushoff_ratio_means(1) * T_normalized/2;
    patch_x = [patch_x1 patch_x2 patch_x2 patch_x1];
    patch_y = [ylimits(1) ylimits(1) ylimits(2) ylimits(2)];
    patch_handle = patch(patch_x, patch_y, double_stance_patch_color, 'EdgeColor', 'none', 'FaceAlpha', stance_alpha); 
    uistack(patch_handle, 'bottom')
    
    patch_x = T_normalized/2 + [patch_x1 patch_x2 patch_x2 patch_x1];
    patch_handle = patch(patch_x, patch_y, double_stance_patch_color, 'EdgeColor', 'none', 'FaceAlpha', stance_alpha); 
    uistack(patch_handle, 'bottom')
    
    % mark midswing
    plot_handle = plot(midswing_ratio_means(1) * T_normalized/2 * [1 1], ylimits, 'color', midswing_color, 'linewidth', 3);
    uistack(plot_handle, 'bottom')
    plot_handle = plot((T_normalized/2 + midswing_ratio_means(2) * T_normalized/2) * [1 1], ylimits, 'color', midswing_color, 'linewidth', 3);
    uistack(plot_handle, 'bottom')
    
    if figure_settings.get('remove_labels')
        set(get(gca, 'xaxis'), 'visible', 'off');
        set(get(gca, 'yaxis'), 'visible', 'off');
        set(get(gca, 'xlabel'), 'visible', 'off');
        set(get(gca, 'ylabel'), 'visible', 'off');
        set(get(gca, 'title'), 'visible', 'off');
        set(gca, 'xticklabel', '');
        set(gca, 'yticklabel', '');
        set(gca, 'position', [0 0 1 1]);
        legend(gca, 'hide');
    end
    
    if figure_settings.get('save')
        save_folder = [data_root filesep 'modelHumanComparison'];
        filename = [save_folder filesep variables_to_plot{i_variable, strcmp(variables_to_plot_header, 'save file name')}];
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
        filename = [save_folder filesep variables_to_plot{i_variable, strcmp(variables_to_plot_header, 'save file name')} '_clean'];
        print(gcf, filename, '-dpdf')
        close(gcf)
    end
    
end










