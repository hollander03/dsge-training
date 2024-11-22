# Data

[`Data`](#data) | [`Folders`](#folders) | 

## Data files

- ``data_request_06112023`` contains the raw macro and fiscal data. The first sheet "Transformations" pulls the data from the different sheets and calculates the log differences, differences, or % change used for estimation.

- ``2023_Estimation9323`` contains the transformed data used for estimation. MATLAB will read this file (or an equivalent .m file) when called for estimation purposes.

- ``Raw_data - original`` contains the original data set from Kemp & Hollander (2020). Although data was revised subsequently and there was a re-basing of the QB data, the series largely correspond and have not appeared to significantly influence results.

- ``data_revise_22012024`` contains Compensation of Employment and Employment series from SARB to get alternative remuneration per worker. Transformations are in this file as well. Take note of the series for wages and employment used in estimation. Must co-incide with QMOD.

## Folders 
- `SARB API Connector` is a MATLAB API to automatically retrieve data. We will implement this automation process in due course upon further investigation. Alternative options may be preferable. Note: the tax data is embargoed and must be retrieved via NT. NT team will also automate on their side via Econostat and internal system.

- `estimation` contains the data files in `.m` format used for estimation. `older` contains data for older estimations that are maintained for replication purposes (e.g., *ex ante* revised QB data).

- `meta` contains meta data information on variables. For example, ``QB Time Series Descriptions - December 2022`` contains a list of KBP codes for SARB data and ``00aVnames`` contains meta information from QMOD for the variable labels in ``data_request_MMDDYYYY``.
