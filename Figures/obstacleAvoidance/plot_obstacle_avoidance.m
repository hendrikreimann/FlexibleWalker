%% Colorcode


color_hip_p=[1 0 0];
color_hip_r=[0.3010, 0.7450, 0.9330];
color_knee=[0, 0.5, 0];
color_ankle=[0.8500 0.3250 0.0980];
colorvec={color_hip_p,color_hip_r, color_knee, color_ankle};

%% Plotting options
width=3;

sagittal=1;
lateral=1;


if sagittal==1
    
    figure;
    
    load out_normal.mat
    load out_sagittal_15.mat
    load out_sagittal_20.mat
    load out_sagittal_25.mat
    
    
     time=(12:0.001:16);
     

      sagittal_15=interp1(out_sagittal_15.tout, out_sagittal_15.Ball_right(:,2), time);
      sagittal_20=interp1(out_sagittal_20.tout, out_sagittal_20.Ball_right(:,2), time);
      sagittal_25=interp1(out_sagittal_25.tout, out_sagittal_25.Ball_right(:,2), time);
      sagittal_00=interp1(out_normal.tout, out_normal.Ball_right(:,2), time);
      
      sagittal_15=sagittal_15-sagittal_00;
      sagittal_20=sagittal_20-sagittal_00;
      sagittal_25=sagittal_25-sagittal_00;
      sagittal_00=sagittal_00-sagittal_00;
      
      


     plot(time, sagittal_15,...
          time, sagittal_20,...
          time, sagittal_25,...
          'linewidth', width...
         )
    title('Right Ball')
    xlabel('time in s')
    ylabel('height of ball relative to basis step in m')
    ylim([-0.05 0.2])
    xlim([13.75 14.74])
    legend('Avoid small', 'Avoid mid', 'Avoid large')
  
    
end



if lateral==1
    
    figure;
    
    load out_lateral_05.mat
    load out_lateral_10.mat
    load out_lateral_15.mat
    load out_lateral_20.mat
    load out_lateral_00.mat 
    load out_lateral_m05.mat
    load out_lateral_m10.mat
    load out_lateral_m15.mat
    load out_lateral_m20.mat
    
   time=(13:0.001:15);

   p05=interp1(out_lateral_05.tout, out_lateral_05.AnklePosR_body, time);
   p10=interp1(out_lateral_10.tout, out_lateral_10.AnklePosR_body, time);
   p15=interp1(out_lateral_15.tout, out_lateral_15.AnklePosR_body, time);
   m05=interp1(out_lateral_m05.tout, out_lateral_m05.AnklePosR_body, time);
   m10=interp1(out_lateral_m10.tout, out_lateral_m10.AnklePosR_body, time);
   m15=interp1(out_lateral_m15.tout, out_lateral_m15.AnklePosR_body, time);
   m0=interp1(out_lateral_00.tout, out_lateral_00.AnklePosR_body, time);
   
   
   p05=p05(:,3)-m0(:,3);
   p10=p10(:,3)-m0(:,3);
   p15=p15(:,3)-m0(:,3);
   m05=m05(:,3)-m0(:,3);
   m10=m10(:,3)-m0(:,3);
   m15=m15(:,3)-m0(:,3);
   p0=m0(:,3)-m0(:,3);
     
     



      
 plot( time, p10,...
       time, p15,...
       time,m10,...
       time, m15,'linewidth', width...
     );
 legend('Avoid small (r)', 'Avoid large (r)', 'Avoid small (l)', 'Avoid Large (l)')
 xlabel('time in s')
 ylabel('z position of ankle relative to basis step in m')
 xlim([13.3 14.74])


end