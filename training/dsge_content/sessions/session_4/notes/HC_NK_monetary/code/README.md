# Monetary-regime examples

These examples were selected from the author's research folders on 3 November 2026. Filenames use `hc_monetary_` plus the task; endogenous variable names, calibrations and original equilibrium equations are retained. The selected originals change only filenames/dependency references, explanatory forecast comments and text whitespace. Separately named teaching adaptations implement the paper’s regime comparisons and optimal-policy benchmark. [Provenance](provenance.csv) records the original filenames and SHA-256 hashes. See the [equation review](EQUATION_REVIEW.md) for substantive qualifications.

## Choose an example

Configure Dynare in MATLAB, change to the indicated directory, then run the command. Each directory contains its own required inputs. No FRED download or external research-project path is needed.

| Task | Directory and command | Source and scope |
|---|---|---|
| Simulation | `simulation`: `dynare hc_monetary_simulation` | `Model/CH2017mvpySimGFC.mod`; four active shocks, pre-GFC reserve calibration and the paper's core equations. |
| Three monetary regimes | `simulation`: `dynare hc_monetary_regimes -DREGIME=1` (or `2`, `3`) | Section 5.1 / Table 2: reserve elasticities `(12,12)`, `(1,1)`, and `(1,1)` with nearly flexible prices. |
| Optimal simple rule | `osr`: `dynare hc_monetary_osr` | Section 5.3 / Figures 9–10: paper reserve rule, four baseline shocks, inflation/output-gap loss and five optimised policy parameters. |
| Efficient Taylor-rule benchmark | `simulation`: `dynare hc_monetary_optimal_benchmark` | Section 5.3 / equation (19): direct market-rate rule including the natural rate; passive money demand. |
| 2020 estimation | `estimation`: `dynare hc_monetary_estimation` | `Model2020/CH2020Est8407m4.mod`; Divisia M4 data, saved posterior mode, `first_obs=101`, `nobs=94`, 100,000 MH replications in each of three blocks. |
| Calibrated conditional forecast | `conditional_forecast`: `dynare hc_monetary_conditional_forecast` | `Model Forecast/CH2017mvpySimForecast.mod`; conditions inflation `pii` at `0.02` for periods 1–12 using `epsil_i`; 40-period horizon and 5,000 replications. |
| Estimated conditional forecast | `conditional_forecast`: `dynare hc_monetary_estimated_forecast` | `Model Forecast/CH2020EstForecast.mod`; saved mode and historical data, 50,000 MH replications in each of three blocks; conditions `int_obs` at `0.00094359` for 12 periods, using `epsil_i`, at the posterior mean. |

The original replication counts are retained and can take substantial time. A saved mode is supplied for `mode_compute=0`; this is an input to a new estimation, not a complete saved posterior chain. No historical MCMC chain or generated Dynare package has been copied.

## Paper benchmarks

Start with [BENCHMARKS.md](BENCHMARKS.md), which maps every example to the paper and records measured checks. Regime selection is a compile-time switch; each alternative is visible in `hc_monetary_regimes.mod`. Run the three cases in separate working folders if retaining their complete generated outputs.

The OSR example uses `omega=kapatilde/10` (price elasticity 10), follows the paper's parameter set `(rho_h, nu_h, rho_i, kapa_pi, kapa_y)`, and retains the four baseline shocks, without a markup shock. It restores `nu_fr=11.61` from Table 1 for the Great Moderation calibration. Search bounds are teaching choices: `rho_h` in `[0,0.99]`, `nu_h` in `[0.1,100]`, `rho_i` in `[0,0.999]`, `kapa_pi` in `[1.01,5]`, and `kapa_y` in `[0,2]`. Dynare's bounded CMA-ES optimiser (`opt_algo=9`) uses a fixed seed. This is a bounded numerical OSR exercise, not a claim to reproduce the paper's optimiser settings or welfare percentages.

The earlier velocity-offset OSR experiment is preserved in `osr/reference/hc_monetary_osr_original.mod`, outside the main run sequence. It is not the paper-based OSR example. No model changes were made to that historical reference.

## Inputs and units

`hc_monetary_data.m` contains four columns assigned to `ytilde_obs`, `pii_obs`, `int_obs` and `m_obs`, in that order. The forecast uses its own `hc_monetary_forecast_data.m`; the datasets serve different sample windows and must not be interchanged. Both examples include `hc_monetary_mode.mat`, copied from the respective source folder.

Measurement equations retain the original constants. `m_obs` is a first difference of nominal log money plus its sample mean; the other observables are levels plus sample means. Data and constraints are decimals, not percentages. The source comments describe annualised interest rates and year-on-year inflation, alongside quarterly money growth; these historical conventions have not been rescaled to the baseline workshop model's quarterly-rate convention. A forecast value of `0.02` is retained exactly and should be interpreted in the source model's units.

The numeric data scripts do not contain a date vector. The estimation’s observation indices and constants are retained exactly. In particular, this source requests 94 observations, while Table 1 reports 95 for the Great Moderation sample. Confirm the sample-to-calendar mapping and intended endpoint before presenting an exact replication. Do not infer the forecast conditioning date from the filename alone.

## Interpretation

The models are linear, unconstrained rational-expectations systems. Conditioning an interest-rate path is not an occasionally binding zero-lower-bound solution. Targets are imposed by solving for the specified controlled shock, rather than by replacing the policy rule.

The price level and nominal money can contain unit roots while inflation and real variables are stationary. Undefined unconditional variances for nominal levels are not by themselves a simulation failure. Evaluate OSR losses on stationary targets, and distinguish solver determinacy checks from full identification or replication checks.

The original auxiliary `v` (also retained in the three-regime comparison) omits `-xi_md`; it therefore differs from identity-based velocity `p + y - m` by `xi_md`. Use `p + y - m` when the quantity-equation identity is required. The OSR and efficient-rule teaching adaptations use the identity-consistent expression including `-xi_md`. The [equation review](EQUATION_REVIEW.md) also distinguishes the historical OSR experiment from the paper's reserve rule.

## Verification

See [validation](VALIDATION.md) for the exact checks performed and their limits. Copy examples into a working directory before running if you want to keep generated outputs separate from the source files.
