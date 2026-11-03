# New Keynesian models

Start with [`NKM.mod`](code/baseline/NKM.mod), which compares sticky-price and flexible-price outcomes and includes technology, cost-push and monetary policy shocks. Run the following commands from `code/baseline` with Dynare configured:

```matlab
dynare NKM
plot_NK_IRFs
```

The plotting script shows each shock separately and a combined monetary-transmission figure. Rates and inflation are shown in annualised percentage points; the output gap and other log-deviations are shown in per cent. The script also exports PNG figures to the current folder.

## Suggested exercises

1. Trace how a monetary policy shock affects the nominal rate, real rate, output gap and inflation.
2. Compare technology and cost-push shocks with the monetary policy shock.
3. Compare interest-rate smoothing while holding shock persistence fixed. For the interest-rate smoothing comparison, use the [course comparison exercise](../../../macro_course_material/matlab-dynare/4.session_nk).
4. Introduce optimal simple policy rules after discussing the choice of targets and weights.

## Variants and interpretation

[`basicNKM.mod`](code/introductory/basicNKM.mod) is a smaller technology-shock example. [`basicNKMtidy.mod`](code/optimal_policy/basicNKMtidy.mod) is the optimal-policy extension: it runs `osr` automatically after the initial simulation.

The non-stationarity of nominal money and the price level is an explicit teaching point. Compare their impulse responses with inflation, real money balances and real activity: under the baseline policy rule, nominal levels need not return to their initial values, even when inflation and real variables do. Their undefined unconditional variances illustrate this distinction rather than a failed simulation.

Use the [New Keynesian slides](slides/NKM-dynare-slides.pdf) to discuss nominal-level determination and monetary policy regimes, followed by Hollander and Christensen (2022): [paper](code/HC_NK_monetary/2022-HC-monetary-regimes-PRINT.pdf) and [supplementary appendix](code/HC_NK_monetary/HC2020-MD-SuppAppendix.pdf).

## Monetary-regime extension

The [Hollander–Christensen examples](code/HC_NK_monetary) provide simulation, optimal simple rules, 2020 estimation and conditional forecasting. Read their [equation comparison](code/HC_NK_monetary/code/EQUATION_REVIEW.md) before relating the full reserve-market model to the reduced extension on slide 35. Historical originals are retained alongside a separately identified OSR teaching adaptation.

## Group practical

Use the [tutorial](tutorials/README.md) to investigate a shock, policy-rule change or monetary-regime comparison. This session follows RBC directly; the flexible-price CIA/MIU and nonlinear RBC examples in [session 3](../session_3) are optional reference.
