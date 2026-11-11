# CIA and MIU teaching models

## MIU preferences: interpreting the code

The underlying MIU utility is the Walsh-style nonseparable consumption-money
specification shown in the MIU slides. Define

```text
S = a*c^(1-eta_m) + (1-a)*m^(1-eta_m)
U(c,m,1-n) = S^((1-eta_c)/(1-eta_m))/(1-eta_c)
             + Psi*(1-n)^(1-eta_n)/(1-eta_n).
```

The notation in the supplied Walsh equation maps as follows:

| Walsh notation | Code parameter | Role |
|---|---|---|
| Phi | eta_c | Curvature over the consumption-money composite |
| b | eta_m | CES curvature within the composite |
| eta | eta_n | Curvature over leisure |
| a | a | Weight on consumption; money has weight 1-a |
| Psi | Implicit | Leisure weight consistent with calibrated nss |

These are level preferences underlying `MIU.mod`, which implements the
log-linear equilibrium conditions, not the nonlinear utility expression.
The model fixes steady-state labour `nss`; it does not declare or estimate
`Psi` separately. For consistent steady-state levels, the labour condition
would recover `Psi = w*U_c*(1-nss)^eta_n`.

At unit curvature, use continuous logarithmic limits rather than dividing by
zero. In particular, the current `eta_n = 1` means that the leisure term is
`Psi*log(1-n)`. If both `eta_c` and `eta_m` equal one, the composite term becomes
`a*log(c) + (1-a)*log(m)`, up to an irrelevant additive constant.

## Why this is the utility implied by the equations

Its marginal utilities are

```text
U_c = a*S^((eta_m-eta_c)/(1-eta_m))*c^(-eta_m)
U_m = (1-a)*S^((eta_m-eta_c)/(1-eta_m))*m^(-eta_m)
U_n = -Psi*(1-n)^(-eta_n).
```

Therefore the money-consumption marginal rate of substitution is

```text
U_m/U_c = ((1-a)/a)*(m/c)^(-eta_m) = i/(1+i).
```

This gives exactly the steady-state money-consumption ratio `MC` in the code.
Let `gam` be consumption's share in `S`, evaluated at the steady state. The
log-linear marginal utility of consumption is

```text
hat(U_c) = -omega_one*hat(c) + omega_two*hat(m)
omega_one = gam*eta_c + (1-gam)*eta_m
omega_two = (eta_m-eta_c)*(1-gam).
```

These are the coefficients used in the consumption Euler equation and labour
condition. They allow money to affect the marginal utility of consumption.
The previous additive CRRA comment did not imply these coefficients and was
incorrect. When `eta_c = eta_m`, the consumption-money utility becomes
additively separable and `omega_two = 0`.

Because preferences are over leisure, the Frisch elasticity of hours at the
steady state is `(1-nss)/(eta_n*nss)`, not simply `1/eta_n`. This also explains
`eta_n*NL` in the linear labour condition, where `NL = nss/(1-nss)`.

The leisure weight is omitted from the displayed historical slide formula
(equivalent to a normalization there); retaining `Psi` makes the general
preference specification and the calibration of steady-state hours explicit.
These corrections document the preferences already implied by the MIU model;
they do not alter its equations or calibration.
