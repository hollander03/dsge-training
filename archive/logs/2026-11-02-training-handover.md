# Training repository handover — 2 November 2026

## Decisions and working rules

- Use British English. This is a public-facing general training repository.
- Obtain approval before structural adjustments; do not infer permission for further moves, deletions or model changes from this handover.
- Keep internal handover notes here, outside participant-facing guidance.
- `training` is the main participant entry point. Keep `macro_course_material` standalone for Romer-based advanced macroeconomics teaching with Dynare. Prefer its layout and compare overlapping material before replacing it; it is not always the newest source.
- Leave metrics content development for later. The root README describes its future complementary role.
- Workshop core: growth → RBC → NK. Retain folder numbering. Session 3 is optional reference, since nonlinear formulation appears in growth and the NK model includes MIU.
- Use the same practical sequence: understand the baseline; pose a question and predict the mechanism; run a focused comparison; interpret results and limitations; present the finding.

## Completed in this change set

- Public-facing root/training/DSGE navigation, a topic map and metrics context.
- Corrected both course/workshop RBC simulation copies: restore baseline eta after the sweep and plot the last 100 time observations correctly. Preserved estimation variants.
- NK session guidance and plots; repaired the course smoothing comparison to call Dynare once, change parameters through its API, check IRFs and restore baseline structures. Corrected workshop optimal-policy persistence declarations without changing model equations.
- The baseline course `basicNKMtidy.mod` and workshop `NKM.mod` remain equivalent; workshop `basicNKMtidy.mod` is the separate optimal-policy extension.
- Nominal money/price-level non-stationarity is an intentional pedagogical point, linked to the monetary-regimes slides, paper and appendix; do not treat it as an error to eliminate.
- Copied NK and RBC slides into workshop sessions, preserving course copies.
- Organised workshop session 2 into slides, code, notes and tutorials; optional session 3 into code and notes; session 4 into slides, code, notes and tutorials. Preserved the nonlinear `.mod`, `.inc` and helper together and RBC TeX with its image dependencies.
- Added a scoped 60–90-minute model–data practical README, a copy of the original master's tutorial and the existing `rbc_data_clean.m` example. The master's PDF is unchanged: its submission instructions do not apply to workshop participants.

## Teaching practicals

- Growth: selected Practicing Dynare fiscal applications extending Solow; interpret steady states and transition paths. Practice project: https://www.overleaf.com/project/692d6b9a27db12d5acaeb198 . Related code: https://github.com/hollander03/Practicing-Dynare-NT . Facilitator still needs to select precise exercises.
- RBC: groups choose flexible-price DSGE fiscal applications OR model–data moment comparison. Broad choice of fiscal experiments, bounded by one question and an interpretable result. Facilitator supplies data and/or participants use the FRED download example.
- NK: shocks, rules and monetary-regime comparisons, including nominal-level determination. Optional optimal simple rules after discussing targets and weights.
- Follow existing workshop administration guidance for presentation length and participation.

## Resume here on 3 November 2026

1. Review/update the RBC slides before the workshop starts Monday 9 November. Course PDF: `training/macro_course_material/matlab-dynare/2.session_rbc/Hansen_basicrbc_slides.pdf`; workshop copy: `training/dsge_content/sessions/session_2/slides/Hansen_basicrbc_slides.pdf`. Locate/confirm editable slide source first; do not assume `RBC.tex` generates that exact deck.
2. Obtain the facilitator's flexible-price full DSGE model and run instructions for `session_2/tutorials/fiscal_applications`. No model has yet been supplied or invented.
3. Select a saved quarterly dataset and prepare/review empirical/model moment comparison. The copied `rbc_data_clean.m` is an existing MATLAB example, not a newly tested cross-platform pipeline. It uses FRED CSV downloads and MATLAB functions including hpfilter. Supply an offline data fallback and decide the Octave path. `data9519.m` contains growth observations, not detrended levels ready for this exercise.
4. Review the workshop tutorial against the selected data/model. The original master's handout names a missing `Hansen_basicrbc_FULL.mod`; the workshop README explicitly selects `basicrbc.mod`. Avoid confusing simulated-path correlation with fit to historical observations.
5. Confirm precise growth fiscal exercises and NK group questions. Retain room for participants to choose applications.
6. Consider a separately approved housekeeping pass: generated Dynare packages, routine logs, LaTeX build products, tracked `.DS_Store` files and redundant ignore entries remain. Do not delete them automatically. Some session 4 generated material still sits at the old root intentionally.
7. Reconcile further duplicated models only after comparing economics and calibration. Optional nonlinear RBC has different labour preferences and an additional disturbance; it is not automatically equivalent to the baseline linear model.

## Verification

- Earlier in this session, both corrected RBC copies passed MATLAB R2024a / Dynare 6.1, including eta restoration and simulation dimensions.
- NK baseline/plots, smoothing comparison and optimal simple rules passed. Comparison checks confirmed changed output-gap IRFs and unchanged natural-rate IRFs across policy smoothing values.
- Local Markdown links and whitespace checked after reorganisation. Relocation smoke-test results are recorded below before commit.
- No automatic Overleaf–GitHub synchronisation. The main guide remains https://www.overleaf.com/project/6ad72ce5d978a419cd107ac1 . Current guide code filenames are basicrbc.mod and basicrbc_est.mod; online copies were updated earlier, not by this folder reorganisation.

- Relocation checks passed for baseline RBC, baseline NK with plotting, and optional nonlinear RBC, each in a clean temporary folder using the new dependency groups.
