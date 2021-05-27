setDataRoot

load([data_root filesep 'fixedModel' filesep 'out_random.mat']);

load([data_root filesep 'fixedModel' filesep 'out_rnd_m10.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t10.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m14.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t14.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m18.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t18.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m20.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t22.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m25.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t20.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m22.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t25.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m30.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t30.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m40.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t40.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m50.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t50.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m60.mat']);
% load([data_root filesep 'fixedModel' filesep 'out_rnd_t60.mat']);

load([data_root filesep 'fixedModel' filesep 'out_rnd_m60b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m50b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m40b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m30b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m20b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m10b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m15b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m18b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m25b.mat']);
load([data_root filesep 'fixedModel' filesep 'out_rnd_m22b.mat']);

% load out_random.mat
% 
% load out_rnd_m10.mat
% load out_rnd_t10.mat
% load out_rnd_m14.mat
% load out_rnd_t14.mat
% load out_rnd_m18.mat
% load out_rnd_t18.mat
% load out_rnd_m20.mat
% load out_rnd_t22.mat
% load out_rnd_m25.mat
% load out_rnd_t20.mat
% load out_rnd_m22.mat
% load out_rnd_t25.mat
% load out_rnd_m30.mat
% load out_rnd_t30.mat
% load out_rnd_m40.mat
% load out_rnd_t40.mat
% load out_rnd_m50.mat
% load out_rnd_t50.mat
% load out_rnd_m60.mat
% load out_rnd_t60.mat
% 
% load out_rnd_m60b.mat
% load out_rnd_m50b.mat
% load out_rnd_m40b.mat
% load out_rnd_m30b.mat
% load out_rnd_m20b.mat
% load out_rnd_m10b.mat
% load out_rnd_m15b.mat
% load out_rnd_m18b.mat
% load out_rnd_m25b.mat
% load out_rnd_m22b.mat

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

% Ball
EEF_m10=interp1(out_rnd_m10.tout, out_rnd_m10.Ball_left, time_10);
% EEF_t10=interp1(out_rnd_t10.tout, out_rnd_t10.Ball_left, time_10);
EEF_m10b=interp1(out_rnd_m10b.tout, out_rnd_m10b.Ball_left, time_10);


EEF_m14=interp1(out_rnd_m14.tout, out_rnd_m14.Ball_left, time_14);
% EEF_t14=interp1(out_rnd_t14.tout, out_rnd_t14.Ball_left, time_14);
EEF_tm14b=interp1(out_rnd_m15b.tout, out_rnd_m15b.Ball_left, time_15);

EEF_m18=interp1(out_rnd_m18.tout, out_rnd_m18.Ball_left, time_18);
% EEF_t18=interp1(out_rnd_t18.tout, out_rnd_t18.Ball_left, time_18);
EEF_m18b=interp1(out_rnd_m18b.tout, out_rnd_m18b.Ball_left, time_18);

EEF_m20=interp1(out_rnd_m20.tout, out_rnd_m20.Ball_left, time_20);
% EEF_t20=interp1(out_rnd_t20.tout, out_rnd_t20.Ball_left, time_20);
EEF_m20b=interp1(out_rnd_m20b.tout, out_rnd_m20b.Ball_left, time_20);

EEF_m22=interp1(out_rnd_m22.tout, out_rnd_m22.Ball_left, time_22);
% EEF_t22=interp1(out_rnd_t22.tout, out_rnd_t22.Ball_left, time_22);
EEF_m22b=interp1(out_rnd_m22b.tout, out_rnd_m22b.Ball_left, time_22);

EEF_m25=interp1(out_rnd_m25.tout, out_rnd_m25.Ball_left, time_25);
% EEF_t25=interp1(out_rnd_t25.tout, out_rnd_t25.Ball_left, time_25);
EEF_m25b=interp1(out_rnd_m25b.tout, out_rnd_m25b.Ball_left, time_25);

EEF_m30=interp1(out_rnd_m30.tout, out_rnd_m30.Ball_left, time_30);
% EEF_t30=interp1(out_rnd_t30.tout, out_rnd_t30.Ball_left, time_30);
EEF_m30b=interp1(out_rnd_m30b.tout, out_rnd_m30b.Ball_left, time_30);

EEF_m40=interp1(out_rnd_m40.tout, out_rnd_m40.Ball_left, time_40);
% EEF_t40=interp1(out_rnd_t40.tout, out_rnd_t40.Ball_left, time_40);
EEF_m40b=interp1(out_rnd_m40b.tout, out_rnd_m40b.Ball_left, time_40);

EEF_m50=interp1(out_rnd_m50.tout, out_rnd_m50.Ball_left, time_50);
% EEF_t50=interp1(out_rnd_t50.tout, out_rnd_t50.Ball_left, time_50);
EEF_m50b=interp1(out_rnd_m50b.tout, out_rnd_m50b.Ball_left, time_50);

EEF_m60=interp1(out_rnd_m60.tout, out_rnd_m60.Ball_left, time_60);
% EEF_t60=interp1(out_rnd_t60.tout, out_rnd_t60.Ball_left, time_60);
EEF_m60b=interp1(out_rnd_m60b.tout, out_rnd_m60b.Ball_left, time_60);



