# Basic RBC examples

Run these files in MATLAB or Octave with Dynare configured, from this folder:

- `dynare basicrbc2015` solves the calibrated model, plots impulse responses, varies risk aversion, and simulates repeated samples.
- `dynare basicrbc2015_est` uses `data9519.m` to compute a fresh posterior mode. The default `mh_replic=0` skips posterior sampling and requires no saved mode or MCMC files. For posterior sampling, set `mh_replic=50000` and add `bayesian_irf`; check convergence before interpreting results.

The [user guide](https://www.overleaf.com/project/6ad72ce5d978a419cd107ac1) explains the model and commands. LaTeX output in the simulation file is optional and commented out; compiling it requires `pdflatex`.
