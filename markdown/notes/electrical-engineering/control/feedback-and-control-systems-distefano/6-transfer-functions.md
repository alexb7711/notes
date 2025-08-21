[TOC]

# Definition of Continuous System Transfer Functions
Time invariant linear sysetms can be separated into two parts

- Forced Response (\(u\) terms)
- Free Response (\(y\) terms)

If we lump all of the initialization terms together, then we could write

$$
y(t) = \mathcal{L}^{-1} \Big[ \Big( \frac{\sum_{i=0}^m b_i s^i}{\sum_{i=0}{n}a_i s^i} \Big) U(s) + (u_0^k \text{ and } y_0^k \text{terms} \Big] 
$$

or

$$
Y(s) = \Big( \frac{\sum_{i=0}^m b_i s^i}{\sum_{i=0}{n}a_i s^i} \Big) U(s) + (u_0^k \text{ and } y_0^k \text{terms}
$$

The trasnfer function \(P(s)\) of a continuous system is defined as the factor in the equation above that multiplies \(U(s)\). That is

$$
Y(s) = P(s)U(s)
$$

If the system is assumed to be at rest then

$$
(u_0^k \textt{ and } y_0^k \text{terms} = 0
$$

# Propertios of Continuous System Transfer Functions

* The trasnfer function is the Laplace Transform of the implse response \(y_f(t),\; t \ge 0\)
