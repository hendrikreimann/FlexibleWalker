close all



index='Llegq';


[stdvecLlegq, stdvecLlegq_noGAS]=create_stdvec_joints(index);

time_vec=[0.1,0.18, 0.2, 0.22,0.25, 0.3, 0.4, 0.5, 0.6];



hold on
plot(time_vec, stdvecLlegq, 'linewidth',2)
%plot(time_vec, stdvecLleqg_noGAS, 'linewidth',2)

xlabel('movement times')
ylabel(' std in rad')
legend('Hip Pitch', ' Hip Roll', 'Knee', 'Ankle' )
%% Compute Correlation
%R = corrcoef(EEF_muscle,EEF_torque);