# New Keynesian group practical

Run the baseline from `../code/baseline` and use the [slides](../slides/NKM-dynare-slides.pdf). Follow the same sequence as the RBC practical: understand the baseline, choose one question, predict the mechanism, run a focused comparison and interpret the result.

Choose a technology, cost-push or monetary-policy shock, a policy-rule change, or a monetary-regime comparison supported by the model. Separate interest-rate smoothing from shock persistence. Use the [course comparison script](../../../../macro_course_material/matlab-dynare/4.session_nk/run_and_plot_dual_rhoi.m) for the smoothing exercise, running it from its own course folder.

For a focused core group question, choose one:

- How does a monetary-policy tightening affect the nominal rate, real rate, output gap and inflation? Predict the sequence and explain the transmission mechanism.
- How does interest-rate smoothing change the technology-shock response? Use the course comparison script and hold shock persistence fixed.
- How do the inflation/output-gap responses to a cost-push shock differ from those to a monetary-policy shock? Explain the source of the policy trade-off.

Compare inflation and real activity with nominal money and the price level. Discuss why nominal levels need not return to their original values, drawing on the monetary-regimes paper and appendix linked in the [session guide](../README.md). This is a teaching feature of the model, not an error to remove.

For optimal simple rules, run the separate model from `../code/optimal_policy` after discussing the objective and weights. Prepare one clear result, explain the mechanism and limitations, and follow the [presentation guidance](../../../../admin/README.md).

## Optional monetary-regime exercise

Use the appendix on **slide 35** of the [NK slides](../slides/NKM-dynare-slides.pdf) to introduce the distinction between the market interest rate and the policy-rate target, and the role of reserve supply. Then choose one focused application from the [Hollander–Christensen examples](../code/HC_NK_monetary/code/README.md):

| Route | Question and suggested comparison |
|---|---|
| Simulation: two monetary regimes | Use `simulation/hc_monetary_regimes.mod` with `REGIME=1` and `REGIME=2`. How does reducing reserve elasticities from `(12,12)` to `(1,1)` change the output and inflation responses to a money-supply shock? Relate the comparison to paper section 5.1 / Table 2. |
| Flexible-price benchmark | Compare `REGIME=2` with `REGIME=3`, which keeps the monetary regime fixed and makes prices nearly flexible. What happens to the real effects of monetary shocks? This is a price-flexibility benchmark, not a third monetary regime. |
| Optimal policy | Compare the paper-based `osr/hc_monetary_osr.mod` with `simulation/hc_monetary_optimal_benchmark.mod`. Discuss the inflation/output-gap loss, policy bounds and the role of the natural rate in the efficient Taylor rule. See section 5.3 / Figures 9–10. |
| Historical decomposition | Run `historical_decomposition/hc_monetary_historical_decomposition.mod` using its supplied mode. Choose one episode and interpret contributions from technology, policy-target, money-supply and money-demand shocks. Relate the approach to section 4.3 / Figures 4–6, retaining the documented sample-endpoint caveat. |
| Conditional forecast | Start with the calibrated forecast, or use `conditional_forecast/hc_monetary_estimated_forecast.mod` with its saved mode. Compare the imposed interest-rate path with the commented inflation-path alternative, using one constraint at a time. See section 5.2 / Figures 7–8. |

Paths in the table are relative to the extension's [code folder](../code/HC_NK_monetary/code). Follow its run instructions and [benchmark notes](../code/HC_NK_monetary/code/BENCHMARKS.md). The estimated forecast and historical-decomposition defaults reuse saved modes without optimisation or MCMC; commented alternatives allow full estimation reruns. These mode-based exercises do not integrate over posterior parameter uncertainty.

The supplied research examples retain the **full paper model**, including free reserves. They have not been reduced to slide 35's simplified extension, which omits free reserves and places the money-supply shock differently. The [run instructions](../code/HC_NK_monetary/code/README.md) describe the separately named regime and policy variants. Treat the slide as a conceptual introduction; use the supplied files for the selected exercise rather than assume exact equivalence to the baseline `NKM.mod`.

Keep the group exercise bounded: state one question, predict the mechanism, present one interpretable comparison and explain its limitations. Longer estimation and forecasting applications can be reserved for further study.
