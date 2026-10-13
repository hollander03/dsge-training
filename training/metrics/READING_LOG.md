# Econometrics reading log

## Purpose and use

This is a curated guide to the macro-econometrics reader inventory. It supports the practical workshop sequence; it is not a prescription to read every source. Participants should receive only the core entries before or during each session, with the remaining items available for follow-up.

Forecasting is treated as an application of the methods throughout: a univariate benchmark is built first, then compared with multivariate and structural approaches. It is not a separate strand detached from the underlying model choices, data treatment and identification assumptions.

## Core learning sequence and readings

| Stage | Practical question | Core reading | Relevant chapters/sections | Extension |
| --- | --- | --- | --- | --- |
| 1. Dynamic foundations | How do lags, difference equations and transformations describe economic adjustment? | Walter Enders, *Applied Econometric Time Series* | Ch. 1, especially sections 1-2 and 9: time-series models, difference equations and lag operators | TS1 slides/tutorial |
| 2. Univariate methods | What is a credible benchmark for a fiscal or macroeconomic series, and how should it be forecast and evaluated? | Enders | Ch. 2, especially sections 1-9: stochastic difference equations, ARMA models, stationarity, ACF/PACF, Box-Jenkins selection and forecast properties | Ch. 3 sections 1-7: trends, unit roots and Dickey-Fuller testing |
| 3. From one series to systems | When does adding other variables improve the question, rather than simply add complexity? | Helmut Lütkepohl, *New Introduction to Multiple Time Series Analysis* | Ch. 2 sections 1-3: stable VARs, forecasting, Granger causality, impulse responses and forecast-error variance decomposition; Ch. 3 sections 2-6: estimation, forecast uncertainty and causality tests | Ch. 4: lag selection, residual checks and structural-change diagnostics |
| 4. VAR/SVAR identification | What makes an empirical fiscal or monetary shock interpretable as structural? | Enders | Ch. 5 sections 5-10: VAR analysis, estimation/identification, impulse responses, testing and SVARs | Lütkepohl Ch. 9: structural VARs/VECMs; Romer and Romer (1997), selected discussion of narrative and VAR identification |
| 5. Cointegration and long-run relationships | Does the policy question require a VECM rather than a stationary VAR? | Enders | Ch. 6, especially sections 1-10: cointegration, error correction, Engle-Granger and Johansen methods | Lütkepohl Chs. 6-8 |
| 6. Bayesian and richer empirical models | When do priors and shrinkage help in a small macroeconomic sample? | Ferroni and Canova, *A Hitchhiker’s Guide to Empirical Macro Models* | Ch. 2 (setup); Ch. 3, including sections 3.3 and 3.8: decomposition and forecasting | Lütkepohl Ch. 5 section 4: Bayesian estimation; MATLAB BVAR tutorial |
| 7. Bridge to DSGE | How do observables, measurement equations and identification choices connect empirical and DSGE analysis? | `../ntdsge_content/readers/` catalogue | `learning-dsge-models/`, `identification/` and `forecasting/` | Small Dynare scenario exercise |

## Existing preliminary metrics content

The following material already in `tutorials/econometric_research/` is valuable and should be retained as a source inventory:

| Existing item | Place in the sequence | Workshop status |
| --- | --- | --- |
| `1. SARBDataConnector/` | Day 1: reproducible data acquisition and preparation | Reference material; create an Octave-compatible data-input route before using as a core exercise |
| `2. VARModel/DownloadingAndPreprocessingData.mlx` | Transition from data preparation to the multivariate question | Reference material; export/rebuild as a plain `.m` script with open data |
| `2. VARModel/WebinarVARModel.mlx` | Day 3: VAR specification, diagnostics and interpretation | Reference material; translate the core workflow into the canonical Octave route |
| `3. BayesianVARModel/` | Optional extension after the core VAR/SVAR exercise | MATLAB-oriented demonstration only; not a core requirement |

The bundled Bayesian VAR tutorial is useful for explaining model objects, priors and uncertainty intervals, but it relies on MATLAB Econometrics Toolbox functions. It should therefore follow—not replace—the transparent core VAR/SVAR implementation.

## Reference-only sources

- James D. Hamilton, *Time Series Analysis*: broad reference for the formal theory underlying time-series and forecasting methods; assign only targeted excerpts when a project requires them.
- David F. Hendry and Bent Nielsen, *Econometric Modeling*: reference for model specification, diagnostics and empirical discipline; use as a facilitator resource rather than a core workshop text.
- Ferroni and Canova’s BVAR manual: optional advanced reference. Its code toolkit can be useful in MATLAB and Octave, but performance and optimisation support differ across environments.

## Curation rule

For each exercise, list one core reading, one optional extension, the associated script/data and one applied policy question. Published sources remain in the reader inventory or are cited/linked; they should not be copied into the participant package without clear reuse permission.
