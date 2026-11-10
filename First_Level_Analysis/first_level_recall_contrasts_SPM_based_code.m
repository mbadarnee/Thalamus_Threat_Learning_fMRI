%% FIRST_LEVEL_RECALL_CONTRASTS

% Replace the example participant and folder before use.

clear
clc
subjects = {'sub-EXAMPLE'};
first_level_dir = 'path_to_recall_first_level';

for i = 1:numel(subjects)
    sdir = fullfile(first_level_dir, subjects{i});
    spmfile = fullfile(sdir, 'SPM.mat');
    if ~exist(spmfile, 'file')
        continue;
    end
    matlabbatch{1}.spm.stats.con.spmmat = {spmfile};
matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = 'CSpE1';
matlabbatch{1}.spm.stats.con.consess{1}.tcon.weights = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{2}.tcon.name = 'CSpE2';
matlabbatch{1}.spm.stats.con.consess{2}.tcon.weights = [0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{3}.tcon.name = 'CSpE3';
matlabbatch{1}.spm.stats.con.consess{3}.tcon.weights = [0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{4}.tcon.name = 'CSpE4';
matlabbatch{1}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{5}.tcon.name = 'CSpE5';
matlabbatch{1}.spm.stats.con.consess{5}.tcon.weights = [0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{5}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{6}.tcon.name = 'CSpE6';
matlabbatch{1}.spm.stats.con.consess{6}.tcon.weights = [0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{6}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{7}.tcon.name = 'CSpE7';
matlabbatch{1}.spm.stats.con.consess{7}.tcon.weights = [0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{7}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{8}.tcon.name = 'CSpE8';
matlabbatch{1}.spm.stats.con.consess{8}.tcon.weights = [0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{8}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{9}.tcon.name = 'CSmE1';
matlabbatch{1}.spm.stats.con.consess{9}.tcon.weights = [0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{9}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{10}.tcon.name = 'CSmE2';
matlabbatch{1}.spm.stats.con.consess{10}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{10}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{11}.tcon.name = 'CSmE3';
matlabbatch{1}.spm.stats.con.consess{11}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{11}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{12}.tcon.name = 'CSmE4';
matlabbatch{1}.spm.stats.con.consess{12}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{12}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{13}.tcon.name = 'CSmE5';
matlabbatch{1}.spm.stats.con.consess{13}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{13}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{14}.tcon.name = 'CSmE6';
matlabbatch{1}.spm.stats.con.consess{14}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{14}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{15}.tcon.name = 'CSmE7';
matlabbatch{1}.spm.stats.con.consess{15}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{15}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{16}.tcon.name = 'CSmE8';
matlabbatch{1}.spm.stats.con.consess{16}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{16}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{17}.tcon.name = 'CSpU1';
matlabbatch{1}.spm.stats.con.consess{17}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{17}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{18}.tcon.name = 'CSpU2';
matlabbatch{1}.spm.stats.con.consess{18}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{18}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{19}.tcon.name = 'CSpU3';
matlabbatch{1}.spm.stats.con.consess{19}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{19}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{20}.tcon.name = 'CSpU4';
matlabbatch{1}.spm.stats.con.consess{20}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{20}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{21}.tcon.name = 'CSpU5';
matlabbatch{1}.spm.stats.con.consess{21}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{21}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{22}.tcon.name = 'CSpU6';
matlabbatch{1}.spm.stats.con.consess{22}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{22}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{23}.tcon.name = 'CSpU7';
matlabbatch{1}.spm.stats.con.consess{23}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{23}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{24}.tcon.name = 'CSpU8';
matlabbatch{1}.spm.stats.con.consess{24}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{24}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{25}.tcon.name = 'CSmU1';
matlabbatch{1}.spm.stats.con.consess{25}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{25}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{26}.tcon.name = 'CSmU2';
matlabbatch{1}.spm.stats.con.consess{26}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{26}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{27}.tcon.name = 'CSmU3';
matlabbatch{1}.spm.stats.con.consess{27}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{27}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{28}.tcon.name = 'CSmU4';
matlabbatch{1}.spm.stats.con.consess{28}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0];
matlabbatch{1}.spm.stats.con.consess{28}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{29}.tcon.name = 'CSmU5';
matlabbatch{1}.spm.stats.con.consess{29}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0];
matlabbatch{1}.spm.stats.con.consess{29}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{30}.tcon.name = 'CSmU6';
matlabbatch{1}.spm.stats.con.consess{30}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0];
matlabbatch{1}.spm.stats.con.consess{30}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{31}.tcon.name = 'CSmU7';
matlabbatch{1}.spm.stats.con.consess{31}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0];
matlabbatch{1}.spm.stats.con.consess{31}.tcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.consess{32}.tcon.name = 'CSmU8';
matlabbatch{1}.spm.stats.con.consess{32}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];
matlabbatch{1}.spm.stats.con.consess{32}.tcon.sessrep = 'none';

matlabbatch{1}.spm.stats.con.delete = 0;
save("batchfile.mat", 'matlabbatch');

% spm('defaults','fmri');
% spm_jobman('initcfg');
% spm_jobman('run', matlabbatch);
end
