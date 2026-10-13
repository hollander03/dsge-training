# Software compatibility standard

## Core requirement

Every core workshop exercise must run without a paid MATLAB licence. The baseline environment is GNU Octave; Dynare is used for DSGE exercises that require it.

## Authoring rules

- Commit a plain `.m` script even when a MATLAB Live Script is also supplied.
- Keep required packages to a minimum and document every dependency at the top of the exercise `README`.
- Use relative paths, a supplied data folder and reproducible random seeds where simulation is used.
- Prefer `.csv` data and plainly documented variable names over opaque `.mat` workspaces.
- State expected figures/tables and a basic check that confirms a successful run.
- Test the canonical script in GNU Octave before labelling it a core exercise.

## MATLAB-only functionality

MATLAB Econometrics Modeler, `varm`/`arima` workflows and the BEAR toolbox can be helpful demonstrations. They are optional enhancements only. When used, provide a baseline route that uses portable matrix/code routines and explain any functionality that is not replicated.

## R pathway

Each approved core exercise should receive an R counterpart in a later pass. The R version should use the same open data and reproduce the same substantive task, even where numerical details differ. Do not promise one-to-one replication of proprietary MATLAB applications.
