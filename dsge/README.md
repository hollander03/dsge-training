# DSGE 

[`Overview`](#overview) | [To-Do List](https://github.com/hollander03/dsge-training/tree/main/ntdsge/7.notes)

Repository containing the DSGE model code for policy analysis & forecasting, as well as resources and replication files to assist policy analysis.

## Overview

- `user_guide` contains a practitioner's guide to using DSGE models in Dynare. It provides the necessary information to use DSGE models for policy analysis and to develop the skills to maintain and improve on existing frameworks. The practitioner should have a basic understanding of DSGE models and should be familiar with MATLAB before attempting to use the model. Supplementary training resources are available in the `training` subdirectory, which takes you to the repository for training material and capacity building that is continuously being refined for the DSGE modelling & forecasting training. It includes a short MATLAB primer.

- `data` contains example South African data used for estimation. It includes meta information on variables used (e.g., KBP codes from the quarterly bulletin) and any other necessary data-related information. Note, for policy analysis and policy papers, data input and output may be stored in the respective folders, `policy_papers` and `policy_analysis` (e.g., estimated shocks for counterfactual policy evaluation or impulse response functions).

- `models` contains the main DSGE model code base for policy analysis & forecasting. This repository contains code to run alternative applications of existing DSGE models calibrated and estimated for South Africa, as discussed in the user guide. Note: replication files for past policy papers published are found in `policy_papers` for historical replicability purposes. 

- `policy_papers` contains replication files for past policy papers published.

- `policy_analysis` contains output for deliverables in the foreasting and budgeting process within the Forecasting & Modelling Unit at National Treasury.

- `matlab_code` contains matlab functions and example code to seasonally adjust variables, convert frequency of timeseries, generate fiscal multipliers, create figure plots, etc.

- `latex_output` contains the latex files generated using the ``LaTeX`` command in the Dynare ``.mod`` file as described in the user guide. This compiles a ``.pdf`` document of the calibrated and estimated parmaters, the steady state conditions, and the model equations.

- `notes` contains information on on-going work and includes a [To-Do List](https://github.com/hollander03/dsge-training/tree/main/ntdsge/7.notes).
