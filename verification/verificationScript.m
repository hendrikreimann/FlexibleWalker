
set_parameters      = 1;
simulate_model      = 1;
compare_results     = 1;

if set_parameters
    nms3D_prep;
    t=20;
end

if simulate_model
    % turn off warning about visualization
    warnStruct = warning('off', 'Simulink:Engine:UINotUpdatedDuringRapidAccelSim');
    warning(warnStruct);
    
    tic
    this_output = sim('nmsRR' ,'SimulationMode','rapid');
    t_total = toc;
end

if compare_results
    loaded_data = load('referenceOutput.mat');
    reference_output = loaded_data.this_output;
    
    figure; axes; title('left leg joint angles'); hold on
    plot(reference_output.tout, reference_output.Llegq, 'linewidth', 8);
    plot(this_output.tout, this_output.Llegq, 'linewidth', 3);
    legend ...
      ( ...
        { ...
          'hip roll reference', 'hip pitch reference', 'knee reference', 'ankle reference', ...
          'hip roll now', 'hip pitch now', 'knee now', 'ankle now' ...
        } ...
      )

end


