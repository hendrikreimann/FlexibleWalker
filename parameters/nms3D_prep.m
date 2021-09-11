
% run old start files to load variables
%run(['parameters' filesep 'old' filesep 'runScripts.m'])



load('paramIC_02cm.mat')
load('model_14dof.mat')
load('init_des_left.mat')
load('init_l_left.mat')
load('init_v_left.mat')
load('init_des_right.mat')
load('init_l_right.mat')
load('init_v_right.mat')
load('init_angle_sag.mat')
load('init_angle_lat.mat')
load('init_sensor_body.mat')
load('init_sensor_world.mat')
load('init_q_del.mat')

nms3D_sInit
nms3D_mInit
nms3D_cInit
nms3D_icInit

StepDur=0.5;
t=20;

assign_parameters;








