# Optional reference: RBC extensions and monetary models

This material is retained for further study. The core workshop proceeds from [RBC](../session_2) directly to [New Keynesian models](../session_4). Nonlinear formulation is introduced during growth, and the NK example already includes money in utility.

- [Nonlinear RBC](code/nonlinear_rbc): run `dynare rbc_nonlinear_stoch2` from this folder. Keep the `.mod`, `.inc` and steady-state helper together. This is an extension with different labour preferences and an additional disturbance, not automatically an equivalent version of the baseline RBC model.
- [Additional RBC example](code/nonlinear_rbc/RBCmodel_WM.mod): the Mutschler model is stored alongside the nonlinear RBC material.
- [CIA and MIU](code/cia_miu): run `dynare CIA` or `dynare MIU` from this folder to compare flexible-price monetary environments. [Comparison figures](code/cia_miu) support interpretation. CIA and MIU impose different assumptions and need not produce equivalent outcomes.

The [CIA and MIU slide sources](slides/source) include their appendices and required figures, retained for future teaching. These models remain optional: the core RBC → NK sequence already introduces money in utility. CIA can provide intuition about how a constraint and its multiplier affect decisions, before separately introducing borrowing or collateral constraints.

[Model notes](notes/README.md) distinguish the two RBC preference variants and provide CIA/MIU equation handouts aligned with the current code.
