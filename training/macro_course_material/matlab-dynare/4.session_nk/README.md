# New Keynesian models

Start with `basicNKMtidy.mod`, which compares sticky-price and flexible-price outcomes and includes technology, cost-push and monetary policy shocks. Run the following commands from this folder with Dynare configured:

```matlab
dynare basicNKMtidy
plot_NK_IRFs
```

The plotting script shows each shock separately and a combined monetary-transmission figure. Rates and inflation are shown in annualised percentage points; the output gap and other log-deviations are shown in per cent. The script also exports PNG figures to the current folder.

## Suggested exercises

1. Trace how a monetary policy shock affects the nominal rate, real rate, output gap and inflation.
2. Compare technology and cost-push shocks with the monetary policy shock.
3. Compare interest-rate smoothing while holding shock persistence fixed. Run `run_and_plot_dual_rhoi` to compare interest-rate smoothing of 0.75 and 0 after a technology shock. It restores the baseline model and results afterwards.
4. Introduce optimal simple policy rules after discussing the choice of targets and weights.

## Variants and interpretation

`basicNKM.mod` is a smaller technology-shock example. The workshop folder contains a separate optimal-policy exercise.

The non-stationarity of nominal money and the price level is an explicit teaching point. Compare their impulse responses with inflation, real money balances and real activity: under the baseline policy rule, nominal levels need not return to their initial values, even when inflation and real variables do. Their undefined unconditional variances illustrate this distinction rather than a failed simulation.

Use the [New Keynesian slides](0.%20notes/NKM-dynare-slides.pdf) to discuss nominal-level determination and monetary policy regimes, followed by Hollander and Christensen (2022): [paper](0.%20notes/HC_NK_monetary/2022-HC-monetary-regimes-PRINT.pdf) and [supplementary appendix](0.%20notes/HC_NK_monetary/HC2020-MD-SuppAppendix.pdf).
