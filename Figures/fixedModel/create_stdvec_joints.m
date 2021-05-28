function [stdVec_GAS, stdVec_noGAS]=create_stdvec_joints(index)


% Torque Data
load out_rnd_t10.mat
load out_rnd_t14.mat
load out_rnd_t18.mat
load out_rnd_t20.mat
load out_rnd_t22.mat
load out_rnd_t25.mat
load out_rnd_t30.mat
load out_rnd_t40.mat
load out_rnd_t50.mat
load out_rnd_t60.mat

% Movements with GAS
load out_rnd_m10.mat
load out_rnd_m14.mat
load out_rnd_m18.mat
load out_rnd_m20.mat
load out_rnd_m22.mat
load out_rnd_m25.mat
load out_rnd_m30.mat
load out_rnd_m40.mat
load out_rnd_m50.mat
load out_rnd_m60.mat

% Movements without GAS
load out_rnd_m60b.mat
load out_rnd_m50b.mat
load out_rnd_m40b.mat
load out_rnd_m30b.mat
load out_rnd_m20b.mat
load out_rnd_m10b.mat
load out_rnd_m15b.mat
load out_rnd_m18b.mat
load out_rnd_m25b.mat
load out_rnd_m22b.mat


time_10=(0:0.001:10);
time_14=(0:0.001:14);
time_15=(0:0.001:15);
time_18=(0:0.001:18);
time_20=(0:0.001:20);
time_22=(0:0.001:22);
time_25=(0:0.001:25);
time_30=(0:0.001:30);
time_40=(0:0.001:40);
time_50=(0:0.001:50);
time_60=(0:0.001:60);


  
Joints_m10=interp1(out_rnd_m10.tout, out_rnd_m10.(index), time_10);
Joints_t10=interp1(out_rnd_t10.tout, out_rnd_t10.(index), time_10);
Joints_m10b=interp1(out_rnd_m10b.tout, out_rnd_m10b.(index), time_10);


Joints_m18=interp1(out_rnd_m18.tout, out_rnd_m18.(index), time_18);
Joints_t18=interp1(out_rnd_t18.tout, out_rnd_t18.(index), time_18);
Joints_m18b=interp1(out_rnd_m18b.tout, out_rnd_m18b.(index), time_18);

Joints_m20=interp1(out_rnd_m20.tout, out_rnd_m20.(index), time_20);
Joints_t20=interp1(out_rnd_t20.tout, out_rnd_t20.(index), time_20);
Joints_m20b=interp1(out_rnd_m20b.tout, out_rnd_m20b.(index), time_20);

Joints_m22=interp1(out_rnd_m22.tout, out_rnd_m22.(index), time_22);
Joints_t22=interp1(out_rnd_t22.tout, out_rnd_t22.(index), time_22);
Joints_m22b=interp1(out_rnd_m22b.tout, out_rnd_m22b.(index), time_22);

Joints_m25=interp1(out_rnd_m25.tout, out_rnd_m25.(index), time_25);
Joints_t25=interp1(out_rnd_t25.tout, out_rnd_t25.(index), time_25);
Joints_m25b=interp1(out_rnd_m25b.tout, out_rnd_m25b.(index), time_25);

Joints_m30=interp1(out_rnd_m30.tout, out_rnd_m30.(index), time_30);
Joints_t30=interp1(out_rnd_t30.tout, out_rnd_t30.(index), time_30);
Joints_m30b=interp1(out_rnd_m30b.tout, out_rnd_m30b.(index), time_30);

Joints_m40=interp1(out_rnd_m40.tout, out_rnd_m40.(index), time_40);
Joints_t40=interp1(out_rnd_t40.tout, out_rnd_t40.(index), time_40);
Joints_m40b=interp1(out_rnd_m40b.tout, out_rnd_m40b.(index), time_40);

Joints_m50=interp1(out_rnd_m50.tout, out_rnd_m50.(index), time_50);
Joints_t50=interp1(out_rnd_t50.tout, out_rnd_t50.(index), time_50);
Joints_m50b=interp1(out_rnd_m50b.tout, out_rnd_m50b.(index), time_50);

Joints_m60=interp1(out_rnd_m60.tout, out_rnd_m60.(index), time_60);
Joints_t60=interp1(out_rnd_t60.tout, out_rnd_t60.(index), time_60);
Joints_m60b=interp1(out_rnd_m60b.tout, out_rnd_m60b.(index), time_60);




% Distance between paths
d_10=path_distance_joints(Joints_t10, Joints_m10);
d_18=path_distance_joints(Joints_t18, Joints_m18);
d_20=path_distance_joints(Joints_t20, Joints_m20);
d_22=path_distance_joints(Joints_t22, Joints_m22);
d_25=path_distance_joints(Joints_t25, Joints_m25);
d_30=path_distance_joints(Joints_t30, Joints_m30);
d_40=path_distance_joints(Joints_t40, Joints_m40);
d_50=path_distance_joints(Joints_t50, Joints_m50);
d_60=path_distance_joints(Joints_t60, Joints_m60);

d_10b=path_distance_joints(Joints_t10, Joints_m10b);
d_20b=path_distance_joints(Joints_t20, Joints_m20b);
d_30b=path_distance_joints(Joints_t30, Joints_m30b);
d_40b=path_distance_joints(Joints_t40, Joints_m40b);
d_50b=path_distance_joints(Joints_t50, Joints_m50b);
d_60b=path_distance_joints(Joints_t60, Joints_m60b);

d_25b=path_distance_joints(Joints_t25, Joints_m25b);
d_22b=path_distance_joints(Joints_t22, Joints_m22b);
d_18b=path_distance_joints(Joints_t18, Joints_m18b);

%% Compute Standard deviation

std_10=std(d_10);
%std_14=std(d_14);
std_18=std(d_18);
std_20=std(d_20);
std_22=std(d_22);
std_25=std(d_25);
std_30=std(d_30);
std_40=std(d_40);
std_50=std(d_50);
std_60=std(d_60);



std_10b=std(d_10b);
std_18b=std(d_18b);
std_20b=std(d_20b);
std_22b=std(d_22b);
std_25b=std(d_25b);
std_30b=std(d_30b);
std_40b=std(d_40b);
std_50b=std(d_50b);
std_60b=std(d_60b);

stdVec_noGAS=[std_10b;std_18b;std_20b;std_22b;std_25b;std_30b;std_40b;std_50b;std_60b ];
stdVec_GAS=[std_10;std_18;std_20;std_22;std_25;std_30;std_40;std_50;std_60 ];

end