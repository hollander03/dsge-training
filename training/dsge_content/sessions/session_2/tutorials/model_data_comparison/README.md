# RBC output–data comparison: group practical

Use the [master’s tutorial](masters_rbc_tutorial.pdf) as background, but follow this shorter 60–90-minute workshop exercise. The handout's `Hansen_basicrbc_FULL.mod` reference corresponds here to [basicrbc.mod](../../code/basic_rbc/basicrbc.mod). Its course submission instructions, broader variable requirements and multi-variable plots do not apply to this output-only exercise.

## Saved quarterly data

The [data folder](data) contains the existing FRED CSV snapshots from the macro course examples. Both countries can be compared over **1993Q1–2024Q4 (128 quarters)**.

| Country | Saved file and FRED series | Interpretation |
|---|---|---|
| United States | [us_rgdp_pc.csv](data/us_rgdp_pc.csv), `A939RX0Q048SBEA` | Real GDP per capita; the full saved series starts in 1947Q1. |
| South Africa | [sa_rgdp.csv](data/sa_rgdp.csv), `NGDPRSAXDCZAQ` | Aggregate real GDP; the saved series starts in 1993Q1. |

The common endpoint is the last observation in the saved snapshots, not a claim that the data are current. US output is per capita and South African output is aggregate, so compare cyclical log deviations rather than levels, and discuss that coverage difference. `rgdp_pc.csv` is the duplicate US snapshot used by the first transformation illustration.

## Transformations and downloads

In MATLAB, run `rbc_data_clean` from this folder. It uses saved data by default, restricts the sample to the common window, and illustrates log differences, linear detrending, two-sided HP filtering and one-sided filtering. MATLAB's `hpfilter` returns **`[trend, cycle]`**. This example requires Econometrics Toolbox and MATLAB functionality including tables and dates. The built-in one-sided option requires MATLAB R2023a or later; the script was checked with R2024a.

For the download/API exercise, set `download_data=true` near the top of the script. The `websave` calls demonstrate FRED's HTTP CSV endpoint and its `id=` series query; no API key is needed. This is CSV download access, not the keyed FRED web-services API. New files are saved under `downloaded_data`, leaving the supplied snapshots intact. Use a working copy, inspect the downloaded headers and dates, and record the sample/data vintage before comparing results. No download is needed for the core practical.

**Octave participants:** run `results = rbc_output_moments();`. This small offline helper works in base Octave and MATLAB, reads the saved CSVs, and computes two-sided HP output cycles with `lambda=1600` and their moments. It solves the usual HP linear system directly, without tables, `datetime` or an `hpfilter` package. Use MATLAB for the richer download/one-sided demonstration, or review it alongside the offline helper. The helper's two-sided cycles have been checked against MATLAB's `hpfilter` on these snapshots.

## Model moments: retain the default, identify the filter

Run the baseline with `dynare basicrbc` from its [code folder](../../code/basic_rbc). Its existing `stoch_simul` commands use 200 simulated periods and no HP filter. These **default unfiltered simulated moments remain available**; the workshop has not changed the model or inserted filtering into its commands. Its parameter/seed examples also show that finite-sample moments can vary between simulations.

For an optional comparison using the same two-sided HP convention as the data, Dynare offers two routes:

- `hp_filter=1600` with `periods=0`: theoretical filtered moments, calculated from the solution spectrum. This does **not** require manually simulating and filtering a series.
- `hp_filter=1600` with `periods>0`: moments based on a filtered finite simulation. Report its length, seed and burn-in. Dynare's `drop` option excludes observations from reported simulated moments, but does not remove them from `oo_.endo_simul`.

For example, after the baseline has run, use the MATLAB/Octave Dynare API to request the theoretical benchmark without editing the `.mod` file or replacing `options_`:

```matlab
moment_options = options_;
moment_options.periods = 0;
moment_options.irf = 0;
moment_options.noprint = false;
moment_options.hp_filter = 1600;
moment_options.one_sided_hp_filter = 0;
[info, hp_results] = stoch_simul(M_, moment_options, oo_, {'y'});
assert(info(1) == 0);
```

To request unfiltered theoretical moments instead, set `moment_options.hp_filter=0` and call the same function. Keep these results separately from the baseline's simulated moments. The theoretical and finite-sample filtered moments use the same HP convention, but need not be numerically identical because of sampling and endpoints.

Dynare's **`one_sided_hp_filter=1600` is supported only for simulated moments** (`periods>0`), not theoretical moments. Treat it as an optional further comparison. Do not assume its initialisation is identical to MATLAB's one-sided filter or to a repeatedly refitted two-sided filter. The default core comparison uses two-sided HP; the one-sided illustration does not change the RBC model.

## Core exercise: 60 minutes

1. **0–15 minutes:** run the baseline; identify the technology shock and explain the output IRF.
2. **15–35 minutes:** obtain US and South African output cycles from the saved data. Report the mean, standard deviation of `100 × cycle`, and first-order autocorrelation. Compare these with a clearly labelled model benchmark: default unfiltered simulated moments, or the optional matched two-sided-HP benchmark. An unfiltered model benchmark versus filtered data is a convention comparison, not a matched-filter test.
3. **35–60 minutes:** choose one parameter, predict its effect, rerun the model and explain the result. Prepare one output-moments table and the main finding.

With output alone, its standard deviation relative to itself and its correlation with itself are both one, so they add no information. Do not use the correlation of an arbitrary simulated output path with the historical path as a measure of fit. The estimation file `data9519.m` contains growth observations and is not used as a detrended-level dataset here.

## If 90 minutes are available

Use the extra time for a second calibration, a filtering-convention comparison, or the HTTP download exercise. Estimation and a broader consumption/investment/hours dataset are further extensions.

Conclude with what the model captures, what it misses, and which assumptions could explain the difference. Follow the [presentation guidance](../../../../../admin/README.md).
