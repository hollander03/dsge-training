# Validation record — 3 November 2026

MATLAB R2024a / Dynare 6.1; temporary directories separate from the research project and workshop source. No empirical estimation or OSR was run.

- The selected original `ntdsge_real` source, with its estimation tail replaced by a simulation command, passed `steady`, the eigenvalue/rank condition and first-order simulation.
- Packaged `real_fiscal.mod` has an identical active model block after comment/whitespace normalisation. It preserves all source calibration assignments. Its declared model has 68 equation expressions; Dynare generates two lag auxiliaries, giving 70 endogenous variables in the processed model.
- The included real block in the later nominal/flexible-gap source contains 54 equations. All 54 match the selected standalone source after removing `_n` suffixes and comments/whitespace. The earlier `SAFiscal_fiscalrstar_flexible2.mod` also matches those 54 expressions.
- Both JPM references have the same six fiscal reaction functions as the selected real model. Direct text comparison finds 46 shared equation expressions; the full nominal/open-economy models were not run or declared equivalent.
- All six fiscal innovations have finite output IRFs in the packaged simulation. A total of 210 common stored IRF series agree with the original-source simulation to within `1e-12` (the measured maximum difference was 0.0). The original shock sizes and impact responses are recorded in `baseline_fiscal_impacts.csv`; they are not equal-cost multipliers.
- Output IRFs to `etaYstar` and `etaRPstar` are zero within `1e-10`, confirming foreign-shock decoupling for this outcome at the selected specification/calibration.
- `compare_real_fiscal_persistence` executed both `rhoepsG=0.5` and `0.9` cases with valid solutions. Their output IRFs differ, while instrument smoothing is unchanged. Exact restoration of `M_`, `oo_` and `options_` was checked.
- The IRF plotting helper and persistence-comparison helper exported PNGs. Plots were visually inspected; the IRF panel titles/spacing were adjusted for readability.
- The original unsuffixed `SAFiscal_fiscalrstar_flexible.mod` and `...flexible2.mod` simulations also executed. The older `_flexible_n.mod` fails preprocessing on its undefined `fiscalr_n`; no repair was made. Its nonlinear steady-state chain is preserved as reference only.

These are executability, preservation and focused-comparison checks. They do not rederive a closed-economy nonlinear steady state, resolve the inherited resource-constraint/tax-scaling questions, or validate quantitative fiscal multipliers. Structural recalibration requires a separate steady-state/economic review.
