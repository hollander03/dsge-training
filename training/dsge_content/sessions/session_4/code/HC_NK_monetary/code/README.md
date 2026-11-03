# Monetary-regime examples

These examples extend the baseline New Keynesian model with reserve supply, free reserves and a policy-rate target. They use the paper's full reserve-market system, rather than the simplified extension on slide 35. Choose one exercise and follow its calibration and units when comparing results.

## Choose an example

Configure Dynare in MATLAB, change to the indicated directory, then run the command. Each directory contains its own required inputs. No FRED download or external research-project path is needed.

| Task | Directory and command | Scope |
|---|---|---|
| Simulation | `simulation`: `dynare hc_monetary_simulation` | four active shocks, pre-GFC reserve calibration and the paper's core equations. |
| Two monetary regimes and a flexible-price benchmark | `simulation`: `dynare hc_monetary_regimes -DREGIME=1` (or `2`, `3`) | Section 5.1 / Table 2: reserve elasticities `(12,12)`, `(1,1)`, and `(1,1)` with nearly flexible prices. |
| Optimal simple rule | `osr`: `dynare hc_monetary_osr` | Section 5.3 / Figures 9–10: paper reserve rule, four baseline shocks, inflation/output-gap loss and five optimised policy parameters. |
| Efficient Taylor-rule benchmark | `simulation`: `dynare hc_monetary_optimal_benchmark` | Section 5.3 / equation (19): direct market-rate rule including the natural rate; passive money demand. |
| Great Moderation estimation | `estimation`: `dynare hc_monetary_estimation` | Divisia M4 data, saved posterior mode, `first_obs=101`, `nobs=94`; saved-mode smoothing and decomposition by default, with a commented full rerun. |
| Fuller pre-GFC historical decomposition | `historical_decomposition`: `dynare hc_monetary_historical_decomposition` | first 194 observations, full pre-GFC reserve ratios/sample means, and its own saved mode. Historical-decomposition teaching counterpart to section 4.3 / Figures 4–6. |
| Calibrated conditional forecast | `conditional_forecast`: `dynare hc_monetary_conditional_forecast` | conditions inflation `pii` at `0.02` for periods 1–12 using `epsil_i`; 40-period horizon and 5,000 replications. |
| Estimated conditional forecast | `conditional_forecast`: `dynare hc_monetary_estimated_forecast` | saved mode and historical data; no MCMC by default; conditions `int_obs` at `0.00094359` for 12 periods, using `epsil_i`, at the supplied posterior mode. |

## Reuse saved estimates or rerun estimation

The fuller historical decomposition, Great Moderation estimation and estimated conditional forecast **reuse their supplied mode by default**: `mode_compute=0`, `mode_file=...`, `mh_replic=0`, with `smoother`. They evaluate the saved parameter vector and run filtering/smoothing without optimising the mode or drawing an MCMC chain. The decomposition explicitly uses `parameter_set=posterior_mode`; the estimated forecast also conditions at `posterior_mode`. These are plug-in analyses at a fixed parameter vector, not analyses integrating over posterior parameter uncertainty.

Each file has a commented alternative immediately below its active estimation command. To rerun estimation, comment the default command and uncomment the alternative. It sets `mode_compute=4` to optimise from the supplied mode, then runs MCMC: 100,000 replications per block for the two estimation/decomposition examples, or 50,000 per block for the estimated forecast, in three blocks. Expensive mode checks, Bayesian IRFs and identification are optional rather than prerequisites for the default practical. After MCMC, switch the downstream analysis to `posterior_mean` if desired; a matching conditional-forecast command is provided as a comment. Do not activate both estimation commands or both conditional-forecast commands.

All necessary mode files are supplied; a mode file is not a saved posterior chain. Changing the data window, measurement equations or specification calls for a fresh mode optimisation, rather than assuming the supplied vector remains optimal. No historical MCMC chain or generated Dynare package has been copied.

