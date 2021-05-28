function d=path_distance(EEF_t, EEF_m)



d=sqrt((EEF_m(:,1)-EEF_t(:,1)).^2+...
       (EEF_m(:,2)-EEF_t(:,2)).^2+...
       (EEF_m(:,3)-EEF_t(:,3)).^2);
end