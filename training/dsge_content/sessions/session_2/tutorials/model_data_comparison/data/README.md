# Saved output data

Unmodified CSV snapshots copied from `training/macro_course_material/matlab-dynare/2.session_rbc`. The source files are dated 23 April 2025 and end in 2024Q4.

- `us_rgdp_pc.csv`: FRED [A939RX0Q048SBEA](https://fred.stlouisfed.org/series/A939RX0Q048SBEA), US real GDP per capita, 1947Q1–2024Q4 (312 observations).
- `rgdp_pc.csv`: identical US snapshot used by the original transformation example.
- `sa_rgdp.csv`: FRED [NGDPRSAXDCZAQ](https://fred.stlouisfed.org/series/NGDPRSAXDCZAQ), South African aggregate real GDP, 1993Q1–2024Q4 (128 observations).

The practical uses their common 1993Q1–2024Q4 window. The snapshots have positive, non-missing numeric observations at uninterrupted quarterly dates. Keep their original units distinct; comparisons use log cycles, not cross-country output levels. Refreshing or extending the sample changes a two-sided HP filter's endpoint estimates.
