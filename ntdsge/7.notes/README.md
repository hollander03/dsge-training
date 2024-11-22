# To-Dos:

Work with the simulation code first (i.e., the code that doesn't estimate the model. So note that there will be some minor differences when you compare to original and updated versions using the `compare` tab in MATLAB).

## Model documentation objectives

- (1) Complete latex short names and long names for parameters and variables; check latex output of equations and tables. 
- (2) Document descrepencies between current code and original working paper appendix and original 2020 *code* (: equations, calibrations, observed variables, ...
- (3) Generate code to output/correspond with equation numbers in a new Technical Appendix (i.e., adapt the latex output from Dynare into a formal Technical Appendix).

## Efficiency objectives

- (1) Create more efficient code layout, e.g.: string match estimated parameters for simulating model on estimated parameters; Epilogue block; seperate `.mod` file for model blocks). 
- (2) Automate data input (API, transformations, demean, and calibration based on data). 
- (3) Produce standardised model for `simulation`, `estimation`, `osr`, and `forecast` applications that call on the same core files (steady state, data, calibration, model blocks).

## Extensions objectives

- (1) Produce a simplified version of the model. For example, shut off open economy nominal rigidities, exports and imports, foreign block.
- (2) Add a flexible price equilibrium to this simplified model. The aim here is to produce a simpler model to work with potential alternatives and for forecasting. We will also compare the results to the larger model (which doesn't have a flex price equilibrium yet).

## Delegation

- Someone on team to get data for estimation, and automate. Keep track of sources for raw data and the transformations from raw data into final format. Note the effective tax rate calculations. Hylton to upload excel spreadsheet for comparison.
