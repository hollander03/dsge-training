# Master’s-level macro-econometrics curriculum map

## Design principle

Practical applications lead; slides and readings provide concise reference support. The goal is not to reproduce an entire Master’s econometrics course in one workshop. It is to give participants a dependable workflow for a small policy question and to make the links between empirical models and DSGE analysis explicit.

## Core sequence

| Module | Workshop use | Practical focus | Supporting material to curate |
| --- | --- | --- | --- |
| 0. Orientation | Pre-workshop / Day 1 | MATLAB/Octave setup; scripts, paths, data and reproducibility | MATLAB primer; short code conventions note |
| 1. Dynamic foundations | Day 1 | Difference equations, lags, transformations and simulation | TS1 slides/tutorial; a short refresher only |
| 2. Univariate models | Day 2 | Inflation or fiscal-series diagnostics; ARMA benchmark; forecast evaluation | TS2/TS3 material; selected exercises |
| 3. VAR/SVAR | Day 3 | Fiscal-policy VAR, ordering/identification choices, impulse responses and limitations | TS4 tutorial; structural-identification note |
| 4. Non-stationary systems | Optional extension | Cointegration/VECM when the project warrants it | TS5 tutorial and data |
| 5. DSGE bridge | Day 4 | Observables, measurement equations, identification, forecasting and scenario comparison | `../ntdsge_content/readers` core list |
| 6. Team project | Day 5 | Question, data, method, result, caveat and next step | Project template and presentation rubric |

## Source-material inventory and migration rule

The Master’s Econometrics 871 material includes course slides, `TS1`-`TS5` topic folders, live scripts, data and older R prototypes. It is an important source inventory, but should not be copied wholesale into this public-facing repository.

Before a source item becomes a workshop resource, create a small, self-contained teaching unit in the relevant module directory with:

1. a descriptive name and a short `README`;
2. a plain `.m` script as the canonical implementation (not only a MATLAB Live Script);
3. non-sensitive data in an open format, preferably `.csv`;
4. GNU Octave run instructions and a stated compatibility check;
5. a short explanation of the empirical question and expected interpretation; and
6. a plan or stub for its eventual R translation.

Use a reading list or stable citation/link for published texts and articles unless reuse permission has been confirmed.

## First conversion priorities

1. MATLAB/Octave primer and a lag/difference-equation exercise.
2. Inflation forecasting and forecast-evaluation exercise.
3. Fiscal VAR/SVAR identification exercise.
4. DSGE observables and measurement-equation exercise linked to the existing Dynare materials.
5. A single mini-project template that teams can complete during the workshop.
