# Nonlinear RBC: why solve for steady-state labour?

Run `dynare rbc_nonlinear_stoch2` from this folder. It includes
`rbc_nonlinear_common1.inc`, which defines the model and its
`steady_state_model` block. Keep `rbc_steady_state_helper.m` on the MATLAB path
(the same folder is sufficient). `RBCmodel_WM.mod` is a separate exercise file;
it does not call this helper as supplied.

## The economic role of the helper

A deterministic steady state is an equilibrium in which variables are constant
and shocks are at their steady-state values. Dynare needs this reference point
to check the equilibrium and construct the local approximation used by
`stoch_simul`. Although this RBC model is nonlinear, its current simulation
command uses a **first-order** approximation (`order=1`). Finding a steady
state and approximating dynamics around it are separate steps.

The steady-state block solves most quantities analytically. With zero shocks,
`a = z = mc = 1`. The Euler equation fixes the capital rental rate:

```matlab
r = 1/BETA + DELTA - 1;
K_L = (mc*ALPHA*a/r)^(1/(1-ALPHA));
w = mc*(1-ALPHA)*a*K_L^ALPHA;
Y_L = a*K_L^ALPHA;
IV_L = DELTA*K_L;
C_L = Y_L - IV_L;
```

`K_L`, `Y_L`, `IV_L` and `C_L` are ratios to labour, not aggregate levels.
For example, `C_L = c/l`, so `c = C_L*l`. These ratios and the wage are known,
but the household must still choose how much of its unit time endowment to
work. Labour supply determines the scale of consumption, output, investment
and capital.

In the model, marginal utilities and household optimality imply

```matlab
uc = GAMMA*c^(-ETAC);
ul = -PSI*(1-l)^(-ETAL);
w = -ul/uc;
```

Thus the marginal utility gained by earning the wage equals the marginal
utility cost of giving up leisure:

```text
w * GAMMA * c^(-ETAC) = PSI * (1-l)^(-ETAL).
```

Substitute `c = C_L*l`, divide by `GAMMA`, and multiply by `l^ETAC`:

```text
w*C_L^(-ETAC) - (PSI/GAMMA)*(1-l)^(-ETAL)*l^ETAC = 0.
```

This is exactly the residual in `rbc_steady_state_helper.m`. `fsolve` searches
for its zero, starting from `L0 = 1/3`; this initial guess is not an imposed
labour calibration. The current zero-shock calibration gives approximately
`l = 0.3644253`. The block then computes `c = C_L*l`, `y = Y_L*l`,
`iv = IV_L*l`, and `k = K_L*l`.

The helper reduces the nonlinear steady-state problem to **one unknown**.
It is not a simulation of labour over time and is not a separate economic
equation: it numerically enforces the labour-supply equation already in the
model. `steady;` subsequently checks the resulting steady state.

`ETAC` controls consumption utility curvature; `ETAL` controls leisure utility
curvature. Despite the parameter label in the model, the Frisch elasticity of
labour here is `(1-l)/(ETAL*l)`, not simply `1/ETAL`, because utility is specified
over leisure rather than directly over hours worked.

## Alternative: a bracketed scalar root with fzero

Because only labour remains unknown, `fzero` can replace `fsolve`. Under the
usual assumptions `w > 0`, `C_L > 0`, `PSI/GAMMA > 0`, `ETAC > 0` and
`ETAL > 0`, the residual decreases continuously from positive to negative
as labour rises from zero to one. There is therefore one interior root.
A bracket keeps the search inside the economically meaningful interval,
avoiding the endpoint singularity at `l = 1`.

The following standalone example reproduces the current calibration. It runs
in base MATLAB or GNU Octave without `fsolve` or an optimization toolbox:

```matlab
ALPHA = 0.35; BETA = 0.99; DELTA = 0.025;
GAMMA = 1; PSI = 1.6; ETAC = 2; ETAL = 1;
a = 1; mc = 1;
r = 1/BETA + DELTA - 1;
K_L = (mc*ALPHA*a/r)^(1/(1-ALPHA));
w = mc*(1-ALPHA)*a*K_L^ALPHA;
C_L = a*K_L^ALPHA - DELTA*K_L;

residual = @(l) w*C_L^(-ETAC) ...
    - (PSI/GAMMA)*(1-l)^(-ETAL)*l^ETAC;
bracket = [1e-8, 1-1e-8];
assert(residual(bracket(1))*residual(bracket(2)) < 0, ...
    'Choose a bracket with opposite residual signs.');
opts = optimset('Display','off','TolX',1e-10);
[l, fval, exitflag] = fzero(residual, bracket, opts);
assert(exitflag > 0 && l > 0 && l < 1 && abs(fval) < 1e-8, ...
    'No valid interior labour solution.');
c = C_L*l;
fprintf('Labour = %.7f; consumption = %.7f\n', l, c);
% Expected: Labour = 0.3644253; consumption = 0.9437866
```

To use this approach in the model, replace the helper's solver lines with the
`residual`, bracket, options, `fzero` and convergence-check lines above; retain
the existing function inputs instead of hard-coding the calibration. For
extreme parameter values, the chosen numerical bracket may need adjustment.
The existing `fsolve` implementation is unchanged; in MATLAB it requires
Optimization Toolbox and does not currently check its exit flag or constrain
labour to `(0,1)`.

There are also two broader alternatives:

- **Analytical solution:** with `LOGUTILITY = 1`, both consumption and leisure
  utility are logarithmic. Let `A = (GAMMA/PSI)*w/C_L`; then `l = A/(1+A)`.
  The include file already uses this formula in that branch. Changing the
  switch changes preferences as well as the solution method.
- **Solve all steady-state equations together:** supply admissible guesses in
  an `initval` block and let Dynare's `steady` solver find the full equilibrium,
  rather than providing the current analytical/numerical steady-state block.
  This is more general but involves more unknowns and usually requires more
  care with initial guesses. The current helper exploits the RBC structure
  to keep the numerical problem small.
