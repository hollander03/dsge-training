# 2026 foreign-block correction: ten-observable flex-price model

Use `GHW2026_SOEnooil_SWshocks_flex.mod`. It preserves the 2020 no-oil model's
sticky/flexible equilibria, ten observables, ten shocks, priors and supplied
`GHWEstimation10SW.m` dataset. The original `HvL_GHW18nooil_SWshocks_rep.mod`
and its saved mode remain historical references; copies are also in `archive/`.

## Correction and fresh estimation

The lagged foreign-output coefficient in foreign marginal cost must use foreign
consumption curvature and habit:

```text
old: -sigma_c*phi/(1-phi_star) * y_star(-1)
new: -sigma_c_star*phi_star/(1-phi_star) * y_star(-1).
```

No other economic equation is changed. A duplicate `rho_ys` declaration was
removed for current Dynare compatibility. The old mode is not reused in the
fresh estimation. An initial fresh `mode_compute=5` optimization failed to
produce a positive-definite Hessian, so MCMC could not start. Its source,
mode and log are preserved in `archive/fresh_mode5_failed_20261112/`.
The working version retries from the prior initialization with simulation-based
`mode_compute=6`, followed by three chains of 100,000 draws and 50% burn-in,
20-quarter Bayesian IRFs, moments and shock decompositions. Optimizer tuning
uses three rounds of 20,000 scale/climb draws and 10,000 covariance draws;
these optimizer draws are not the posterior sample.

From this folder, with Dynare on the MATLAB path:

```matlab
dynare GHW2026_SOEnooil_SWshocks_flex.mod
```

Or run `run_corrected_flex_2026.m`, which sets the installed macOS Dynare 6.1
path and suppresses visible figures. To rerun after completion while preserving
an earlier run, first move the generated model output folder to a dated archive.
After successful posterior processing:

```matlab
summarize_corrected_flex_2026
```

This exports parameter and Bayesian IRF tables into `comparison_2026/`.
A numerical mode or a successful Blanchard-Kahn check alone is not evidence
that posterior sampling or convergence has succeeded.

## What is being compared?

| Feature | 2019 oil specification (current corrected source) | 2020 no-oil flex-price specification |
|---|---|---|
| Source | `../../SA_GHW_2019_SOEoil/GHW2026_SOEoil.mod` | `GHW2026_SOEnooil_SWshocks_flex.mod` |
| Data | `GHWEstimation7.m`, 90 rows | `GHWEstimation10SW.m`, 90 rows |
| Observables | Oil price, foreign output/inflation/rate, domestic output/inflation/rate | Foreign output/inflation/rate, domestic output/consumption/investment/wages/inflation/rate/hours |
| Estimated shock standard deviations | 8, including oil price | 10; no oil price; adds wage markup, investment-specific and spending shocks |
| Oil in consumption/production | Yes | No |
| Flexible-price equilibrium | Not present | Present, with natural output and `ygap = y-yn` |
| Foreign habit | Fixed at zero | Estimated |
| Priors/calibration | Oil-model priors | Different priors, notably domestic/foreign curvature; additional estimated parameters |

The copied `GHW2026_SOEoil.mod` files previously in this flex-price folder
were seven-observable oil models, **not** flex-price versions. They are now
in `archive/` under their original or prefixed filenames. The canonical oil
model in `SA_GHW_2019_SOEoil` was inspected but not changed or re-estimated.
Its foreign marginal-cost numerator is correctly `sigma_c_star*phi_star`.
Comments claiming a 2025 dataset or loaded MCMC are not supported by the
supplied 90-row data and current executable estimation options.

The legacy ten-observable header says 1995Q1--2017Q2, consistent with 90 rows;
the files contain no date column, so these dates are not independently verified.
The six shared observables are not all identical: domestic GDP growth differs
in five rows (largest absolute difference 0.0006969572), and the domestic rate
in one row (0.0000078993). The four foreign/inflation series otherwise match
to rounding. See `comparison_2026/source_and_data_audit.json` for exact hashes
and differences. Do not interpret a 2019-vs-2020 posterior change as the isolated
foreign-parameter correction: model structure, observables, shocks, priors and
some observations change together. Marginal likelihoods across different
observable vectors are not direct model-ranking evidence.

## Results available now: isolate the equation change

`comparison_2026/run_fixed_mode_comparison.m` evaluates both equations at the
**same archived ten-observable mode** and shock standard deviations. It does
not estimate parameters and does not use the oil model. Results are in
`fixed_legacy_mode_irf_comparison.csv` and the accompanying foreign-TFP chart.
For a one-standard-deviation foreign productivity shock, impacts multiplied
by 100 are:

| Variable | Old equation | Corrected equation |
|---|---:|---:|
| Foreign output | 0.27288 | 0.30459 |
| Foreign inflation | -0.49863 | -0.47860 |
| Domestic output | 0.43723 | 0.42140 |
| Domestic inflation | -0.10479 | -0.11815 |
| Domestic policy rate | 0.01153 | 0.00744 |

Output responses are approximate percent deviations; inflation/rate responses
are quarterly percentage-point deviations, not annualized. The foreign-output
peak rises from 0.60135% to 0.71195%. Domestic monetary-shock responses are
unchanged to numerical precision at this fixed parameter vector, as expected
from the autonomous foreign block. Foreign monetary/risk-premium responses
also change. These are **fixed-mode IRFs, not posterior mean IRFs**.

The initial fresh corrected optimization reached negative log posterior
-3277.672996, but its Hessian was indefinite; its NaN standard errors and
Laplace density are not valid posterior findings. The simulation-based retry
must complete and pass convergence checks before interpreting re-estimated
posterior means or Bayesian IRFs. No completed seven-observable posterior
results were present in the supplied folder: archived mode files alone cannot
establish posterior means, credible intervals or Bayesian IRF differences.
The requested numerical 2019-vs-2020 posterior comparison therefore remains
pending verified seven-observable posterior output and a successful corrected
sampling run. `parameter_comparison.csv`, when generated, labels historical
seven-observable modes explicitly rather than calling them posterior means.

## Existing natural-equilibrium caveat

The inherited foreign natural-output equation
`yn_star = (1+sigma_n_star)/(sigma_c_star+sigma_n_star)*a_star`
is the no-habit expression, while `phi_star` is estimated. Setting foreign
marginal cost to zero with habit would instead imply

```text
[sigma_c_star/(1-phi_star) + sigma_n_star]*yn_star
 - sigma_c_star*phi_star/(1-phi_star)*yn_star(-1)
 = (1+sigma_n_star)*a_star.
```

This is flagged, not silently repaired: the present experiment isolates the
requested sticky-price foreign coefficient. Interpret natural output/output-gap
IRFs with this qualification. The active policy rule uses output growth, not
`ygap`; natural variables form a downstream benchmark block, so this caveat
does not by itself change the sticky-price likelihood. The inherited capital
and investment equations/timing are also retained rather than mechanically
copied from the oil model.
