# Macro-econometrics for policy applications

This directory houses participant-facing material for applied macroeconomic time-series work. It complements the DSGE materials in `../ntdsge_content`; it does not duplicate the National Treasury DSGE model in `../../dsge`.

The first implementation target is a Master’s-level, application-led pathway for the 2026 NT workshop. See the [curriculum map](CURRICULUM_MAP.md), [econometrics reading log](READING_LOG.md), and [software compatibility standard](SOFTWARE_COMPATIBILITY.md).

## How to use this directory

- `tutorials/` contains runnable exercises and their data.
- `readings/` will contain a curated, permission-cleared reading list and links; it should not become an uncurated dump of copyrighted books or papers.
- `reference_slides/` will contain facilitator-owned or permission-cleared slides that support, rather than replace, the practical exercises.
- `archive/` is for deprecated or superseded material only. Do not place live teaching material there.

## Workshop pathway

1. Reproducible data handling, dynamic relationships and transformations.
2. Univariate benchmarks, forecasting and forecast evaluation.
3. The move from univariate methods to VAR/SVAR methods and structural identification for a fiscal-policy question.
4. DSGE observables, measurement equations, identification and scenario analysis.
5. Team mini-projects, presentations and continuation plans.

The existing `tutorials/econometric_research` material is valuable preliminary content: it links data preparation, univariate/multivariate workflows, VARs and Bayesian VARs. It is reference material until each activity has a documented plain-`.m`/GNU-Octave route.

## Software rule

Core exercises must run with GNU Octave and, where needed, Dynare. MATLAB, Econometrics Modeler and BEAR may be used as optional enhancements, but are not prerequisites. Each approved exercise should have a simple run instruction, declared inputs, expected outputs and a planned R equivalent.