%% Ankle 
% EEF_m10=interp1(out_rnd_m10.tout, out_rnd_m10.AnklePosL, time_10);
% EEF_t10=interp1(out_rnd_t10.tout, out_rnd_t10.AnklePosL, time_10);
% EEF_m10b=interp1(out_rnd_m10b.tout, out_rnd_m10b.AnklePosL, time_10);
% 
% 
% EEF_m14=interp1(out_rnd_m14.tout, out_rnd_m14.AnklePosL, time_14);
% EEF_t14=interp1(out_rnd_t14.tout, out_rnd_t14.AnklePosL, time_14);
% EEF_tm14b=interp1(out_rnd_m15b.tout, out_rnd_m15b.AnklePosL, time_15);
% 
% EEF_m18=interp1(out_rnd_m18.tout, out_rnd_m18.AnklePosL, time_18);
% EEF_t18=interp1(out_rnd_t18.tout, out_rnd_t18.AnklePosL, time_18);
% EEF_m18b=interp1(out_rnd_m18b.tout, out_rnd_m18b.AnklePosL, time_18);
% 
% EEF_m20=interp1(out_rnd_m20.tout, out_rnd_m20.AnklePosL, time_20);
% EEF_t20=interp1(out_rnd_t20.tout, out_rnd_t20.AnklePosL, time_20);
% EEF_m20b=interp1(out_rnd_m20b.tout, out_rnd_m20b.AnklePosL, time_20);
% 
% EEF_m22=interp1(out_rnd_m22.tout, out_rnd_m22.AnklePosL, time_22);
% EEF_t22=interp1(out_rnd_t22.tout, out_rnd_t22.AnklePosL, time_22);
% EEF_m22b=interp1(out_rnd_m22b.tout, out_rnd_m22b.AnklePosL, time_22);
% 
% EEF_m25=interp1(out_rnd_m25.tout, out_rnd_m25.AnklePosL, time_25);
% EEF_t25=interp1(out_rnd_t25.tout, out_rnd_t25.AnklePosL, time_25);
% EEF_m25b=interp1(out_rnd_m25b.tout, out_rnd_m25b.AnklePosL, time_25);
% 
% EEF_m30=interp1(out_rnd_m30.tout, out_rnd_m30.AnklePosL, time_30);
% EEF_t30=interp1(out_rnd_t30.tout, out_rnd_t30.AnklePosL, time_30);
% EEF_m30b=interp1(out_rnd_m30b.tout, out_rnd_m30b.AnklePosL, time_30);
% 
% EEF_m40=interp1(out_rnd_m40.tout, out_rnd_m40.AnklePosL, time_40);
% EEF_t40=interp1(out_rnd_t40.tout, out_rnd_t40.AnklePosL, time_40);
% EEF_m40b=interp1(out_rnd_m40b.tout, out_rnd_m40b.AnklePosL, time_40);
% 
% EEF_m50=interp1(out_rnd_m50.tout, out_rnd_m50.AnklePosL, time_50);
% EEF_t50=interp1(out_rnd_t50.tout, out_rnd_t50.AnklePosL, time_50);
% EEF_m50b=interp1(out_rnd_m50b.tout, out_rnd_m50b.AnklePosL, time_50);
% 
% EEF_m60=interp1(out_rnd_m60.tout, out_rnd_m60.AnklePosL, time_60);
% EEF_t60=interp1(out_rnd_t60.tout, out_rnd_t60.AnklePosL, time_60);
% EEF_m60b=interp1(out_rnd_m60b.tout, out_rnd_m60b.AnklePosL, time_60);



% Distance between paths
d_10=path_distance(EEF_t10, EEF_m10);
d_14=path_distance(EEF_t14, EEF_m14);
d_18=path_distance(EEF_t18, EEF_m18);
d_20=path_distance(EEF_t20, EEF_m20);
d_22=path_distance(EEF_t22, EEF_m22);
d_25=path_distance(EEF_t25, EEF_m25);
d_30=path_distance(EEF_t30, EEF_m30);
d_40=path_distance(EEF_t40, EEF_m40);
d_50=path_distance(EEF_t50, EEF_m50);
d_60=path_distance(EEF_t60, EEF_m60);

d_10b=path_distance(EEF_t10, EEF_m10b);
d_20b=path_distance(EEF_t20, EEF_m20b);
d_30b=path_distance(EEF_t30, EEF_m30b);
d_40b=path_distance(EEF_t40, EEF_m40b);
d_50b=path_distance(EEF_t50, EEF_m50b);
d_60b=path_distance(EEF_t60, EEF_m60b);

d_25b=path_distance(EEF_t25, EEF_m25b);
d_22b=path_distance(EEF_t22, EEF_m22b);
d_18b=path_distance(EEF_t18, EEF_m18b);

%% Compute Standard deviation

std_10=std(d_10);
std_14=std(d_14);
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


std_vecb=[std_10b,std_18b, std_20b,std_22b std_25b, std_30b, std_40b,std_50b, std_60];
std_vec=[std_10,std_14, std_20, std_22, std_25, std_30, std_40,std_50, std_60];
time_vec=[0.1,0.14, 0.2, 0.22,0.25, 0.3, 0.4, 0.5, 0.6];
time_vecb=[0.1,0.18, 0.2,0.22,0.25, 0.3, 0.4, 0.5, 0.6];
%figure;
hold on
plot(time_vec, std_vec, 'linewidth',2)
plot(time_vecb, std_vecb, 'linewidth',2)

xlabel('movement times')
ylabel(' std in m')
legend('Ball without GAS', ' Ball with GAS' )
%% Compute Correlation
%R = corrcoef(EEF_muscle,EEF_torque);
