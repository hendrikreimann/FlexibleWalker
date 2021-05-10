% 
% nms3D_mInit.m  - Initialize Neuromuscular Model Mechanical Parameters
%
% H.Geyer
% Feb 2018
%

% initialize mech parameter structure
mParams = [];


% *************** %
% 1. SEGMENTATION %
% *************** %

% General abbreviations:
% l: length of segment
% b: breadth from side to side when standing upright
% d: depth from back to front when standing upright



% ---------------
% 1.1 Trunk (TRK)
% ---------------

% length, breadth and depth
mParams.bodies.trunk.l = 0.8; %[m]
mParams.bodies.trunk.b = 0.2; %[m]
mParams.bodies.trunk.d = 0.2; %[m]

% center of gravity (CG) location relative to geometric center (midline)
mParams.bodies.trunk.CG = [0 -0.05 0]; %[m]

% distance vector from CG to right and left hips
mParams.bodies.trunk.CG_RH = [ 0 -0.35  mParams.bodies.trunk.b/2]; %[m]
mParams.bodies.trunk.CG_LH = [ 0 -0.35 -mParams.bodies.trunk.b/2]; %[m]

% mass
mParams.bodies.trunk.m = 53.5; %[kg]

% inertia (roll yaw pitch)
mParams.bodies.trunk.In = [4 1 2.5]; %[kg*m^2] 



% ------------------
% 1.2 Hip Joints (H)
% ------------------

% soft stop engagement thresholds (mechanical limits)
mParams.joints.hip.MaxPitch = 230*pi/180; %[rad]
mParams.joints.hip.MinPitch =  25*pi/180; %[rad]
mParams.joints.hip.MaxRoll  =  50*pi/180; %[rad]
mParams.joints.hip.MinRoll  = -15*pi/180; %[rad]

% soft stop joint stiffness and max relaxation speed
mParams.joints.hip.kStop    = 0.3 / (pi/180);  %[Nm/rad]
mParams.joints.hip.wMaxStop = 1 *pi/180; %[rad/s]

mParams.bodies.foot.AnkleHeight=0.08;

% -------------
% 1.3 Thigh (T)
% -------------

% length, breadth and depth
mParams.bodies.thigh.l = 0.5-mParams.bodies.foot.AnkleHeight/2; %[m]
mParams.bodies.thigh.b = 0.10; %[m]
mParams.bodies.thigh.d = 0.10; %[m]

% center of gravity (CG) location relative to geometric center (midline)
mParams.bodies.thigh.CG = [0 (0.05+mParams.bodies.foot.AnkleHeight/4) 0]; %[m] 

% location of pressure sheet as measured from hip
mParams.bodies.thigh.dPress = 0.1; %[m]

% positiom of pressure sheet measured from knee in %
mParams.bodies.thigh.ThPos=0.8;
% thigh mass
mParams.bodies.thigh.m  = 8.5; %[kg]

% thigh inertia
mParams.bodies.thigh.In = [0.15 0.03 0.15]; %[kg*m^2]

% for better understanding, parameters of high and low thigh are defined
% here

mParams.bodies.thighLow.CG =[0 0.04 0];
mParams.bodies.thighLow.In = [0.0768 0.024 0.0768];
mParams.bodies.thighLow.m = 6.8;
mParams.bodies.thighLow.l = 0.368;


mParams.bodies.thighHigh.CG = [0 0.01 0];
mParams.bodies.thighHigh.In = [0.0012 0.006 0.0012];
mParams.bodies.thighHigh.m = 1.7;
mParams.bodies.thighHigh.l =0.092;

% thigh segment pressure sheet
% ----------------------------

% reference compression corresponding to steady-state with HAT mass
mParams.bodies.thigh.DeltaThRef = 5e-3; %[m]

% interaction stiffness
mParams.bodies.thigh.k_pressure = mParams.bodies.trunk.m * 9.81 / mParams.bodies.thigh.DeltaThRef; %[N/m]

% max relaxation speed (one side)
mParams.bodies.thigh.v_max_pressure = 0.5; %[m/s]



% ------------------
% 1.4 Knee Joint (K)
% ------------------

