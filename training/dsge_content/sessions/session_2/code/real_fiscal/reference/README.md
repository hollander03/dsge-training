# Research references: not the workshop run folder

These files are retained from the facilitator's research directory. Text line endings and trailing whitespace are normalised; equations and code content are preserved. Run the simulation from the [parent folder](../README.md), not by running arbitrary files here.

- `ntdsge_real.mod`: selected research source; its original active workflow performs estimation and requires external data and a mode file. Those estimation inputs are not required or included for the workshop simulation.
- `SAFiscal_fiscalrstar_flexible2.mod`: earlier fixed-calibration simulation; its 54 model equations match the real block used in the selected source after comment/whitespace normalisation.
- `SAFiscal_fiscalrstar_flexible2_includemod.mod` and `SAFiscal_fiscalrstar_flexible2_includevar.mod`: the corresponding real block included in later nominal/flexible-gap models; not standalone programs.
- `SAFiscal_fiscalrstar_flexible_n.mod`: older suffixed flexible-price model with active open-economy equations. It fails current Dynare preprocessing because `fiscalr_n` has no active defining equation. It is not the chosen baseline.
- `SAFiscal_fiscalrstar_flexible_n_steadystate.m`, `SAFiscal_ss.m`, `SAFiscal_ss_equations.m`: the older nonlinear steady-state chain. The wrapper uses a legacy global Dynare API and a function name different from its filename. It has not been modernised or validated here. It is not needed by `real_fiscal.mod`.

No generated Dynare packages, MCMC output or research data have been copied. See [MODEL_REVIEW.md](../MODEL_REVIEW.md) for the comparison and its limits.
