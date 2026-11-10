% FIRST-LEVEL MODEL ESTIMATION

% SPM12 classical estimation of each participant's first-level SPM.mat.
% Replace the example subject ID and base directory with local values.

subjects={'sub-EXAMPLE'};
   
for i = 1:numel(subjects)
sdir = ['path_to_first_level_learning_phase/' subjects{i}]
spmfile = fullfile(sdir, 'SPM.mat');
    estbatch{1}.spm.stats.fmri_est.spmmat = {spmfile};
    estbatch{1}.spm.stats.fmri_est.write_residuals = 0;
    estbatch{1}.spm.stats.fmri_est.method.Classical = 1;
    spm('defaults','fmri');
    spm_jobman('initcfg');
    spm_jobman('run', estbatch);
end
