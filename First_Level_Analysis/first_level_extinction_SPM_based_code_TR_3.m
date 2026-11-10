%% FIRST_LEVEL_HTE_EXTINCTION_TR_3

%Replace the example subject and paths before running.
% SPM12 first-level model specification.

subjects={'sub-EXAMPLE'};

raw_data_folder = 'path_to_extinction_first_level/';
for i=1:numel(subjects)
    subj_folder = ['path_to_extinction_first_level/' subjects{i}];
    mkdir(subj_folder)
    raw_file = fullfile(raw_data_folder, subjects{i}, [subjects{i} '_task-ext_space-MNI152NLin2009cAsym_res-2_desc-preproc_bold.nii']);

    %% Read extinction events
    data_all = {};
    file_name = sprintf('%s_task-ext_events.tsv', subjects{i});
    file_path = fullfile('path_to_extinction_events', file_name);
    data_all{i} = readtable(file_path, 'Delimiter', '\t', 'FileType', 'text');

%% creating vector includes context onsets
trial_names_context = data_all{i}.trial_type;
trial_nums = 1:numel(trial_names_context);
onset_values_context = cell(size(trial_nums));
for t = 1:numel(trial_names_context)
    if strcmp(trial_names_context{t}, 'context')
        onset_values_context{trial_nums(t)} = data_all{i}.onset(t);
    else
        onset_values_context{trial_nums(t)} = [];
    end
end
onset_values_context = onset_values_context(~cellfun('isempty', onset_values_context));
onset_values_context = cell2mat(onset_values_context);
save(fullfile(subj_folder, 'onset_values_context.mat'), 'onset_values_context');

%% creating vector includes CSpE onsets
trial_names_CSpE = data_all{i}.trial_type;
trial_nums = 1:numel(trial_names_CSpE);
onset_values_CSpE = cell(size(trial_nums));
for t = 1:numel(trial_names_CSpE)
    if strcmp(trial_names_CSpE{t}, 'CSpE')
        onset_values_CSpE{trial_nums(t)} = data_all{i}.onset(t);
    else
        onset_values_CSpE{trial_nums(t)} = [];
    end
end
onset_values_CSpE = onset_values_CSpE(~cellfun('isempty', onset_values_CSpE));
onset_values_CSpE = cell2mat(onset_values_CSpE);
save(fullfile(subj_folder, 'onset_values_CSpE.mat'), 'onset_values_CSpE');

%% creating vector includes CSmE onsets
trial_names_CSmE = data_all{i}.trial_type;
trial_nums = 1:numel(trial_names_CSmE);
onset_values_CSmE = cell(size(trial_nums));
for t = 1:numel(trial_names_CSmE)
    if strcmp(trial_names_CSmE{t}, 'CSmE')
        onset_values_CSmE{trial_nums(t)} = data_all{i}.onset(t);
    else
        onset_values_CSmE{trial_nums(t)} = [];
    end
end
onset_values_CSmE = onset_values_CSmE(~cellfun('isempty', onset_values_CSmE));
onset_values_CSmE = cell2mat(onset_values_CSmE);
save(fullfile(subj_folder, 'onset_values_CSmE.mat'), 'onset_values_CSmE');

    vol_num = 268; %% please add the appropriate number 268 for TR = 3 and xxx for TR = 2.56
    scans = {};
    for ivol = 1:vol_num
        scans{ivol,1} = [raw_file ',' num2str(ivol)];
    end

scans = cellstr(scans);
matlabbatch{1}.spm.stats.fmri_spec.dir = {subj_folder};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 3;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess.scans = scans;
%% setting the conditions: context
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).name = 'context';
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).onset = onset_values_context;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).duration = 3;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).orth = 1;
%% setting the conditions: CSp
    for p=2:17
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).name = ['CSp' num2str(p-1)];
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).onset = onset_values_CSpE(p-1);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).duration = 6;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).orth = 1;
    end
%% setting the conditions: CSm
    for p=18:33
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).name = ['CSm' num2str(p-17)];
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).onset = onset_values_CSmE(p-17);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).duration = 6;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).orth = 1;
    end

matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {['path_to_extinction_confounds/' subjects{i} '_task-ext_desc-confounds_timeseries_task_ext_six_file.txt']};
matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

spm_jobman ('run', matlabbatch);

end
