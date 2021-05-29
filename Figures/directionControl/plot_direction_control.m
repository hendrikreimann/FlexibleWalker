    load out_m15b.mat
    load out_m30b.mat
    load out_m45b.mat
    load out_p15b.mat
    load out_p30c.mat
    load out_p45c.mat
    load out_0b.mat
   
    figure;
    hold on 
    axis equal
    plot(out_m15b.xyzHAT(:,1), out_m15b.xyzHAT(:,3), 'linewidth', 2)
    plot(out_m30b.xyzHAT(:,1), out_m30b.xyzHAT(:,3), 'linewidth', 2)
    plot(out_m45b.xyzHAT(:,1), out_m45b.xyzHAT(:,3), 'linewidth', 2)
    plot(out_p15b.xyzHAT(:,1), out_p15b.xyzHAT(:,3), 'linewidth', 2)
    plot(out_p30c.xyzHAT(:,1), out_p30c.xyzHAT(:,3), 'linewidth', 2)
    plot(out_p45c.xyzHAT(:,1), out_p45c.xyzHAT(:,3), 'linewidth', 2)
    plot(out_0b.xyzHAT(:,1), out_0b.xyzHAT(:,3), 'linewidth', 2)
    plot([-5  95], [-31 69], ':k')
    plot([0  100], [35 -65], ':k')
    plot([0  100], [-23 35], ':k')
    plot([0  100], [37 -21], ':k')
    plot([0  100], [0 20], ':k')
    plot([0  100], [17 -10], ':k')
    plot([0  100], [0 0], ':k')
    
    xlim([0 100])
    ylim([-70 70])
    xlabel('x in m')
    ylabel('z in m')
    legend('-15 deg', '-30 deg', '-45 deg', '15 deg', '30 deg', '45 deg', '0 deg', 'target angles')