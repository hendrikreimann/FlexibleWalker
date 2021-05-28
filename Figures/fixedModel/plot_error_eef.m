close all


%% For plotting the error of another body part in cartesian coordiantes, just chose the corresponding index
index='Ball_left';


[stdvecBall, stdvecBall_noGAS]=create_stdvec_eef(index);

time_vec=[0.1,0.18, 0.2, 0.22,0.25, 0.3, 0.4, 0.5, 0.6];



hold on
plot(time_vec, stdvecBall, 'linewidth',2)
plot(time_vec, stdvecBall_noGAS, 'linewidth',2)

xlabel('movement times')
ylabel(' std in m')
legend('Ball with GAS', ' Ball without GAS' )
%% Compute Correlation
%R = corrcoef(EEF_muscle,EEF_torque);
