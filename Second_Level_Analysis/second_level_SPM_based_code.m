

%% SECOND-LEVEL MODEL SPECIFICATION
% This script applies to all experimental phases:
% conditioning, extinction, recall, and renewal.
%
% It specifies a second-level one-sample t-test in SPM12.
% For each phase, update:
%   1. The output directory
%   2. The participant folder names
%   3. The first-level results directory
%   4. The contrast image filename


% Add the participant folder names for the selected phase.
% Replace these examples with your own participant folder names.

clear
clc

subjects = {'sub-001', 'sub-002', 'sub-003'};

subj_num = length(subjects);

% Define a cell array to store the contrast files
scans = cell(subj_num, 1);

% Use a for loop to populate the cell array with contrast
% files for each subject.
for i = 1:subj_num
    scans{i} = fullfile( ...
        '/path/to/first_level/Extinction/', ...
        [subjects{i}], ...
        ['con_0033.nii']);
end

% Assign the scans to the SPM job structure
matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = scans;

% Code extracted from SPM for second-level analysis
matlabbatch{1}.spm.stats.factorial_design.cov = ...
    struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});

matlabbatch{1}.spm.stats.factorial_design.multi_cov = ...
    struct('files', {}, 'iCFI', {}, 'iCC', {});

matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};

matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run', matlabbatch);