## Paper benchmarks

Start with [BENCHMARKS.md](BENCHMARKS.md), which maps every example to the paper and records measured checks. Regime selection is a compile-time switch; each alternative is visible in `hc_monetary_regimes.mod`. Run the three cases in separate working folders if retaining their complete generated outputs.

The OSR example uses `omega=kapatilde/10` (price elasticity 10), follows the paper's parameter set `(rho_h, nu_h, rho_i, kapa_pi, kapa_y)`, and retains the four baseline shocks, without a markup shock. It restores `nu_fr=11.61` from Table 1 for the Great Moderation calibration. Search bounds are teaching choices: `rho_h` in `[0,0.99]`, `nu_h` in `[0.1,100]`, `rho_i` in `[0,0.999]`, `kapa_pi` in `[1.01,5]`, and `kapa_y` in `[0,2]`. Dynare's bounded CMA-ES optimiser (`opt_algo=9`) uses a fixed seed. This is a bounded numerical OSR exercise, not a claim to reproduce the paper's optimiser settings or welfare percentages.

## Inputs and units

Each estimation directory has its own copy of `hc_monetary_data.m`, containing four columns assigned to `ytilde_obs`, `pii_obs`, `int_obs` and `m_obs`, in that order. The forecast uses its own `hc_monetary_forecast_data.m`; the datasets serve different sample windows and must not be interchanged. The Great Moderation estimation and forecast each include `hc_monetary_mode.mat`. The fuller-sample decomposition uses its distinct `hc_monetary_historical_mode.mat`, from `CH2018mvpyEst5907Hetzel_mode.mat` referenced by the 2020 fuller-sample source. Its 19 saved parameter names/order were checked against the declared estimated shocks and parameters; do not substitute the Great Moderation mode.

Measurement equations retain the original constants. `m_obs` is a first difference of nominal log money plus its sample mean; the other observables are levels plus sample means. Data and constraints are decimals, not percentages. The source comments describe annualised interest rates and year-on-year inflation, alongside quarterly money growth; these historical conventions have not been rescaled to the baseline workshop model's quarterly-rate convention. A forecast value of `0.02` is retained exactly and should be interpreted in the source model's units.

### Sample endpoints

The fuller decomposition retains `first_obs=1, nobs=194` from the research source, with `FR=0.12`, `RR=38.62` and the source's full pre-GFC measurement means. If row 1 is 1959Q1, 194 observations end in 2007Q2; the paper's Figures 4–6 state 1959Q1–2007Q3 (195 observations). The saved file is the source-paired historical mode, not a newly optimised mode for a corrected endpoint. That endpoint discrepancy is explicitly retained pending verification; do not label this as an exact reconstruction of Figures 4–6.

The numeric data scripts do not contain a date vector. The estimation’s observation indices and constants are retained exactly. In particular, this source requests 94 observations, while Table 1 reports 95 for the Great Moderation sample. Confirm the sample-to-calendar mapping and intended endpoint before presenting an exact replication. Do not infer the forecast conditioning date from the filename alone.

## Interpretation

The models are linear, unconstrained rational-expectations systems. Conditioning an interest-rate path is not an occasionally binding zero-lower-bound solution. Targets are imposed by solving for the specified controlled shock, rather than by replacing the policy rule.

The price level and nominal money can contain unit roots while inflation and real variables are stationary. Undefined unconditional variances for nominal levels are not by themselves a simulation failure. Evaluate OSR losses on stationary targets, and distinguish solver determinacy checks from full identification or replication checks.

The original auxiliary `v` (also retained in the regime comparison) omits `-xi_md`; it therefore differs from identity-based velocity `p + y - m` by `xi_md`. Use `p + y - m` when the quantity-equation identity is required. The OSR and efficient-rule teaching adaptations use the identity-consistent expression including `-xi_md`.

## Working copies

Copy an example and its inputs into a working directory before running if you want to keep generated outputs separate from the source files.
