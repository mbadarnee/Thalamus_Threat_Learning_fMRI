%% FIRST_LEVEL_RECALL_TR_2.56

subjects={'sub-EXAMPLE'}; % Replace with local participant IDs

% Configure local data paths before running.

subj_num=numel(subjects);
raw_data_folder ='path_to_recall_first_level/';

for i=1:subj_num
    subj_folder =['path_to_recall_first_level/' subjects{i}];
    mkdir(subj_folder)
    raw_file = fullfile(raw_data_folder, subjects{i}, [subjects{i} '_task-recall_space-MNI152NLin2009cAsym_res-2_desc-preproc_bold.nii']);                  
    
    %% **add onsets vectors 
    %% correct table read 
data_all = {};
%data_all = cell(length(subjects), 1); % Pre-allocate a cell array to
%store
%the data 
%for j = 1:length(subjects) **I made this line off**
    file_name = sprintf('%s_task-recall_events.tsv', subjects{i});
    file_path = fullfile('path_to_recall_events', file_name);
    data_all{i} = readtable(file_path, 'Delimiter', '\t', 'FileType', 'text');
%% end correct table read 

%% creating vector includes context onsets 

trial_names_context = data_all{i}.trial_type;
trial_nums = 1:numel(trial_names_context);
onset_values_context = cell(size(trial_nums)); % create cell array to store onset times for each trial
for t = 1:numel(trial_names_context)
    if strcmp(trial_names_context{t}, 'context')
        onset_values_context{trial_nums(t)} = data_all{i}.onset(t); % save onset time in cell array if trial name is 'context'
    else
        onset_values_context{trial_nums(t)} = []; % create empty entry in cell array if trial name is not 'context'
    end
end
onset_values_context = onset_values_context(~cellfun('isempty', onset_values_context)); % remove empty elements
onset_values_context = cell2mat(onset_values_context);%% vector 
save(fullfile(subj_folder, 'onset_values_context.mat'), 'onset_values_context');

%% End the code for creating context onsets

%% creating vector includes CSpE onsets 

trial_names_CSpE = data_all{i}.trial_type;
trial_nums = 1:numel(trial_names_CSpE);
onset_values_CSpE = cell(size(trial_nums)); % create cell array to store onset times for each trial
for t = 1:numel(trial_names_CSpE)
    if strcmp(trial_names_CSpE{t}, 'CSpE')
        onset_values_CSpE{trial_nums(t)} = data_all{i}.onset(t); % save onset time in cell array if trial name is 'context'
    else
        onset_values_CSpE{trial_nums(t)} = []; % create empty entry in cell array if trial name is not 'context'
    end
end
onset_values_CSpE = onset_values_CSpE(~cellfun('isempty', onset_values_CSpE)); % remove empty elements
onset_values_CSpE = cell2mat(onset_values_CSpE);%% vector 
save(fullfile(subj_folder, 'onset_values_CSpE.mat'), 'onset_values_CSpE');
%% End the code for creating CSpE onsets

%% creating vector includes CSmE onsets 

trial_names_CSmE = data_all{i}.trial_type;
trial_nums = 1:numel(trial_names_CSmE);
onset_values_CSmE = cell(size(trial_nums)); % create cell array to store onset times for each trial
for t = 1:numel(trial_names_CSmE)
    if strcmp(trial_names_CSmE{t}, 'CSmE')
        onset_values_CSmE{trial_nums(t)} = data_all{i}.onset(t); % save onset time in cell array if trial name is 'context'
    else
        onset_values_CSmE{trial_nums(t)} = []; % create empty entry in cell array if trial name is not 'context'
    end
end
onset_values_CSmE = onset_values_CSmE(~cellfun('isempty', onset_values_CSmE)); % remove empty elements
onset_values_CSmE = cell2mat(onset_values_CSmE);%% vector 
save(fullfile(subj_folder, 'onset_values_CSmE.mat'), 'onset_values_CSmE');
%% End the code for creating CSmE onsets
    
%% creating vector includes CSpU onsets 

trial_names_CSpU = data_all{i}.trial_type;
trial_nums = 1:numel(trial_names_CSpU);
onset_values_CSpU = cell(size(trial_nums)); % create cell array to store onset times for each trial
for t = 1:numel(trial_names_CSpU)
    if strcmp(trial_names_CSpU{t}, 'CSpU')
        onset_values_CSpU{trial_nums(t)} = data_all{i}.onset(t); % save onset time in cell array if trial name is 'context'
    else
        onset_values_CSpU{trial_nums(t)} = []; % create empty entry in cell array if trial name is not 'context'
    end
end
onset_values_CSpU= onset_values_CSpU(~cellfun('isempty', onset_values_CSpU)); % remove empty elements
onset_values_CSpU = cell2mat(onset_values_CSpU);%% vector 
save(fullfile(subj_folder, 'onset_values_CSpU.mat'), 'onset_values_CSpU');
%% End the code for creating CSpU onsets

%% creating vector includes CSmU onsets 

trial_names_CSmU = data_all{i}.trial_type;
trial_nums = 1:numel(trial_names_CSmU);
onset_values_CSmU = cell(size(trial_nums)); % create cell array to store onset times for each trial
for t = 1:numel(trial_names_CSmU)
    if strcmp(trial_names_CSmU{t}, 'CSmU')
        onset_values_CSmU{trial_nums(t)} = data_all{i}.onset(t); % save onset time in cell array if trial name is 'context'
    else
        onset_values_CSmU{trial_nums(t)} = []; % create empty entry in cell array if trial name is not 'context'
    end
end
onset_values_CSmU= onset_values_CSmU(~cellfun('isempty', onset_values_CSmU)); % remove empty elements
onset_values_CSmU = cell2mat(onset_values_CSmU);%% vector 
save(fullfile(subj_folder, 'onset_values_CSmU.mat'), 'onset_values_CSmU');
%% End the code for creating CSmU onsets

    %% ** end of onsets vectors 
    vol_num = 315;
    scans = {};
    for ivol = 1:vol_num
        scans{ivol,1} = [raw_file ',' num2str(ivol)];
    end

scans = cellstr(scans);

matlabbatch{1}.spm.stats.fmri_spec.dir = {subj_folder};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 2.56;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess.scans = scans;
%% seeting the conditions: context
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).name = 'context'; 
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).onset = onset_values_context;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).duration = 3;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).orth = 1;
%% seeting the conditions: CSpE
    for p=2:9
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).name = ['CSpE' num2str(p-1)];
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).onset = onset_values_CSpE(p-1);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).duration = 6;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).orth = 1;
    end 
%% seeting the conditions: CSmE
    for p=10:17
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).name = ['CSmE' num2str(p-9)];
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).onset = onset_values_CSmE(p-9);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).duration = 6;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).orth = 1;
    end 

%% seeting the conditions: CSpU
    for p=18:25
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).name = ['CSpU' num2str(p-17)];
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).onset = onset_values_CSpU(p-17);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).duration = 6;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).orth = 1;
    end 
%% seeting the conditions: CSmU
    for p=26:33
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).name = ['CSmU' num2str(p-25)];
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).onset = onset_values_CSmU(p-25);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).duration = 6;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(p).orth = 1;
    end 

matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
%% MAKE SURE THE DIRECTOY IS CORRECT 
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {['path_to_recall_confounds/' subjects{i} '_task-recall_desc-confounds_timeseries_task_recall_six_file.txt']}; 
matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
%save("batchfile.mat", 'matlabbatch')

spm_jobman ('run', matlabbatch);

end