% soft stop engagement thresholds (mechanical limits)
mParams.joints.knee.MaxPitch = 175*pi/180; %[rad]
mParams.joints.knee.MinPitch =  25*pi/180; %[rad]

% soft stop joint stiffness and max relaxation speed
mParams.joints.knee.kStop = 0.3 / (pi/180);  %[Nm/rad]
mParams.joints.knee.wMaxStop = 1 *pi/180; %[rad/s]



% -------------
% 1.5 Shank (S)
% -------------

% length, breadth and depth
mParams.bodies.shank.l = 0.5-mParams.bodies.foot.AnkleHeight/2; %[m]
mParams.bodies.shank.b = 0.05; %[m]
mParams.bodies.shank.d = 0.05; %[m]

% center of gravity (CG) location relative to geometric center (midline)
%mParams.bodies.shank.CG = [0 0.05-mParams.bodies.foot.AnkleHeight/4 0]; %[m] 
mParams.bodies.shank.CG = [0 0.05 0];
% shank mass
mParams.bodies.shank.m  = 3.5; %[kg]

% shank inertia
mParams.bodies.shank.In = [0.05 0.003 0.05]; %[kg*m^2]



% -------------------
% 1.6 Ankle Joint (A)
% -------------------

% soft stop engagement thresholds (mechanical limits)
mParams.joints.ankle.MaxPitch = 130*pi/180; %[rad]
mParams.joints.ankle.MinPitch =  70*pi/180; %[rad]

% soft stop joint stiffness and max relaxation speed
mParams.joints.ankle.kStop = 0.3 / (pi/180);  %[Nm/rad]
mParams.joints.ankle.wMaxStop = 1 *pi/180; %[rad/s]



% ------------
% 1.7 Foot (F)
% ------------

% length, breadth and depth
mParams.bodies.foot.l = 0.2; %[m]
mParams.bodies.foot.b = 0.03; %[m]
mParams.bodies.foot.d = 0.03; %[m]

% center of gravity (CG) location relative to geometric center (midline)
%mParams.bodies.foot.CG = [-0.055 -0.04 0]; %[m] 
mParams.bodies.foot.CG = [-0.04 0.055 0]; %[m] 
% distance from ankle joint to geometric midline (ankle height added)
mParams.bodies.foot.AnkleToMid = [0.065 0.06 0.0]; %[m]  ORIGINAL
%mParams.bodies.foot.AnkleToMid =[0.06 0.065 0];
% foot mass
mParams.bodies.foot.m  = 1.25; %[kg]
mParams.bodies.foot.compensation=mParams.bodies.foot.d/2;
% foot inertia
mParams.bodies.foot.In = [0.0007 0.005 0.005]; %[kg*m^2]

% Width of the Ball
mParams.bodies.foot.BallWidth=0.1;

% Width of the Heel
mParams.bodies.foot.HeelWidth=0.05;

         
% *************************** %
% 2. Ground Interaction Model %
% *************************** %


% Vertical component
% ------------------

% vertical ground interaction stiffness
mParams.Contacts.k_gn = 60*9.81/0.01; %[N/m]
%mParams.Contacts.k_gn = 39240; %[N/m]
% vertical max relaxation speed
mParams.Contacts.v_gn_max = 0.03; %[m/s]


% Horizontal component
% --------------------

% horizontal ground interaction stiffness
mParams.Contacts.k_gt = 60*9.81/0.1; %[N/m]
%mParams.Contacts.k_gt = 3924;
% horizontal max relaxation speed
mParams.Contacts.v_gt_max = 0.03; %[m/s]

% sliding friction coefficient
mParams.Contacts.mu_slide = 0.8;

% stiction coefficient
mParams.Contacts.mu_stick = 0.8;

% sliding to stiction limit velocity
mParams.Contacts.vLimit = 0.01; %[m/s]



mParams.Contacts.stiffness=58860;
mParams.Contacts.damping=mParams.Contacts.k_gn*mParams.Contacts.v_gn_max;
mParams.Contacts.depths = 1e-4;
mParams.Contacts.mu_s =0.9;%mParams.Contacts.mu_stick;
mParams.Contacts.mu_k =0.8;%mParams.Contacts.mu_slide;
mParams.Contacts.size=1e-5;












