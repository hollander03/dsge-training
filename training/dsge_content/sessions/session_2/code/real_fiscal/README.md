# Real fiscal DSGE model: fixed-calibration simulation

This optional extension brings together the [session 1 growth/fiscal applications](../../../session_1/README.md) and the [basic RBC practical](../../README.md). It uses the facilitator-selected `ntdsge_real.mod` research specification, with its original equations and calibrated steady-state coefficients. The workshop version replaces its estimation/decomposition workflow with a first-order simulation. It does not require observed data, a mode file or a nonlinear steady-state solver.

This is a real fiscal DSGE model with an RBC-style core, rather than the small representative-household RBC baseline. It includes private and public capital, capital utilisation, investment adjustment costs, habits, Ricardian and non-Ricardian households, transfers, distortionary taxes, debt-sensitive risk premia and six fiscal policy rules. Work on one mechanism at a time; understanding or extending the entire model is not required for the group practical.

## Run

With Dynare configured in MATLAB, change to this directory and run:

```matlab
dynare real_fiscal
plot_real_fiscal_irfs('etag')
```

The model runs `steady`, `check` and `stoch_simul(order=1, irf=40)`. The plotting helper shows one selected fiscal shock and exports a PNG in the working folder. Files can be copied to a separate working directory before running to keep generated outputs separate from the source.

| Instrument | Model variable | Innovation for the plotting helper |
|---|---|---|
| Government consumption | `g` | `etag` |
| Public investment | `iG` | `etaiG` |
| Transfers | `tr` | `etatr` |
| Consumption tax | `tauC` | `etatauC` |
| Labour-income tax | `tauN` | `etatauN` |
| Capital-income tax | `tauK` | `etatauK` |

For example, `plot_real_fiscal_irfs('etatauN')` shows the labour-tax experiment. The baseline contains non-fiscal shocks too, but first-order IRFs isolate one innovation at a time; other shock variances do not need to be set to zero to study a fiscal IRF.

## Focused comparison

Run `compare_real_fiscal_persistence` to compare government-consumption **shock persistence** `rhoepsG=0.5` and `0.9`, holding the original innovation size and other parameters fixed. This differs from instrument smoothing `rhog`. The helper calls Dynare once, uses the Dynare parameter API for the comparison, checks for a valid solution and restores the original parameter/result structures. It exports `real_fiscal_persistence.png` and a MAT file containing the comparison IRFs.

Other questions can consider one debt-feedback coefficient, one spending instrument versus one tax instrument, or the response of Ricardian versus non-Ricardian consumption. Check the solution after changing policy-rule parameters. All six instruments remain present: choosing one shock does not disable the other instruments' endogenous financing responses.

## Calibration and units

The `.mod` file includes the inherited steady-state/calibration coefficients, so its linear steady state can be computed directly. No legacy nonlinear steady-state routine is used by this simulation. Changing shock persistence, innovation size or a policy feedback is different from recalibrating steady-state taxes, expenditure shares or household composition. Such structural recalibration requires a separate steady-state review; do not assume the embedded coefficients automatically adjust.

The default shocks use their source standard deviations, which differ across instruments. A one-standard-deviation spending shock is not directly comparable to a one-standard-deviation tax shock as an equal-cost policy intervention. The helper plots `100 × model deviation`; quantity variables generally represent log deviations, rates are shown as scaled model units without annualisation, and `by=b-y` is a log debt/output-ratio deviation, not a change in the debt ratio in percentage points.

Keep tax-rate responses in raw model units until their normalisation has been checked. In particular, the consumption-tax coefficient in the household FOC uses `tauCbar/(1+tauCbar)`, while the budget equation contains an unscaled `tauC` term. This inherited convention needs reconciliation before labelling a tax innovation as a one-percentage-point rate change or computing comparable fiscal multipliers.

## Scope

External dynamics are decoupled from domestic real outcomes in this source; the inherited foreign variables/reporting equations remain. The source's open-economy steady-state coefficients and both resource constraints are retained. This package does not claim to have rederived a new closed-economy steady state or to replicate the full nominal model by switching off a single rigidity parameter.

For the group exercise and the simpler NCG/RCK alternative, see the [fiscal practical](../../tutorials/fiscal_applications/README.md).

## Research applications and background

The model supplied here is a fixed-calibration, flexible-price version of the South African NT-DSGE model developed from Kemp and Hollander's (2020) working paper. That model has since been extended and applied to fiscal stimulus, fiscal stress, basic income grants and, most recently, fiscal r-star and monetary–fiscal coordination in Havemann and Hollander (2026), “Monetary–Fiscal Coordination in South Africa: Aligning the Stars.”

The papers below document this development and its policy applications, including versions with nominal rigidities and an open economy. The real model supplied for this practical retains the flexible-price core; specifications and calibrations differ across the papers, so it should not be treated as the replication code for every application.

- **Kemp, J. H. and Hollander, H. (2020).** “A medium-sized, open-economy, fiscal DSGE model of South Africa.” *WIDER Working Paper 2020/92*. The foundational model description. [DOI](https://doi.org/10.35188/UNU-WIDER/2020/849-8).
- **Havemann, R. and Hollander, H. (2026).** “Monetary–Fiscal Coordination in South Africa: Aligning the Stars.” *South African Journal of Economics*, **94**(3), e70019. [DOI](https://doi.org/10.1111/saje.70019).
- **Havemann, R. and Hollander, H. (2024).** “Fiscal policy in times of fiscal stress (or what to do when r > g).” *Journal of Policy Modeling*, **46**(5), 1020–1054. [DOI](https://doi.org/10.1016/j.jpolmod.2024.07.001) · [Longer working-paper version](https://doi.org/10.35188/UNU-WIDER/2022/183-9).
- **Hollander, H., Havemann, R. and Steenkamp, D. (2024).** “The macroeconomics of establishing a basic income grant in South Africa.” *South African Journal of Economics*, **92**(1), 57–68. [DOI](https://doi.org/10.1111/saje.12363) · [Longer technical paper](https://mpra.ub.uni-muenchen.de/id/eprint/114614).
- **Hollander, H. (2024).** “Debt-financed fiscal stimulus in South Africa.” *Studies in Economics and Econometrics*, **48**(1), 87–112. [DOI](https://doi.org/10.1080/03796205.2024.2321628).
