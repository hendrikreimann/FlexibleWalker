% toggle flags
plot_movement_1 = 1; % good with GAS,

plot_movement_2 = 0; % problem GAS, with GAS
plot_movement_3 = 0; % good, without GAS
plot_movement_4 = 0; % problem GAS, without GAS
plot_movement_5 = 0; % Path with GAS

plot_path = 0;

save_figures = 1;

setDataRoot
% M2 with GaS
% load([data_root filesep 'fixedModel' filesep 'out2_muscle.mat']);
% load([data_root filesep 'fixedModel' filesep 'out2_torque.mat']);
% % M1 without GAS
% load([data_root filesep 'fixedModel' filesep 'out3_muscle.mat']);
% % M2 without GAS
% load([data_root filesep 'fixedModel' filesep 'out4_muscle.mat']);
% % M5 
% % Path with GAS
% load([data_root filesep 'fixedModel' filesep 'out_muscle_b.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_torque.mat']);
% %Path wihout GAS
% load([data_root filesep 'fixedModel' filesep 'out_muscle.mat']);

% Plot Settings
color_hip_p = [1 0 0];
color_hip_r = [0.3010, 0.7450, 0.9330];
color_knee = [0, 0.5, 0];
color_ankle = [0.8500 0.3250 0.0980];

color_hip_p = [224 15 13] / 255;
color_hip_r = [98 14 245] / 255;
color_knee = [2 179 224] / 255;
color_ankle = [6 217 2] / 255;

color_hip_p = hex2rgb('#003e69');
color_hip_r = hex2rgb('#0077a6');
color_knee  = hex2rgb('#02b5e6');
color_ankle = hex2rgb('#77f5ff');


colorvec = {color_hip_p, color_hip_r, color_knee, color_ankle};
width = 6;

% transform joint angle values to more usual convention
joint_angle_offsets = [-180 0 -180 90];
joint_angle_signs = [-1 1 -1 1];
joint_labels = {'Hip Flexion', 'Hip Adduction', 'Knee Flexion', 'Ankle Flexion'};

plot_order = [2 1 3 4];


 if plot_path
      
    figure; hold on

    plot(out_muscle_b.AnklePosL(:,1), out_muscle_b.AnklePosL(:,3),'b', 'linewidth', 2)
    plot(out_torque.AnklePosL(:,1), out_torque.AnklePosL(:,3),'k:', 'linewidth', 2)
    xlabel('x [m]')
    ylabel('z [m]')
    legend('Ankle Trajectory', 'Target Ankle Trajectory')
    axis equal
    hold off
 end
 
 if plot_movement_1
    load([data_root filesep 'fixedModel' filesep 'out1_muscle.mat']);
    load([data_root filesep 'fixedModel' filesep 'out1_torque.mat']);
    
    figure_size = [800 300];
    figure('position', [50 50 figure_size]); hold on
    for index = 1 : 4
        plot(out1_muscle.tout, joint_angle_signs(plot_order(index)) * rad2deg(out1_muscle.Llegq(:,plot_order(index))) - joint_angle_offsets(plot_order(index)),'color',colorvec{index},'linewidth', width, 'DisplayName', joint_labels{plot_order(index)});
        plot(out1_torque.tout, joint_angle_signs(plot_order(index)) * rad2deg(out1_torque.Llegq(:,plot_order(index))) - joint_angle_offsets(plot_order(index)), '--', 'color', [0.5 0.5 0.5], 'linewidth', 2, 'DisplayName', 'reference')
    end
    
    
    legend('show')
    xlabel('time [s]')
    ylabel('angle [rad]')

    if save_figures
        save_folder = [data_root filesep 'fixedModel'];
        filename = [save_folder filesep 'exampleMovement'];
        set(gcf, 'PaperUnits', 'points', 'PaperSize', figure_size);
        print(gcf, filename, '-dpdf')
%         print(gcf, filename, '-dtiff', '-r150')
        
        set(get(gca, 'xaxis'), 'visible', 'off');
        set(get(gca, 'yaxis'), 'visible', 'off');
        set(get(gca, 'xlabel'), 'visible', 'off');
        set(get(gca, 'ylabel'), 'visible', 'off');
        set(get(gca, 'title'), 'visible', 'off');
        set(gca, 'xticklabel', '');
        set(gca, 'yticklabel', '');
        set(gca, 'position', [0 0 1 1]);
        legend(gca, 'hide');
        filename = [save_folder filesep 'exampleMovement_clean'];
        print(gcf, filename, '-dpdf')
%         print(gcf, filename, '-dtiff', '-r150')
        close(gcf)
    end
    
    
 end
 
 if plot_movement_2
     
      
    figure;
    hold on
     for index=1:4
       
         plot(out2_muscle.tout, out2_muscle.Llegq(:,index),'color',colorvec{index},'linewidth', width)
     end
     
     plot(out2_torque.tout, out2_torque.Llegq, 'k:', 'linewidth', 2)
     legend('Hip Pitch','Hip Roll', 'Knee', 'Ankle', 'Target Angles' )
     xlabel('time [s]')
     ylabel('angle [rad]')
     hold off
     
 end
 
 if plot_movement_3
     
   
    figure;
    hold on
    
        for index=1:4
       
             plot(out4_muscle.tout, out4_muscle.Llegq(:,index),'color',colorvec{index},'linewidth', width)
        end
        plot(out1_torque.tout, out1_torque.Llegq, 'k:', 'linewidth', 2)
     legend('Hip Pitch','Hip Roll', 'Knee', 'Ankle', 'Target Angles' )
     xlabel('time [s]')
     ylabel('angle [rad]')
     hold off
end
     
if plot_movement_4
         
     
        
        figure;
        hold on

        for index=1:4
       
            plot(out3_muscle.tout, out3_muscle.Llegq(:,index),'color',colorvec{index},'linewidth', width)
        end
        
        plot(out2_torque.tout, out2_torque.Llegq, 'k:', 'linewidth', 2)
     
     legend('Hip Pitch','Hip Roll', 'Knee', 'Ankle', 'Target Angles' )
     xlabel('time [s]')
     ylabel('angle [rad]')
     hold off

end
     
if plot_movement_5
     

    figure; 
    hold on
    
     for index=1:4
       
         plot(out_muscle_b.tout, out_muscle_b.Llegq(:,index),'color',colorvec{index},'linewidth', width)
     end
     plot(out_torque.tout, out_torque.Llegq, 'k:', 'linewidth', 2)
     legend('Hip Pitch','Hip Roll', 'Knee', 'Ankle', 'Target Angles' )
     xlabel('time [s]')
     ylabel('angle [rad]')
     hold off
     
     
     
end    
     

  