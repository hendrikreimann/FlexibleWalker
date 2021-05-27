% toggle flags
plot_path = 1;
plot_movement_1 = 1; % good with GAS
plot_movement_2 = 1; % problem GAS, with GAS
plot_movement_3 = 1; % good, without GAS
plot_movement_4 = 1; % problem GAS, without GAS
plot_movement_5 = 0; % Path with GAS

setDataRoot
% M1 with GAS
load([data_root filesep 'fixedModel' filesep 'out1_muscle.mat']);
load([data_root filesep 'fixedModel' filesep 'out1_torque.mat']);
% M2 with GaS
load([data_root filesep 'fixedModel' filesep 'out2_muscle.mat']);
load([data_root filesep 'fixedModel' filesep 'out2_torque.mat']);
% M1 without GAS
load([data_root filesep 'fixedModel' filesep 'out3_muscle.mat']);
% M2 without GAS
load([data_root filesep 'fixedModel' filesep 'out4_muscle.mat']);
% M5 
% Path with GAS
load([data_root filesep 'fixedModel' filesep 'out_muscle_b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_torque.mat']);
%Path wihout GAS
load([data_root filesep 'fixedModel' filesep 'out_muscle.mat']);

% Plot Settings
color_hip_p = [1 0 0];
color_hip_r = [0.3010, 0.7450, 0.9330];
color_knee = [0, 0.5, 0];
color_ankle = [0.8500 0.3250 0.0980];
colorvec = {color_hip_p,color_hip_r, color_knee, color_ankle};
width = 3;

  
 if plot_path
      
    figure;
    hold on

    plot(out_muscle_b.AnklePosL(:,1), out_muscle_b.AnklePosL(:,3),'b', 'linewidth', 2)
    plot(out_torque.AnklePosL(:,1), out_torque.AnklePosL(:,3),'k:', 'linewidth', 2)
    xlabel('x [m]')
    ylabel('z [m]')
    legend('Ankle Trajectory', 'Target Ankle Trajectory')
    axis equal
    hold off
 
 
 end
 
 if plot_movement_1
     
    figure;
    hold on
    for index=1:4
      
        plot(out1_muscle.tout, out1_muscle.Llegq(:,index),'color',colorvec{index},'linewidth', width)
    end
    plot(out1_torque.tout, out1_torque.Llegq, 'k:', 'linewidth', 2)
    legend('Hip Pitch','Hip Roll', 'Knee', 'Ankle', 'Target Angles' )
    xlabel('time [s]')
    ylabel('angle [rad]')
    hold off
     
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
     

  