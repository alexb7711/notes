[TOC]

# 2.3: The Transfer Function
The transfer function relates a system's input to its output. Suppose we have an \(n^{th}\) order system of the form. Let \(c(t)\) represent the output, \(r(t)\) represent the input, and the \(a\), \(b\) are constants.

\begin{equation}
a_n \frac{d^n c(t)}{dt^n} + a_{n-1} \frac{d^{n-1} c(t)}{dt^{n-1}} + \ldots + a_0 c(t) = b_m \frac{d^{m} r(t)}{dt^m} + b_{m-1} \frac{d^{m-1} r(t)}{dt^{m-1}} + \ldots + b_0 r(t)
\end{equation}

Taking the Laplace transform of the equation, and making the assumption that all initial conditions are zero, if we take the ratio of the input to the output we get:

\begin{equation}
\frac{C(s)}{R(s)} = G(s) = \frac{b_{m}s^{m} + b_{m-1}s^{m-1} + \ldots b_0}{a_{n}s^{n} + a_{n-1}s^{n-1} + \ldots + a_0}
\end{equation}

# 2.4: Electrical Network Transfer Functions
# 2.5: Translational Mechanical Transfer Functions
# 2.6: Rotational Mechanical Transfer Functions
# 2.7: Transfer Functions For Systems With Gears
# 2.8: Electromechanical Transfer Functions
# 2.9: Electric Circuit Analogs
# 2.10: Non-linearities
A linear system posses two properties:

- superposition: The output response of a system is equal to the sum of the inputs
- homogeneity: Scaling the input yields a proportional scaled response

# 2.11: Linearization
This section shows how to obtain linear approximations to nonlinear systems to obtain transfer functions.

When we linearize a non-linear differential equation, we first need to identify the non-linearities. We then linearize the equation for small-signal inputs about a steady-state solution when the small-signal input is equal to zero. This steady-state solution is called equilibrium. At this point, we linearize the differential equation about the equilibrium point and take the Laplace transform of it assuming zero initial conditions.
