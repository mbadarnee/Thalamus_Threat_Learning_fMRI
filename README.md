# Fear Conditioning, Extinction, Recall, and Renewal: SPM12 fMRI Analysis Scripts

This repository contains MATLAB scripts used for first- and second-level fMRI analyses of **fear conditioning, extinction, recall, and renewal** with **SPM12**. The scripts are shared to document the analysis workflow and facilitate reproducibility. They require study-specific paths, participant lists, and contrast selections before use.

## Requirements

- MATLAB (a version compatible with the installed SPM12 release)
- [SPM12](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/) installed and available on the MATLAB path
- Preprocessed functional MRI images and the relevant motion/confound files
- Study-specific onset information for first-level model specification
- First-level contrast images for second-level analyses

See the [official SPM documentation](https://www.fil.ion.ucl.ac.uk/spm/docs/) for installation, model specification, estimation, and contrasts.

## Analysis workflow

| Step | Script type | Application |
| --- | --- | --- |
| 1 | First-level model specification | **Phase-specific** (conditioning, extinction, recall, renewal); select the appropriate acquisition protocol where available |
| 2 | First-level model estimation | **Reusable across phases** for previously specified first-level `SPM.mat` models |
| 3 | First-level contrast specification | **Phase-specific**; contrast names, vectors, and ordering depend on the design |
| 4 | Second-level model specification | Reusable for phases analyzed with the **same one-sample t-test design**, after changing inputs and output paths |
| 5 | Second-level model estimation | **Reusable across phases** for previously specified second-level `SPM.mat` models |

**Note:** A separate second-level contrast-definition step may be needed to test the estimated group effect. Second-level model estimation alone does not define a group-level contrast.

## Acquisition protocols

Two acquisition protocols were used for **conditioning, extinction recall and renewal**:

| Protocol | Repetition time (TR) | Functional volumes |
| --- | --- | --- |
| Protocol A | 3.00 seconds | 268 |
| Protocol B | 2.56 seconds | 315 |

Choose the first-level specification script matching the acquisition of the data being analyzed.

## First-level analysis

### 1. Model specification

First-level specification scripts define the task-specific regressors and their onsets, the functional images, motion nuisance regressors, and the SPM design settings. Conditioning, extinction, recall, and renewal have different regressor structures; **their specification scripts are not interchangeable merely by changing paths**.


Before running a specification script, update the functional image directory, participant folder names, onset-file locations, and nuisance-regressor paths. Confirm the expected number of volumes and TR.

### 2. Model estimation

The first-level estimation script can be used for **all four phases** because it operates on the `SPM.mat` produced by the corresponding phase-specific first-level specification. Change the root directory or list of model directories to point to the intended phase and participants. This does **not** mean the same first-level model specification should be used across phases.

### 3. First-level contrasts

Use the contrast script corresponding to the phase and the actual first-level design:

- **Conditioning:** 32 individual trial contrasts (16 `CSp` and 16 `CSm`) in the updated script.
- **Extinction:** 35 active contrasts (16 `CSpE`, 16 `CSmE`, `All_CSpE`, `All_CSmE`, and `context`).
- **Recall:** 32 individual contrasts (8 each of `CSpE`, `CSmE`, `CSpU`, and `CSmU`).
- **Renewal:** 32 individual contrasts (8 each of `CSpE`, `CSmE`, `CSpU`, and `CSmU`).


## Second-level analysis

### 4. Model specification

The shared second-level specification script implements a **one-sample t-test** on a selected first-level contrast image from each included participant. It may be reused for conditioning, extinction, recall, and renewal **only where the intended group design is the same**. Update the first-level results directory, participant list, contrast image filename (for example, `con_0033.nii`), and second-level output directory. The example filename is not a universal contrast identifier across phases.

The original specification includes no covariates, no threshold masking, implicit masking, no explicit mask, omitted global calculation, no global scaling, and no global normalization. Different group designs (for example, between-group comparisons, paired tests, or models with covariates) require different model specifications.

### 5. Model estimation

The second-level estimation script is reusable across phases: it estimates a previously specified second-level model using that model's `SPM.mat`. Update the relevant output-directory paths. 

## Atlas-Based Activation Extraction

The Automated Anatomical Labeling Atlas 3 (AAL3) was used for region-of-interest (ROI)-based extraction of activation values.

Although all trials of each conditioned stimulus (CS) type were included in the first-level GLM specification, activation values were extracted only for the first four trials of each CS type.


## Recommended execution order

1. Specify the phase-specific first-level model.
2. Estimate the first-level model.
3. Define and run the phase-specific first-level contrasts.
4. Specify the appropriate second-level model using the desired first-level contrast images.
5. Estimate the second-level model.
6. Define and evaluate the relevant second-level contrast(s), if not handled by another script.

## Public-use and reproducibility notes

- Private filesystem paths and participant identifiers have been replaced with illustrative placeholders in public versions of the scripts. Replace these with your own values before running.
- The scripts document an existing analysis workflow; **not every script has been executed or validated in a new environment**.

- Inspect the first-level design matrix (`SPM.mat`) and contrast names before running second-level models.


