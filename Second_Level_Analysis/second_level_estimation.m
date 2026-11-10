%% SECOND_LEVEL_ESTIMATION

% Second-level model estimation using SPM12.


clear;
clc;

%% 1. USER INPUT: Specify the second-level analysis directory

% Replace this example path with your own directory.
second_level_dir = '/path/to/second_level_conditioning';

%% 2. Initialize SPM12

spm('defaults', 'fmri');
spm_jobman('initcfg');

%% 3. Find second-level task folders

folders = dir(fullfile(second_level_dir, 'second_level_task_*'));

% Keep directories only.
folders = folders([folders.isdir]);

if isempty(folders)
    error('No second-level task folders were found.');
end

fprintf('Found %d second-level task folders.\n', ...
        numel(folders));

%% 4. Estimate each second-level model

for i = 1:numel(folders)

    % Current analysis directory
    sdir = fullfile(second_level_dir, folders(i).name);

    % Locate the SPM.mat file
    spmfile = fullfile(sdir, 'SPM.mat');

    % Skip folders without SPM.mat
    if ~exist(spmfile, 'file')
        fprintf('Skipping %s: SPM.mat not found.\n', ...
                folders(i).name);
        continue;
    end

    fprintf('Estimating model: %s\n', folders(i).name);

    % Clear the previous batch
    clear estbatch;

    % Specify SPM.mat
    estbatch{1}.spm.stats.fmri_est.spmmat = {spmfile};

    % Do not write residual images
    estbatch{1}.spm.stats.fmri_est.write_residuals = 0;

    % Classical model estimation
    estbatch{1}.spm.stats.fmri_est.method.Classical = 1;

    % Run estimation
    spm_jobman('run', estbatch);

end

fprintf('Second-level task estimation completed.\n');
