# Dynare code for Growth models [![HT: JohannesPfeifer](https://github.com/JohannesPfeifer/DSGE_mod)]

## Solow_model

Various mod-files related to the basic Solow-Swan model, using Dynare's perfect
foresight routines to study steady state transitions when e.g. parameters change

### Solow_SS_transition.mod 
Studies the transition behavior of a simple Solow-Swan economy with Cobb-Douglas 
production function to its steady state when started with a capital stock different
from steady state.

### Solow_growth_rate_changes.mod 
Studies the transition behavior of a simple Solow-Swan economy with Cobb-Douglas production 
function after unanticipated for changes in technology or population growth.

["note:" error in code; replace "true" with "1" where macro ''*TFP_growth*'' is defined.]

### Solow_nonstationary.mod 
Studies the transition behavior of a simple Solow-Swan economy with Cobb-Douglas production 
function to its balanced growth path (BGP). The Solow model is solved here in aggregate, 
i.e. non-detrended form along its balanced growth path. For that purpose, trending labor-augmenting
technology and population processes are defined.

## Ramsey_Cass_Koopmans.mod

### Ramsey_Cass_Koopmans.mod [![Ramsey–Cass–Koopmans model - Wiki](https://en.wikipedia.org/wiki/Ramsey%E2%80%93Cass%E2%80%93Koopmans_model)]
Studies the transition behavior of a simple Ramsey/Cass/Koopmans economy with Cobb-Douglas production 
function to its balanced growth path (BGP). The RCK model is solved here in aggregate, 
i.e. non-detrended form along its balanced growth path. For that purpose, trending labor-augmenting
technology and population processes are defined.

[![Simulating the Ramsey-Cass-Koopmans Model Using MATLAB and Simulink](https://www.mathworks.com/company/technical-articles/simulating-the-ramsey-cass-koopmans-model-using-matlab-and-simulink.html)]