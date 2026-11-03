# Benchmarks against the paper

These are teaching benchmarks against the **approach and qualitative results** of Hollander and Christensen (2022), not a certified numerical replication of the publication. See the [paper](../2022-HC-monetary-regimes-PRINT.pdf), [appendix](../HC2020-MD-SuppAppendix.pdf). Recorded runs use MATLAB R2024a and Dynare 6.1 on 3 November 2026.

| Example | Published benchmark | What to compare and what was checked |
|---|---|---|
| Original simulation | Section 4.1, Figures 1–2; Table 1 Great Moderation calibration | Four active shocks and the published twelve-equation core. Positive money supply raises output and inflation and lowers the market rate on impact. Original calibration is retained, including `nu_fr=12` rather than Table 1's `11.61`. |
| Three regime cases | Section 5.1, Table 2 | Compare `(nu_h,nu_fr)=(12,12)`, `(1,1)`, and the second case near flexible prices. Money shocks have a larger real effect with lower reserve elasticities; technology accounts for essentially all output variance in the flexible-price limit. Both direction checks passed. |
| Paper-based OSR | Section 5.3, equation (17), Figures 9–10 | Optimise the stated five policy parameters under the paper core and four baseline shocks. Check a finite stationary-target loss, improvement over the starting calibration, and valid parameter bounds. It does not use the velocity-offset rule or the markup shock. |
| Modified Taylor rule | Section 5.3, equation (19), efficient benchmark in Figures 9–10 | The market rate includes the natural rate. Maximum absolute inflation/output-gap IRFs to technology and money-demand shocks were below `1e-8`, matching the paper's zero-gap/zero-inflation benchmark. |
| Great Moderation estimation | Section 3 / Table 1; historical decompositions in section 4.3 | Same core and original measurement equations, numeric data and saved mode included. The packaged default reuses the saved mode for likelihood, smoothing and decomposition, with no optimisation or MCMC. Original source specifies 94 observations; the paper reports 95 in the Great Moderation sample. A full posterior replication and endpoint reconciliation remain necessary for exact numerical comparison. |
| Fuller pre-GFC decomposition | Section 4.3, Figures 4–6 | The paired historical mode and full-sample ratios/means are supplied. The default computes decompositions at that mode without re-estimation. The original source selects 194 observations; the paper endpoint implies 195 if the first row is 1959Q1. This is a fuller-sample teaching example, with an endpoint caveat. |
| Calibrated conditional forecast | Section 5.2, inflation-path approach illustrated by Figure 8 | The original demonstration fixes `pii=0.02` for 12 quarters using policy shocks. The implemented path matched to less than `1e-10`. It starts from calibration, not the historical 2009 state, so it does not reproduce the historical recovery chart. |
| Estimated conditional forecast | Section 5.2, Figure 7; commented inflation alternative for Figure 8 | Uses historical data and fixes `int_obs=0.00094359` for 12 quarters using `epsil_i`. The default saved-mode run satisfied the path to less than `1e-10`. The active command uses the posterior mode; the commented full-rerun alternative permits posterior-mean conditioning after MCMC. The commented alternative constrains `pii_obs=0.02`; use one constraint for the one controlled shock. |

## Measured regime comparison

Output impact responses below are multiplied by 100 for percentage deviations, using the original money-supply innovation size `0.0717`. Both sticky-price regimes hold the rest of the source calibration fixed.

| Regime | Output impact of a positive money-supply shock | Output variance shares: technology / target rate / money supply / money demand (%) |
|---|---:|---|
| 1 | 1.144401% | 15.66 / 30.47 / 42.60 / 11.27 |
| 2 | 4.106455% | 4.73 / 0.17 / 89.13 / 5.97 |
| 3 | 0.000167% | 100.00 / 0.00 / 0.00 / 0.00 |

These output shares are unconditional shares for stationary output. The code also produces 1–20-quarter forecast-error decompositions, which are suitable for finite-horizon comparisons involving nominal levels. Do not equate finite-horizon and unconditional shares.

For comparison, Table 2 reports output shares `15.7 / 38.5 / 35.1 / 10.8` in the interest-targeting case and `4.9 / 0.2 / 89.0 / 5.9` in the interest-sensitive case. The selected source-based exercise follows the table's mechanism and broadly its pattern, but the first case does not reproduce those percentages. No parameters have been tuned to hide this discrepancy. The nearly flexible-price case uses `theta_p=0.0001`, not the exact zero-stickiness limit. [Machine-readable measured results](regime_benchmark_results.csv) are included.

## OSR check and limits

With the documented bounds and fixed seed, the paper-based teaching OSR reduced the weighted stationary-target variance from approximately `9.39281e-5` to `3.18672e-6`. The reported solution was `rho_h=0.04432`, `nu_h=0.1`, `rho_i=0.68665`, `kapa_pi=5`, `kapa_y=2`. Several coefficients reach the imposed bounds, so the solution depends materially on those teaching bounds. It is not an estimate of the paper's reported welfare gains or proof of a global optimum. The loss is computed with unconditional variances, following Dynare's OSR implementation; it is not a recomputed discounted lifetime welfare sum from a historical initial state.
