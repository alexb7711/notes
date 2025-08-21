[TOC]

# Definition of Continuous System Transfer Functions
Time invariant linear sysetms can be separated into two parts

- Forced Response (\(u\) terms)
- Free Response (\(y\) terms)

If we lump all of the initialization terms together, then we could write

$$
y(t) = \mathcal{L}^{-1} \Big[ \Big( \frac{\sum_{i=0}^m b_i s^i}{\sum_{i=0}^{n}a_i s^i} \Big) U(s) + (u_0^k \text{ and } y_0^k \text{terms} \Big] 
$$

or

$$
Y(s) = \Big( \frac{\sum_{i=0}^m b_i s^i}{\sum_{i=0}^{n}a_i s^i} \Big) U(s) + (u_0^k \text{ and } y_0^k \text{terms}
$$

The trasnfer function \(P(s)\) of a continuous system is defined as the factor in the equation above that multiplies \(U(s)\). That is

$$
Y(s) = P(s)U(s)
$$

If the system is assumed to be at rest then

$$
(u_0^k \text{ and } y_0^k \text{terms} = 0
$$

# Propertios of Continuous System Transfer Functions

* The trasnfer function is the Laplace Transform of the implse response \(y_f(t),\; t \ge 0\)
* The transfer function can be found from a system of differential equations by taking the Laplace Transform and ignoring all initialization terms
* The differential equation can be found given a transfer function by replacing \(D\) with \(s\)
* The stability of LTI systems can be determined by taking the roots of the demonitator (characteristic equation)
* The system transfer function can be specified to within a constant by specifying the system poles and zeros.
* If the system has no poles or zeros, then the system is a minimum phase system

# Transfer Functions of Continuous Control System Compensators and Controllers

## Continuous System Lead Compensator
$$
P_{lead}(s) = \frac{s+a}{s+b}\; b > a
$$

## Continuous System Lag Compensator
$$
P_{lead}(s) = \frac{a(s+b)}{b(s+a)}\; b > a
$$

## Continuous System Lead-Lag Compensator
$$
P_{lead}(s) = \frac{(s+a_1)(s+b_2)}{(s + b_1)(s+a_2)}\; b > a
$$

## PID Controller
$$
P_{lead}(s) = \frac{U_{PID}(s)}{E(s)} = K_p + K_D s + \frac{K_I}{s} = \frac{K_D s^2 + K_p s + K_I}{s}
$$

# Continuous Sysetm Frequency Response
If a system is stable, a step function of amplitude \(A\) 

$$
U(s) = \frac{A}{s}
$$

then

$$
Y(s) = P(s) \frac{A}{s}
$$

then the response of the step function is \(AP(0)\).

The steady state rseponse of a stable system from \(U = Asin(\omega t)\) is

$$
y_s (s) = A |P(j\omega)| sin (\omega t + \phi)
$$

where \(\phi = arg(j\omega)\). **The system has the same frequency as the input, the magnitude and phase define the system frequency response**.

# Discrete-Time System Transfer Functions, Comensators, and Time Responses
* \(P(z)\) is the z-transform of the kronecker delta response
* The difference equation can be inferred from the transfer function \(Z^n[y(k)] = y(k+n)\)
* The denominator is the characteristic polynomial. If all the roots are in the unit circle, the system is stable
* \(P(z) \frac{k (z+z_1)(z+z_2)\cdots(z+z_m)}{(z+p_1)(z+p_2)\cdots(z+p_n)}
* For thet system to be physically realizable the order of the denominator must be greater than or equal to the numerator (i.e. causal system)
* The steady-state response of a unit step function is given by the Final Value Theorem
$$
\lim_{k \rightarrow \infty} y(k) = \lim_{k \rightarrow 1} \Big[ \frac{z-1}{z} P(z) \frac{z}{z-1} \Big] = P(1)
$$
