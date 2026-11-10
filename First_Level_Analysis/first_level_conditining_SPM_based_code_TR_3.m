
% First-level SPM12 model specification for fear conditioning (TR = 3 s).
% Set subjects and the three directory paths before use.

subjects={'sub-EXAMPLE'}; % Placeholder only; replace with your own subject list.

subj_num = length(subjects);

raw_data_folder ='/path/to/conditioning_first_level/';
for i=1:subj_num
    subj_folder =['/path/to/conditioning_first_level/' subjects{i}];
    mkdir(subj_folder)
    raw_file = fullfile(raw_data_folder, subjects{i}, [subjects{i} '_task-cond_space-MNI152NLin2009cAsym_res-2_desc-preproc_bold.nii']);

    %% Add onset vectors
    data_all = {};
    file_name = sprintf('%s_task-cond_events.tsv', subjects{i});
    file_path = fullfile('/path/to/events', file_name);
    data_all{i} = readtable(file_path, 'Delimiter', '\t', 'FileType', 'text');

    %% Creating vector including context onsets
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

    %% Creating vector including CSp onsets
    trial_names_CSp = data_all{i}.trial_type;
    trial_nums = 1:numel(trial_names_CSp);
    onset_values_CSp = cell(size(trial_nums));
    for t = 1:numel(trial_names_CSp)
        if strcmp(trial_names_CSp{t}, 'CSp')
            onset_values_CSp{trial_nums(t)} = data_all{i}.onset(t);
        else
            onset_values_CSp{trial_nums(t)} = [];
        end
    end
    onset_values_CSp = onset_values_CSp(~cellfun('isempty', onset_values_CSp));
    onset_values_CSp = cell2mat(onset_values_CSp);
    save(fullfile(subj_folder, 'onset_values_CSp.mat'), 'onset_values_CSp');

    %% Creating vector including CSm onsets
    trial_names_CSm = data_all{i}.trial_type;
    trial_nums = 1:numel(trial_names_CSm);
    onset_values_CSm = cell(size(trial_nums));
    for t = 1:numel(trial_names_CSm)
        if strcmp(trial_names_CSm{t}, 'CSm')
            onset_values_CSm{trial_nums(t)} = data_all{i}.onset(t);
        else
            onset_values_CSm{trial_nums(t)} = [];
        end
    end
    onset_values_CSm = onset_values_CSm(~cellfun('isempty', onset_values_CSm));
    onset_values_CSm = cell2mat(onset_values_CSm);
    save(fullfile(subj_folder, 'onset_values_CSm.mat'), 'onset_values_CSm');

    %% Creating vector including shock onsets
    trial_names_shock = data_all{i}.trial_type;
    trial_nums = 1:numel(trial_names_shock);
    onset_values_shock = cell(size(trial_nums));
    for t = 1:numel(trial_names_shock)
        if strcmp(trial_names_shock{t}, 'shock')
            onset_values_shock{trial_nums(t)} = data_all{i}.onset(t);
        else
            onset_values_shock{trial_nums(t)} = [];
        end
    end
    onset_values_shock = onset_values_shock(~cellfun('isempty', onset_values_shock));
    onset_values_shock = cell2mat(onset_values_shock);
    save(fullfile(subj_folder, 'onset_values_shock.mat'), 'onset_values_shock');

    %% Scan list
    vol_num = 268;
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

    %% Setting the conditions: context
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).name = 'context';
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).onset = onset_values_context;
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).duration = 3;
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).tmod = 0;
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).orth = 1;

    %% Setting the conditions: CSp
    for p=2:17
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).name = ['CSp' num2str(p-1)];
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).onset = onset_values_CSp(p-1);
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).duration = 6;
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).tmod = 0;
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).orth = 1;
    end

    %% Setting the conditions: CSm
    for p=18:33
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).name = ['CSm' num2str(p-17)];
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).onset = onset_values_CSm(p-17);
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).duration = 6;
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).tmod = 0;
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).orth = 1;
    end

    %% Setting the conditions: shock
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(34).name = 'shock';
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(34).onset = onset_values_shock;
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(34).duration = 0.5;
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(34).tmod = 0;
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(34).pmod = struct('name', {}, 'param', {}, 'poly', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond(34).orth = 1;

    matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
    matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {['/path/to/confounds/' subjects{i} '_task-cond_desc-confounds_timeseries_task_cond_six_file.txt']};
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
