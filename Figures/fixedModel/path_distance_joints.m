function d=path_distance_joints(EEF_t, EEF_m)
d=zeros(size(EEF_m));

    for i=1:min(size(EEF_m))

        d(:,i)=EEF_m(:,i)-EEF_t(:,i);
    end
     
end