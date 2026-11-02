# DSGE - Training

[`Overview`](#overview) | [`Resources`](#resources) | [`Schedule`](#schedule) | [`Tutorials`](#tutorials) |

Training materials for modern macroeconomic theory and computational methods, supporting research and capacity building.

For workshop schedules, participant guidance and preparation requirements, see the [workshop administration README](admin/README.md).

The user guide can be found in the [`dsge/0.user_guide`](https://github.com/hollander03/dsge-training/tree/main/dsge/0.user_guide) subdirectory. This folder contains the user guide, the Dynare Manual, and additional resources to understand and implement DSGE models in Dynare. The latest user guide is maintained in [Overleaf](https://www.overleaf.com/project/6ad72ce5d978a419cd107ac1). Since 2 November 2026, the Google Docs version and local DOCX have been retained as legacy references; future revisions are maintained in Overleaf.

## Overview

- The numbered topics under [Schedule](#schedule) are organised into teaching blocks. One session represents approximately two hours; the detailed workshop schedule specifies the actual allocation.
- Teaching combines discussion of core concepts, guided code examples and practical applications.
- Participants develop their understanding by running models, interpreting results and exploring changes to assumptions, parameters and policy rules.
- Review the relevant resources beforehand where possible, and bring questions about concepts, implementation or interpretation.
- Use the `DSGE Workshop` workspace on [Slack](https://slack.com/) to share questions, results and useful resources during and between sessions. [Workspace link](https://dsgeworkshop.slack.com/) · [invite link](https://join.slack.com/t/dsgeworkshop/shared_invite/zt-4er0kw2as-NQ3pTKse2gmadq3f3Y97Fw).

## Resources
- Sessions draw on the [Dynare tutorials by Willi Mutschler](https://mutschler.eu/dynare/).
- See supplementary material on [macroeconomic theory by Sang Seok Lee](https://sites.google.com/site/ssleeeconomist/teaching/506?authuser=0).
- This [HANDBOOK OF MACROECONOMICS (CHAPTER 9)](https://www.sas.upenn.edu/~jesusfv/FVRS_Handbook.pdf) provides an overview of solution and estimation techniques for DSGE models. The authors cover the foundations of numerical approximation techniques as well as statistical inference and they survey the latest developments in the field. This is an advanced reference for further study.
- The [`dsge_content/readers`](dsge_content/readers) folder contains additional material on the DSGE and empirical topics covered in the training.

## Schedule
### DSGE training and tutorial sessions

The outline below gives the teaching blocks and indicative allocations. See the [detailed workshop schedule and participant guidance](https://github.com/hollander03/dsge-training/tree/main/training/admin) for the current programme.

- **[Block 1]** Introduction to DSGE models and Dynare
1. Slack, GitHub and MATLAB/Octave setup with Dynare (0.5 session)
2. Introduction to modern macroeconomic models (Solow & RCK) (1.5 sessions)
3. Real business cycle models in Dynare (2 sessions)

- **[Block 2]** Modern DSGE models and estimation
4. New Keynesian models in Dynare (2 sessions)
5. Solving the basic New Keynesian model (2 sessions)
6. Bayesian estimation of DSGE models (2 sessions)

- **[Block 3]** Identification of DSGE model parameters, optimal policy and best practices
7. Identification in Dynare (1 session)
8. Optimal policy in Dynare (1 session)
9. Best practices in Dynare (1 session)

- **[Option]** Specialised topics
10. Optimal taxation in DSGE models (1 session)
11. Small open economy DSGE model (1 session)
12. Financial accelerator (1 session)
13. Medium-scale DSGE model (1 session)

These blocks include practical DSGE and empirical exercises; see [Tutorials](#tutorials).

## Tutorials

The [`dsge_content`](dsge_content) folder provides the workshop material. The [`macro_course_material`](macro_course_material) folder remains a standalone advanced macroeconomics course based on Romer, with its own MATLAB and Dynare exercises. Session numbers refer to the organisation within each teaching path; use the topics below to locate material across them.

| Topic | Workshop material | Related course material |
|---|---|---|
| Preparation and introductory practice | [Session 0](dsge_content/sessions/session_0), including the [MATLAB primer](dsge_content/sessions/session_0/matlab_primer) and [Dynare practice](dsge_content/sessions/session_0/dynare_practice) | [Preparation](macro_course_material/matlab-dynare/0.session_pre) |
| Growth: Solow, RCK, NCG and OLG | [Session 1](dsge_content/sessions/session_1) contains NCG and OLG examples; use the linked course material for Solow and RCK | [Growth models and guide](macro_course_material/matlab-dynare/1.session_growth), including [Solow](macro_course_material/matlab-dynare/1.session_growth/Solow_model) and [RCK](macro_course_material/matlab-dynare/1.session_growth/RCK_model) |
| Basic RBC model and estimation | Start with the [user-guide examples and run instructions](dsge_content/codes/Basic_RBC); [Session 2](dsge_content/sessions/session_2) contains additional teaching material, including the [RBC slides](dsge_content/sessions/session_2/slides/Hansen_basicrbc_slides.pdf) | [RBC session](macro_course_material/matlab-dynare/2.session_rbc) |
| Optional reference: RBC extensions and monetary models | [Session 3](dsge_content/sessions/session_3), including [cash-in-advance and money-in-utility examples](dsge_content/sessions/session_3/code/cia_miu) | [Monetary models](macro_course_material/matlab-dynare/3.session_miu) |
| New Keynesian models | [Session 4](dsge_content/sessions/session_4), with [slides](dsge_content/sessions/session_4/slides/NKM-dynare-slides.pdf) and [model guidance](dsge_content/sessions/session_4/README.md) | [New Keynesian session](macro_course_material/matlab-dynare/4.session_nk) |
| Fiscal and monetary policy applications | [Session 5](dsge_content/sessions/session_5) | Related policy experiments appear alongside the course models |
| Estimation and identification | [Basic RBC estimation instructions](dsge_content/codes/Basic_RBC) and [identification readings](dsge_content/readers/identification) | [Estimation session](macro_course_material/matlab-dynare/5.session_estimation) |

### Workshop practical sequence

The core pathway is **growth → RBC → New Keynesian models**. Folder numbers are retained; session 3 is optional reference.

- **[Growth](dsge_content/sessions/session_1/README.md):** selected Practicing Dynare fiscal exercises, connecting nonlinear equations, steady states and transition paths.
- **[RBC](dsge_content/sessions/session_2/README.md):** a 60–90-minute group practical, choosing fiscal applications with the facilitator-supplied flexible-price model or a model–data comparison with supplied data or a FRED download.
- **[New Keynesian models](dsge_content/sessions/session_4/README.md):** monetary transmission, policy rules and nominal-level determination, including the monetary-regimes application.

Each practical follows the same sequence: run and understand the baseline; state a question and predict its mechanism; make a focused change or comparison; interpret the result and limitations; present the main finding.

The [detailed workshop schedule](admin/README.md) specifies which examples and exercises will be used.

- **Optional supplementary resource:** [Practicing_Dynare_Fiscal_Policy](https://github.com/hollander03/Practicing-Dynare-NT) contains fiscal-policy exercises based on Ljungqvist and Sargent. These small DSGE/RBC models provide practice with taxes, government spending and anticipated versus unanticipated policy changes. The accompanying Overleaf project is named “Practicing Dynare Fiscal Policy”, with the main TeX file `practice_dynare_FP.tex`. These exercises supplement the core workshop materials.
