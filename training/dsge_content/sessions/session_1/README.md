# Growth models and fiscal applications

Study Solow, Ramsey–Cass–Koopmans (RCK) and neoclassical growth (NCG) models, connecting nonlinear equations, steady states and transition paths. The examples are available in this folder; see [Dynare help](../dynare_help) for software preparation.

## Model examples

| File | Purpose |
|---|---|
| [Solow_SS_transition.mod](Solow_model/Solow_SS_transition.mod) | Transition to the steady state from a different initial capital stock in a Solow–Swan economy with Cobb–Douglas production. |
| [Solow_growth_rate_changes.mod](Solow_model/Solow_growth_rate_changes.mod) | Transitions after unanticipated changes in technology or population growth. The imported README's correction is already applied: `TFP_growth` is defined as `1`. |
| [Solow_nonstationary.mod](Solow_model/Solow_nonstationary.mod) | Aggregate, non-detrended Solow model with growing labour-augmenting technology and population along a balanced growth path. |
| [Ramsey_Cass_Koopmans.mod](RCK_model/Ramsey_Cass_Koopmans.mod) | Transitions in an RCK economy with Cobb–Douglas production, expressed in aggregate form with technology and population growth. |
| [NCGmodel_sim.mod](NCG_model/NCGmodel_sim.mod) | Additional stochastic growth example with consumption, capital, labour and technology. |
| [NCGmodel_est.mod](NCG_model/NCGmodel_est.mod) | Estimation exercise using `simudata.mat`; review the exercise and model specification before use. |

The Solow examples use Dynare's perfect-foresight routines. Open MATLAB or Octave in the folder containing the chosen `.mod` file and run, for example, `dynare Solow_SS_transition`. Distinguish detrended variables from growing aggregate levels when interpreting results.

Supporting readings include the [RCK notes](RCK_model/2020_Carroll_RamseyCassKoopmans.pdf) and [NCG notes](NCG_model/neoclassical_growth_notes_sp17.pdf). The Solow and RCK code retains attribution to Johannes Pfeifer's model collection. See also the [standalone course growth material](../../../macro_course_material/matlab-dynare/1.session_growth).

## Group practical

For the group practical, work through selected fiscal applications in the [Practicing Dynare document](https://www.overleaf.com/project/692d6b9a27db12d5acaeb198), extending Solow and interpreting the resulting transition paths. The facilitator will identify the exercises for the available time.

Understand the baseline, choose a focused fiscal experiment, predict its mechanism, run the comparison and explain the result. The next core session, [RBC](../session_2), extends the analysis to business-cycle fluctuations and offers fiscal applications or a model–data comparison.

[Back to the training overview](../../../README.md)
