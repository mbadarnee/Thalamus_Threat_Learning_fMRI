% FIRST_LEVEL_CONDITIONING_CONTRASTS.m

% Set first_level_dir and subjects before running.

clear
clc

first_level_dir = 'path_to_conditioning_first_level'; % Parent folder containing subject directories
subjects={'sub-EXAMPLE'}; % Replace with your participant IDs
for i = 1:numel(subjects)
sdir = fullfile(first_level_dir, subjects{i});
spmfile = fullfile(sdir, 'SPM.mat');
 if ~exist(spmfile)
        continue;
    end
matlabbatch{1}.spm.stats.con.spmmat = {spmfile};
% Original commented-out subject-specific SPM.mat path removed for privacy.
matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = 'CSp1';
matlabbatch{1}.spm.stats.con.consess{1}.tcon.weights = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{2}.tcon.name = 'CSp2';
matlabbatch{1}.spm.stats.con.consess{2}.tcon.weights = [0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{3}.tcon.name = 'CSp3';
matlabbatch{1}.spm.stats.con.consess{3}.tcon.weights = [0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{4}.tcon.name = 'CSp4';
matlabbatch{1}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{5}.tcon.name = 'CSp5';
matlabbatch{1}.spm.stats.con.consess{5}.tcon.weights = [0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{5}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{6}.tcon.name = 'CSp6';
matlabbatch{1}.spm.stats.con.consess{6}.tcon.weights = [0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{6}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{7}.tcon.name = 'CSp7';
matlabbatch{1}.spm.stats.con.consess{7}.tcon.weights = [0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{7}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{8}.tcon.name = 'CSp8';
matlabbatch{1}.spm.stats.con.consess{8}.tcon.weights = [0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{8}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{9}.tcon.name = 'CSp9';
matlabbatch{1}.spm.stats.con.consess{9}.tcon.weights = [0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{9}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{10}.tcon.name = 'CSp10';
matlabbatch{1}.spm.stats.con.consess{10}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{10}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{11}.tcon.name = 'CSp11';
matlabbatch{1}.spm.stats.con.consess{11}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{11}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{12}.tcon.name = 'CSp12';
matlabbatch{1}.spm.stats.con.consess{12}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{12}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{13}.tcon.name = 'CSp13';
matlabbatch{1}.spm.stats.con.consess{13}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{13}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{14}.tcon.name = 'CSp14';
matlabbatch{1}.spm.stats.con.consess{14}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{14}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{15}.tcon.name = 'CSp15';
matlabbatch{1}.spm.stats.con.consess{15}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{15}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{16}.tcon.name = 'CSp16';
matlabbatch{1}.spm.stats.con.consess{16}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{16}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{17}.tcon.name = 'CSm1';
matlabbatch{1}.spm.stats.con.consess{17}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{17}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{18}.tcon.name = 'CSm2';
matlabbatch{1}.spm.stats.con.consess{18}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{18}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{19}.tcon.name = 'CSm3';
matlabbatch{1}.spm.stats.con.consess{19}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{19}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{20}.tcon.name = 'CSm4';
matlabbatch{1}.spm.stats.con.consess{20}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{20}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{21}.tcon.name = 'CSm5';
matlabbatch{1}.spm.stats.con.consess{21}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{21}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{22}.tcon.name = 'CSm6';
matlabbatch{1}.spm.stats.con.consess{22}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{22}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{23}.tcon.name = 'CSm7';
matlabbatch{1}.spm.stats.con.consess{23}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{23}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{24}.tcon.name = 'CSm8';
matlabbatch{1}.spm.stats.con.consess{24}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{24}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{25}.tcon.name = 'CSm9';
matlabbatch{1}.spm.stats.con.consess{25}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{25}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{26}.tcon.name = 'CSm10';
matlabbatch{1}.spm.stats.con.consess{26}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{26}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{27}.tcon.name = 'CSm11';
matlabbatch{1}.spm.stats.con.consess{27}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{27}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{28}.tcon.name = 'CSm12';
matlabbatch{1}.spm.stats.con.consess{28}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{28}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{29}.tcon.name = 'CSm13';
matlabbatch{1}.spm.stats.con.consess{29}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{29}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{30}.tcon.name = 'CSm14';
matlabbatch{1}.spm.stats.con.consess{30}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0];
matlabbatch{1}.spm.stats.con.consess{30}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{31}.tcon.name = 'CSm15';
matlabbatch{1}.spm.stats.con.consess{31}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0];
matlabbatch{1}.spm.stats.con.consess{31}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{32}.tcon.name = 'CSm16';
matlabbatch{1}.spm.stats.con.consess{32}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0];
matlabbatch{1}.spm.stats.con.consess{32}.tcon.sessrep = 'none';

matlabbatch{1}.spm.stats.con.delete = 0;

spm('defaults','fmri');
    spm_jobman('initcfg');
    spm_jobman('run', matlabbatch);
end
