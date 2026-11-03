# Equation review

## Reference system

Compared directly with the rendered paper section 2.1 (printed page 1810; PDF page 5), supplementary appendix B.4.4 (page 17), and NK slide 35. The paper and appendix contain the same twelve-equation core. Dynare leads represent conditional expectations in these linear rational-expectations models.

| Paper | Appendix | Code equation or mapping |
|---|---|---|
| (5) Fisher relation | (B.30) | `int = pii(+1) + rn + eta_c*(ytilde(+1)-ytilde)` |
| (6) Money demand | (B.31) | `m-p = (eta_c/eta_m)*y - int/eta_m + xi_md` |
| (7) Euler equation | (B.32) | `r = rn + eta_c*(ytilde(+1)-ytilde)` |
| (8) Natural rate | (B.33) | `rn = eta_c*(yn(+1)-yn)` |
| (9) Broad money supply | (B.34) | `m = h + (1/effrr)*(h-fr) + xi_ms`; `effrr=1/(FR/RR)`, so `1/effrr=FR/RR=phi_rr` |
| (10) Reserve supply | (B.35) | `h = rho_h*h(-1) - nu_h*(int-int_T)` |
| (11) Free reserves | (B.36) | `fr = rho_fr*fr(-1) - (nu_fr/s)*(int-int_T)` |
| (12) Target rate | (B.37) | `int_T = rho_i*int_T(-1)+(1-rho_i)*(kapa_pi*pii+kapa_y*ytilde)+epsil_i` |
| (13) NK Phillips curve | (B.38) | `pii = betta*pii(+1)+kapatilde*ytilde`; `kapatilde=(1-theta_p)*(1-theta_p*betta)/theta_p*(eta_n+eta_c)` |
| (14) Output gap | (B.39) | `ytilde = y-yn` |
| (15) Natural output | (B.40) | `yn = (1+eta_n)/(eta_c+eta_n)*xi_z` |
| (16) Inflation | (B.41) | `pii = p-p(-1)` |

The simulation, 2020 estimation and estimated forecast contain all twelve core equations. Their AR(1) shock processes, measurement equations and reporting variables add equations without replacing this core. This checks the coded reduced-form system against the published system; it does not rederive every condition from household and firm optimisation.

## Differences between selected examples

- Simulation adds an AR(1) `xi_fr`, but its coefficient in the free-reserve equation is commented out and its innovation variance is not activated. It does not change the twelve-equation core.
- Calibrated forecast activates `-xi_fr` in the free-reserve equation. This is an additional reserve-demand disturbance beyond paper equation (11), although its shock variance is not activated in the selected calibration. Its other eleven core equations match.
- Estimation and estimated forecast have the same twelve-equation core and the same four measurement equations. The latter adds `int_gap=int-int_T` for reporting. Data window and estimation settings differ.
- The archived historical OSR (`osr/reference`) replaces equation (10) by `h=-v` and adds `xi_p` to equation (13), with a markup-shock innovation standard deviation of `0.01`. The paper expressly excludes this markup shock in its baseline. This is an alternative policy experiment, not the published baseline.
- In the OSR file, `rho_h=0` does not enter the active reserve equation. With `nu_h=nu_fr=0`, the policy-rate target does not feed back into the market rate, reserves or the loss targets. Thus the requested OSR parameters `rho_h`, `rho_i`, `kapa_y` and `kapa_pi` cannot meaningfully optimise the stated loss. Preserve the file for provenance; resolve the intended policy specification before using it as a teaching optimum.

## Auxiliary equations requiring care

All selected originals define `v=int/eta_m+(1-eta_c/eta_m)*y`. Combining paper equation (6) with `v=p+y-m` instead gives that expression **minus `xi_md`**. Appendix B.4.1 explicitly suppresses the money-demand shock for its velocity derivation. The saved code keeps that shock-free expression even when `xi_md` is active. This does not feed back into the paper's core in the simulation or estimation examples, but it changes reported velocity; in the historical `h=-v` OSR experiment it also affects policy transmission. The originals are preserved.

The reporting equations `y=xi_z+alppha*n` and `rmc=(1+eta_n)*n+(eta_c-1)*y` do not enter the gap-form Phillips curve. With `alppha` different from one, setting this reported `rmc` to zero does not in general reproduce the separately specified paper equation for `yn`. Treat `n` and `rmc` as inherited auxiliary diagnostics, rather than claim they jointly establish the paper's microeconomic derivation. No auxiliary equation has been silently repaired.

