# Training repository notes — 3 November 2026

- Preferred name: **Practical Training Manual**, formerly referred to as the user guide. Full title: **Applied DSGE Modelling with Dynare: A Practical Training Manual**.
- Maintained Overleaf project: https://www.overleaf.com/project/6ad72ce5d978a419cd107ac1 . The facilitator reports that a PDF has also been saved in that Overleaf project. The facilitator subsequently added `Applied_DSGE_Modelling_with_Dynare_A_Practical_Training_Manual.pdf` to `training/dsge_content/sessions/dynare_help`; both reference READMEs now link to it.
- Retain the existing `dsge/0.user_guide` path so existing links continue to work; use the preferred name in participant-facing text.
- Folder tidying and README integration were committed and pushed as `30b5e02`. Local training Markdown links passed verification. The current `basics.m` contains a Live Script package, not a plain-text Octave script; the help README records this.
- Next workshop preparation priorities remain those in the 2 November handover, starting with the RBC slide source and review.

## RBC slide-source review

- Facilitator supplied the external `dsge-training-nt/.../Basic_RBC/compile reader` folder. Its `Hansen_basicrbc_FULL.tex` uses the article class and produces the model reader, not a Beamer slide deck.
- Added the advanced macro course RBC TeX source and its 24 referenced figures under `session_2/slides/source/macro_course_rbc`; compilation passed with pdfLaTeX (58 pages after the second pass). Existing course participant PDF is retained and linked from the session README.
- Recommended workshop sequence: trend/cycle and filtering; business-cycle facts and moments; conceptual RBC model; Hansen model and workshop code. Keep course and workshop model assumptions distinct. Slide content has not yet been refreshed.
- Extracted slide text is identical between the existing Hansen slides and the facilitator-compiled `notes/source/RBC.pdf`. The copied course source also produces the same extracted text as the existing course PDF; these are content checks, not pixel-level visual comparisons.
- Hansen reader compiler sources were already tracked in `training/dsge_content/codes/Basic_RBC/compile reader` and match the external copy. Added build/dependency documentation and a session 2 link; clean temporary-directory pdfLaTeX compilation passed twice. This typesets historical saved material, rather than regenerating it from current Dynare code.
- At the facilitator’s request, moved the complete Hansen reader compiler folder to `training/dsge_content/sessions/session_2/notes/source/hansen_reader` and updated navigation links. Existing tracked build products were preserved with the move.
- Added historical CIA/MIU slide sources under `session_3/slides/source`, with both appendix files and four referenced JPG figures. Both main documents compile with pdfLaTeX in clean temporary folders. Content is retained for later use; session 3 remains optional.

## Hollander–Christensen monetary-regime extension

- Added selected original simulation, 2020 estimation, calibrated conditional forecast and estimated conditional forecast under `session_4/notes/HC_NK_monetary/code`, with standardised filenames, numeric data, saved modes and source hashes.
- Compared paper equations (5)–(16), appendix (B.30)–(B.41) and rendered slide 35. Full research core is retained; slide 35 omits free reserves and changes money-supply shock placement. Auxiliary velocity omits the money-demand shock in the originals; reporting labour/marginal-cost equations also need care. See `EQUATION_REVIEW.md`.
- At the facilitator's request, demoted the old velocity-offset/markup-shock OSR to `osr/reference`; added paper-based five-parameter OSR, three Table-2-style regimes and equation-(19) efficient Taylor-rule benchmark. The new OSR uses baseline shocks, not a markup shock. Teaching bounds and derived changes are explicit.
- MATLAB R2024a / Dynare 6.1 checks passed for simulation, all regimes, efficient benchmark, OSR and calibrated forecast; saved-mode/no-MCMC checks passed for estimation and estimated forecasting. Conditional paths were numerically checked. Full posterior runs were not repeated. See `VALIDATION.md` and `BENCHMARKS.md`.
- Exact replication remains distinct: selected estimation source uses 94 observations versus 95 in Table 1; interest-targeting output variance shares do not exactly reproduce Table 2. Preserve these discrepancies for review instead of silently tuning the originals.

## Saved-mode historical decompositions and forecasts

- Added the fuller pre-GFC source `CH2020Est5907m4.mod` as `historical_decomposition/hc_monetary_historical_decomposition.mod`, with its numeric dataset and distinct paired `CH2018mvpyEst5907Hetzel_mode.mat` (renamed `hc_monetary_historical_mode.mat`). Retained the source's 194 observations; the endpoint caveat remains explicit.
- Changed the actual defaults for the fuller decomposition, Great Moderation estimation and estimated forecast to `mode_compute=0`, `mh_replic=0`, saved-mode smoothing and explicit posterior-mode downstream analysis. The previous validation had only changed temporary copies; the shipped defaults now match that quick workflow.
- Added commented full reoptimisation/MCMC commands, with posterior-mean forecast alternative. Default examples all passed MATLAB R2024a / Dynare 6.1, including 10,000 forecast draws and finite shock decompositions. Full-rerun alternatives passed preprocessing only; no full MCMC reruns were performed.

- Moved the complete `HC_NK_monetary` extension from session 4 `notes` to `code/HC_NK_monetary` at the facilitator’s request. Internal layout and model dependencies are unchanged; session links updated. This is the current location, superseding earlier paths in these notes.

## Real fiscal DSGE practical (to-do item 2)

