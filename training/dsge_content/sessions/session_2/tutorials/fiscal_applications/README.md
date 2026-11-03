# RBC fiscal applications: group practical

Choose one focused fiscal question for the available 60–90 minutes. There are two routes, depending on how much model structure the group is ready to use.

## Route A: extend a growth model

Build on the fiscal NCG/RCK applications discussed in [session 1](../../../session_1/README.md) and the facilitator-selected Practicing Dynare fiscal exercises. Introduce or vary one tax or spending instrument, identify its financing arrangement, and interpret the steady state and transition path. This is the more accessible route for groups still consolidating the growth and RBC material.

## Route B: use the fuller real fiscal DSGE model

The [fixed-calibration real fiscal model](../../code/real_fiscal/README.md) brings private/public capital, household heterogeneity, debt, transfers and three distortionary taxes into one flexible-price framework. It is an optional advanced application, with an RBC-style real core; it is broader than the basic Hansen RBC model. Its original equations and calibration are retained.

Run `dynare real_fiscal` from `../../code/real_fiscal`, then `plot_real_fiscal_irfs('etag')` for a government-consumption shock. The [run guide](../../code/real_fiscal/README.md) lists all six instruments and their innovation names. No estimation, observed data or external steady-state solver is required for the fixed-calibration simulation.

Choose just one comparison, for example:

- How does government-consumption shock persistence affect output, consumption, investment and debt? The supplied `compare_real_fiscal_persistence` helper varies shock persistence while holding instrument smoothing fixed.
- How do Ricardian and non-Ricardian consumption respond to a transfer or spending shock?
- How does one debt-feedback coefficient change the financing and adjustment after a fiscal shock?
- What are the qualitative differences between one spending shock and one tax shock? Start with their signs and mechanisms; the source shock sizes differ, and tax normalisation must be checked before comparing equal-cost interventions or multipliers.

The model retains all six endogenous fiscal rules, even when the group studies one innovation. Choosing one tax and one spending instrument for discussion does not switch off the other financing responses. Leave structural simplification and steady-state recalibration for later work. The [model review](../../code/real_fiscal/MODEL_REVIEW.md) explains the inherited resource constraints, tax units and comparison with the research versions.

## Present the finding

First run and understand the baseline. State the question and predict its mechanism, make one focused comparison, then interpret the result and limitations. Keep other assumptions fixed where possible. Report the innovation size, units, calibration and financing responses; distinguish impact effects from later adjustment.

Prepare one clear result and economic explanation. A literature review or comprehensive model description is unnecessary. Follow the [workshop presentation guidance](../../../../../admin/README.md).