## Relation to slide 35 and the workshop baseline

Slide 35 is a reduced extension: broad money is `(1+phi_rr)*h`, free reserves are omitted, and `xi_ms` enters the reserve-supply equation. The full paper instead has `phi_rr*(h-fr)` and places `xi_ms` in broad money supply. They are not the same stochastic specification, even if `phi_rr=0`; shock placement must also be matched.

For an eventual teaching bridge from `NKM.mod`, introduce a distinct target rate `int_T` and reserve variable `h`, replace the direct rule for the market rate with the reserve-market mechanism, and choose either the slide's reduced mechanism or the paper's full `h/fr` mechanism. Retain the Fisher relation to determine the market rate. Do not retain both a direct market-rate Taylor rule and a separate reserve system as independent closures.

The current workshop baseline also uses `iss=1/betta` in its money-demand interest coefficient (`betta/eta_m`), whereas the paper uses `1/eta_m`; it has an AR(1) policy shock and a markup shock, while the paper has an i.i.d. target-rate innovation and no baseline markup shock. Calibrations differ. These choices need explicit reconciliation before declaring a transformed workshop model equivalent to the paper. This collection therefore uses the original research models rather than an unverified reconstruction.

## Paper-based teaching adaptations

`simulation/hc_monetary_regimes.mod` derives from the preserved simulation source. `REGIME=1` sets `nu_h=nu_fr=12`, `REGIME=2` sets both to `1`, and `REGIME=3` uses the second case with `theta_p=0.0001`. This follows section 5.1 / Table 2; a small positive Calvo parameter approximates the flexible-price limit without dividing by zero in the Phillips-curve slope. It adds 1–20-quarter forecast-error variance decompositions. The twelve core equations remain unchanged.

`osr/hc_monetary_osr.mod` also derives from the paper-core simulation, rather than the disconnected velocity experiment. It retains the twelve equations, restores `nu_fr=11.61` from Table 1, adds `nomy=p+y`, and uses the identity-consistent velocity definition. It minimises the stationary inflation/output-gap loss of equation (17) with `omega=kapatilde/10`; the price elasticity of 10 is inherited from the historical OSR file. The optimised parameters match those listed in section 5.3: `rho_h`, `nu_h`, `rho_i`, `kapa_pi`, `kapa_y`. All four baseline shocks remain active, and no markup shock is added. Bounds, fixed seed and CMA-ES are explicit teaching choices. The resulting solution is not asserted to be the paper's reported optimum or a global optimum.

`simulation/hc_monetary_optimal_benchmark.mod` implements equation (19) for the **market rate**, not merely `int_T`. It removes the reserve-supply subsystem (`h`, `fr`, `int_T` and their closure), retains money demand as a passive determination of nominal money, and adds `int=rn+kapa_pi*pii+kapa_y*ytilde`. The replaced policy-target innovation is removed. It retains shock processes for money supply/free reserves as inherited diagnostics, which no longer feed back under this benchmark closure. It also uses identity-consistent velocity and adds nominal income. Technology changes natural output, while inflation and the output gap remain zero; money-demand shocks are accommodated by nominal money. This is the efficient interest-rate benchmark, not a separate claim about the reserve implementation of that benchmark.

The [benchmark record](BENCHMARKS.md) distinguishes paper-motivated checks from exact numerical replication. In particular the selected 2020 estimation source uses 94 observations, compared with 95 reported for the corresponding Table 1 sample; this is preserved and flagged rather than silently changed.

## Fuller historical-decomposition example and execution defaults

`historical_decomposition/hc_monetary_historical_decomposition.mod` derives from `Model2020/CH2020Est5907m4.mod`. Its model block and priors are retained, including the twelve-equation core and measurement equations. Relative to the Great Moderation example, it uses `FR=0.12`, `RR=38.62`, different sample-mean constants and the first 194 data rows. Its source pairs this with `CH2018mvpyEst5907Hetzel_mode.mat`; that specific vector and Hessian are included under a distinct name. The decomposition command now requests all variables in its plot command, rather than only `m`.

The two estimation/decomposition examples and the estimated forecast now use saved-mode evaluation with zero MCMC replications by default. This changes execution and parameter-summary choices, not equilibrium equations. Full posterior-mode optimisation and sampling are available as commented alternatives; the default is not a new estimate or a posterior-mean replication. The fuller source's 194-observation window also requires endpoint reconciliation before exact comparison with the paper's Figures 4–6.