- Facilitator supplied the Havemann fiscal r-star research directory, then selected `ntdsge_real.mod` as the fixed-calibration baseline. The appended Practicing-Dynare GitHub link was set aside at the facilitator's request.
- Added `session_2/code/real_fiscal/real_fiscal.mod`: original model block and calibration retained, estimation workflow replaced by first-order simulation. No external data, saved mode or nonlinear steady-state solver is needed at this calibration. Added plotting and shock-persistence comparison helpers, run guide, model review, source hashes and legacy references.
- All 54 embedded real-block equations match the standalone source after `_n`/comment/whitespace normalisation; six fiscal rules match both JPM references. The older `_flexible_n` source fails preprocessing due to an undefined `fiscalr_n` and its legacy steady-state routines were not attached or repaired.
- MATLAB R2024a / Dynare 6.1 checks passed. All 210 stored IRFs match the original-source simulation exactly; six fiscal-shock output IRFs are finite, foreign-shock output effects are zero, persistence comparison solves and restores baseline structures. Plot exports were visually checked.
- Important economic qualifications are documented: inherited open-economy steady-state weights and two resource constraints are preserved, not rederived for a new closed economy; consumption-tax scaling needs reconciliation before percentage-point shocks or quantitative multipliers. No structural simplification was made.
- Fiscal practical README now offers an accessible growth-model fiscal extension and the optional advanced real-model route. Keep experiments focused on one mechanism and distinguish innovation persistence from instrument smoothing; selecting a shock does not deactivate other fiscal financing rules.

## Participant-facing scope correction

- Public repository guidance must address participants. Keep internal source audits, validation histories, provenance and obsolete research variants under `archive`, without making them required participant reading. Applied this to the real-fiscal and monetary-regime additions; archived recent duplicate RBC build products while retaining sources and teaching decks.
- Refocused session 2 fiscal practical on extending the Hansen/WM RBC code or the session 1 optimising growth/fiscal examples. A shock added to Solow alone does not produce an optimising RBC model. The fuller real-fiscal model is no longer the required practical route.
- Removed links to the NT-specific fiscal repository from public participant guidance. No `training_2025` files had been imported into this public repository. The facilitator states that this material belongs in the separate `dsge-training-nt` repository.
- Clarification resolved: retain the optional real-fiscal model publicly with internal notes archived, and also copy its runnable files to the NT repository. Move the historical 2025 collections out of Practicing-Dynare-NT into dsge-training-nt.

## NT repository copies and 2025 migration completed

- NT destination commit `1e84c9d` was pushed and verified before deleting any source files. Runnable real fiscal copy: `training/ntdsge_content/sessions/session_2/code/real_fiscal`. All three runnable files match the public version exactly; its README is adapted to the NT layout.
- Historical participant collection: `training/2025`, with fiscal, presentation and RBC/MIU examples. README links to the maintained Practicing Dynare repository and its Overleaf read link. Internal logs, errata and provenance are under `archive/training_2025` in the NT repository.
- All 32 files from both `Code/training_2025` and `Code/archive/training_2025` were preserved and verified against the pushed NT Git blobs using SHA-256. Per-folder Git attributes preserve their original bytes. The earlier source manifest is retained in the NT archive.
- Source removal commit `6ffd082` was pushed to Practicing-Dynare-NT. Both historical folders were removed, and README/review references updated. Maintained workbook TeX, current section examples and full replications were unchanged.
- NT team training starts 30 November 2026. Both NT additions are linked from its root/training READMEs; they do not replace the current public workshop exercises.

## To-do items 3–5: output data practical and group questions

- Checked existing course CSVs: US real GDP per capita (312 quarters, 1947Q1–2024Q4); SA aggregate real GDP (128 quarters, 1993Q1–2024Q4); `rgdp_pc.csv` duplicates the US file exactly. Copied the three snapshots unchanged into the model–data practical's `data` folder. Default common window is 1993Q1–2024Q4, with per-capita/aggregate coverage caveat.
- Corrected every HP output assignment in both course/workshop `rbc_data_clean.m` copies to `[trend,cycle]`, including recursive one-sided examples. Saved data are now the default; the original FRED HTTP/CSV `websave` exercise remains available via `download_data=true`, writing to a separate `downloaded_data` folder. No keyed FRED REST API or live download was required for validation.
- Added a small base-MATLAB/Octave offline output-moments helper using textscan and the standard sparse two-sided HP system, without tables/datetime/hpfilter. Checked base Octave 11.3.0 and MATLAB R2024a against MATLAB hpfilter: cycles agree within 1e-8. Output cycle SDs: US 1.2889%, SA 1.8515%; lag-one correlations 0.6170 and 0.3619.
- Both corrected scripts passed MATLAB R2024a using saved data. Optional Dynare 6.1 theoretical HP and simulated one-sided moments also passed. Baseline basicrbc.mod is unchanged. Guidance retains default unfiltered simulated moments and explains `hp_filter` for theoretical versus simulated moments; `one_sided_hp_filter` is simulated-only. The test theoretical output variance was 0.00208226 unfiltered and 0.000441876 with two-sided HP(1600).
- Item 4: original master's PDF unchanged; workshop README explicitly supersedes its missing Hansen_basicrbc_FULL.mod reference, submission instructions, wider data requirement and self-correlation/relative-output moments. Core exercise now compares output SD/autocorrelation for US/SA/model, with filtering convention stated.
- Item 5: growth README suggests 4.3.1 government purchases or 4.3.2 consumption tax, with anticipated/pulse extensions as optional choices. NK README adds three focused baseline questions, keeping regime/OSR exercises optional. These are suggested bounded choices, not a compulsory complete set. No housekeeping or model reconciliation performed.
