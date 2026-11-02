# RBC model–data comparison: group practical

Use the [master’s tutorial](masters_rbc_tutorial.pdf) as background. For this workshop, follow the shorter exercise below; its course submission instructions do not apply. Work in your assigned group for 60–90 minutes.

## Inputs and preparation

Use the [baseline model](../../code/basic_rbc/basicrbc.mod). Data will be supplied by the facilitator, or can be downloaded using the [FRED transformation example](rbc_data_clean.m). This example uses FRED's CSV download endpoint without an API key; it contains MATLAB-specific functions, including `hpfilter`. Octave users should use the supplied data and an agreed compatible transformation. Keep a saved dataset so downloading does not delay the practical.

Agree the country, sample, units and detrending method before calculating moments. Compare detrended model and data variables consistently. The estimation file `data9519.m` contains growth observations and is not a ready-made dataset of detrended levels. Do not interpret correlation between an arbitrary simulated path and historical observations as a measure of fit.

## Core exercise: 60 minutes

1. **0–15 minutes:** run the baseline; identify the technology shock and explain the main impulse responses.
2. **15–35 minutes:** compare standard deviations relative to output, first-order autocorrelations and correlations with output for the variables available in the supplied dataset. Distinguish theoretical moments from finite-sample simulated moments and report the transformation used.
3. **35–60 minutes:** choose one parameter, predict its effect, rerun the model and explain whether the result supports that prediction. Prepare one moments table and the main finding for your presentation.

## If 90 minutes are available

Use the extra 30 minutes for a second calibration or detrending comparison and presentation preparation. Estimation, collecting a new country dataset and adding new model equations are optional extensions rather than core requirements.

Conclude with what the model captures, what it misses, and which assumptions could explain the difference. Follow the [workshop presentation guidance](../../../../../admin/README.md).
