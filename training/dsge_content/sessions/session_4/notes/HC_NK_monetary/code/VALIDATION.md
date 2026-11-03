# Validation record — 3 November 2026

Environment: MATLAB R2024a, Dynare 6.1 (Apple Silicon). All runtime checks used temporary directories, without overwriting the research sources, workshop baselines or published PDFs.

- Simulation: original renamed model executed, passed the rank/determinacy check and produced IRFs.
- Regimes: all three `REGIME` macro selections executed. Checks confirmed a larger output response to a money-supply shock under the interest-sensitive regime and approximately zero real response under nearly flexible prices. The measured stationary-output variance shares are in `regime_benchmark_results.csv`.
- Efficient modified Taylor rule: executed; inflation and output-gap IRFs to technology and money-demand shocks were each below `1e-8` in absolute value.
- Paper-based OSR: executed with the restored paper core, bounded CMA-ES and fixed seed. Dynare reported error indicator zero and a finite loss lower than its initial loss. Bound-sensitive coefficients and the loss are recorded in `BENCHMARKS.md`.
- Original historical OSR: execution checked, but its objective is disconnected from its purported policy controls. This remains a reference example, not a validated optimum.
- Calibrated conditional forecast: original settings executed (5,000 replications, 40-quarter horizon). The first 12 forecast inflation values matched `0.02` within `1e-10`.
- Estimation: a temporary copy set `mh_replic=0`, retained `mode_compute=0` and the saved mode, removed `mode_check`, `bayesian_irf`, moment/decomposition requests inside the estimation command, and omitted the later `identification` command. The saved-mode likelihood, smoother and subsequent shock decomposition executed. The packaged original keeps 100,000 MH replications and its full diagnostics.
- Estimated conditional forecast: temporary copy set `mh_replic=0`, used `posterior_mode` instead of `posterior_mean`, and reduced conditional-forecast replications to 100. The 12 conditioned interest-rate observations matched `0.00094359` within `1e-10`. The packaged original keeps 50,000 MH replications, posterior-mean conditioning and 10,000 forecast replications. Its full posterior run has not been repeated here.
- Numeric data: estimation input has 244 rows by four columns; estimated-forecast input has 103 rows by four columns. All numeric entries are finite; both scripts assign the four declared observables.
- Equation comparison: the original simulation, 2020 estimation and estimated forecast match all twelve published core expressions after whitespace/comment normalisation. The calibrated forecast differs in the additional free-reserve disturbance; the historical OSR changes reserve supply and the Phillips curve. These differences are documented.

The checks establish executability and the stated mechanisms. They do not establish posterior convergence, full statistical identification, exact published figure replication, or equivalence of the full paper and the simplified slide-35 model. Source and PDF contents were read directly; the core-equation pages were also rendered and inspected.
