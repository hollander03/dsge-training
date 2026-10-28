# DSGE - Training

[`Overview`](#overview) | [`Resources`](#resources) | [`Schedule`](#schedule) | [`Tutorials`](#tutorials) |

Training materials for modern macroeconomic theory and computational methods, supporting research and capacity building.

The user guide can be found in the [`dsge/0.user_guide`](https://github.com/hollander03/dsge-training/tree/main/dsge/0.user_guide) subdirectory. This folder contains the user guide, the Dynare Manual, and additional resources to understand and implement DSGE models in Dynare. The most up-to-date user guide version will be maintained in this [Google Doc](https://docs.google.com/document/d/1mAzQPIP47KYYNsGOvcBHuVgZHptjEdJH/edit). Please check before downloading. Anyone with the link can comment.

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
- The `readers` folder contains additional material on the DSGE and empirical topics covered in the course.

## Schedule
### DSGE training and tutorial sessions

The outline below gives the teaching blocks and indicative allocations. See the [detailed workshop schedule and participant guidance](https://github.com/hollander03/dsge-training/tree/main/training/admin) for the current programme.

- **[Block 1]** Introduction to DSGE models and Dynare
1. Slack, GitHub and MATLAB/Octave setup with Dynare (0.5 session)
2. Introduction to modern macroeconomic models (0.5 session)
3. Real business cycle models in Dynare (2 sessions)

- **[Block 2]** Modern DSGE models and estimation
4. New Keynesian models in Dynare (2 sessions)
5. Solving the basic New Keynesian model (2 sessions)
6. Bayesian estimation of DSGE models (2 sessions)

- **[Block 3]** Identification of DSGE model parameters, optimal policy and best practices
7. Identification in Dynare (1 session)
8. Optimal policy in Dynare (1 session)
9. Best practices in Dynare (1 session)

- **[Option]** Specialized topics
10. Optimal taxation in DSGE models (1 session)
11. Small open economy DSGE model (1 session)
12. Financial accelerator (1 session)
13. Medium-scale DSGE model (1 session)

These blocks include practical DSGE and empirical exercises; see [Tutorials](#tutorials).

## Tutorials

- Resources for practical tutorials can be found in [~/training/macro_course_material](https://github.com/hollander03/dsge-training/tree/main/training/macro_course_material) and [~/training/dsge_content](https://github.com/hollander03/dsge-training/tree/main/training/dsge_content).
- **Optional supplementary resource:** [Practicing_Dynare_Fiscal_Policy](https://github.com/hollander03/Practicing-Dynare-NT) contains fiscal-policy exercises based on Ljungqvist and Sargent. These small DSGE/RBC models provide practice with taxes, government spending and anticipated versus unanticipated policy changes. The accompanying Overleaf project is named “Practicing Dynare Fiscal Policy”, with the main TeX file `practice_dynare_FP.tex`. These exercises supplement the core workshop materials.
