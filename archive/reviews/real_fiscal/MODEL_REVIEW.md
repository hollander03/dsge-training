# Model selection and comparison

The facilitator selected `ntdsge_real.mod` as the fixed-calibration workshop baseline on 3 November 2026. Research files were read from the supplied fiscal r-star model directory; source hashes are recorded in `provenance.csv`.

## Candidate assessment

| Candidate | Finding |
|---|---|
| `ntdsge_real.mod` | Later real specification, dated December 2024 in its header. The source launches estimation. Retaining its calibration/equations and replacing that workflow with simulation passes MATLAB R2024a / Dynare 6.1. Selected baseline. |
| `SAFiscal_fiscalrstar_flexible2.mod` | Original fixed-calibration simulation passes. All 54 model equations match expressions in `ntdsge_real.mod`; the latter adds foreign/reporting/measurement equations. |
| `SAFiscal_fiscalrstar_flexible.mod` | Simulation passes, but retains active open-economy structure and different equations. It is not interchangeable with the real version. |
| `SAFiscal_fiscalrstar_flexible_n.mod` | Older suffixed/open-economy flexible model. Fails preprocessing: declared `fiscalr_n` has no active equation. Its legacy steady-state wrapper also needs interface review. Not repaired or used. |
| `SAFiscal_fiscalrstar_est_flex.mod` / `_gap.mod` | Contain the full nominal model plus the included real block. That included block's 54 equations match the selected source exactly after removing `_n` suffixes and whitespace/comments. These are not standalone real simulations. |
| `SAFiscalr_flex_osr_sim.mod` | Also includes the real block but adds welfare objects, a second-order simulation and OSR. Not used as the entry-level fiscal practical. |
| `SAFiscal_rg_JPM.mod` / `_fullsample.mod` | Full nominal/open-economy replication references. Both have 103 model-equation expressions; 46 match the selected real source directly, including all six fiscal policy rules. The remaining equations include nominal/trade structure and differently expressed conditions. These were inspected, not rerun or declared economically equivalent. |

## What is preserved

The active linear model block and all calibration assignments in the workshop `real_fiscal.mod` match `ntdsge_real.mod` after comments/whitespace are removed. The estimation priors, data-loading and decomposition workflow are omitted from the runnable simulation, while the original source remains in `reference`.

The six policy instruments are government consumption, public investment, transfers and consumption/labour/capital taxes. Their rules, together with their innovation processes, match the six rules in the JPM references. Household heterogeneity, public capital, distortionary taxes, risk premia and endogenous fiscal financing make this a richer real fiscal DSGE extension of the training pathway. It should not be presented as numerically equivalent to the simple Hansen RBC model.

The nonlinear helper chain is not needed at the inherited fixed calibration: the selected source embeds steady-state coefficients and lets Dynare solve the linear steady state. Copying or attaching an older open-economy steady-state wrapper to this real model would risk silently changing its calibration or invoking an incompatible interface, so no such attachment was made.

## Qualifications for interpretation

1. The dynamic domestic real block has no feedback from the inherited foreign variables. Tests explicitly check zero domestic output responses to the two retained foreign innovations. Foreign reporting equations remain in the source; they were not deleted as an unsolicited structural simplification.
2. Steady-state shares and coefficients are inherited from the larger model. Both the domestic-absorption and aggregate expenditure/resource equations remain. Their consumption/investment weights differ because of that origin. Passing the linear solution checks is not a derivation of a new closed-economy nonlinear steady state; that would require a separate economic reconciliation.
3. Tax normalisation needs care. In particular, the household consumption-tax term and fiscal-budget term use different baseline-rate scaling. Equations were preserved rather than silently rescaled. Use raw model units until the intended convention is confirmed; a causal IRF exercise is distinct from a quantitatively comparable tax multiplier.
4. The endogenous financing rules remain active for all instruments. Changing one fiscal innovation leaves spending, transfers, taxes and debt free to respond according to their existing rules. A single-instrument shock is not a model with only one financing instrument.
5. `rhoepsG` and its analogues govern the fiscal shock process; `rhog` and its analogues smooth the instrument itself. Comparisons should state which persistence parameter changed.
6. No estimation, full nominal-model replication, OSR or nonlinear steady-state recalibration is performed by this workshop package.
