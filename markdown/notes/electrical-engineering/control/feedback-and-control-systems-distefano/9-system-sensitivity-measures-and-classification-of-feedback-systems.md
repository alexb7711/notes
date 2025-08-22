[TOC]

# Introduction
Quatitative measures of the effectiveness of foodback are developed in terms of sensitivity and error constants.

## Sensitivity of Transfer Functions and Frequency Response Functions to System Parameters
If a system is LTI, we have two useful models

- Transfer Functions
- Frequency Response Function

The *sensitivity* of a system parameter is a measure of how much the system transfer function differs from its nominal when each of its parameters deffers from its nominal value (i.e. perturb the parameters and seed how it affects the transfer function). A similar statement about sensitivity can be made in regard to frequency. How does the frequency response change when the parameters are modified?

Consider a model \(T(k)\) of an LTI system in polar coordinates

$$
T(k) = |T(k)|e^{j\phi T}
$$

The sesitivity of \(T(k)\) with respect to \(k\) can be written as

$$
S_k^T = \frac{d\\; ln\\; T(k)}{d\\; ln\\; k} ] = \frac{dT(k)}{dk} \frac{k}{T(k)}
$$

If we want to look at the sensitivity of the magnitude: \(S_k^{|T(k)|} \equiv \frac{d|T(k)|}{dk} \frac{k}{T(k)}\), and for phase angle \(S_k^{|\phi_T|} \equiv \frac{d\phi_T}{dk} \frac{k}{\phi_T}\). Putting it together yields:

$$
S_k^{T(k)} = S_k^{|T(k)|} + j\phi_T S_k^{\phi_T}
$$

If \(S_k^{T(k)} = 0\), then we say \(T(k)\) is insensitive to \(k\).

# Output Sensitivity to Paraemeters for Differential and Difference Equation Methods
The sensitivity of the model output \(y\) to any paramater \(p\) is given by

$$
S_p^{y(t)} \equiv S_p^y = \frac{d(ln\\; y)}{d(ln\\;p)} = \frac{dy}{dp} \frac{p}{y}
$$

Where \(\frac{dy}{dp}\) is called the _output sensitivity coefficient_.

# Classification of Continuous Feedback System By Type
A cannonical feedback system is defined as

$$
GH = \frac{k \prod_{i=1}^{m} (s + z_i)}{\prod_{i=1}^n (s+p_i)}
$$

If there are \(a\) zeros and \(b\) poles, then

$$
GH = \frac{k \prod_{i=1}^{m} (s + z_i)}{s^l \prod_{i=1}^n (s+p_i)} \equiv \frac{KB_1(s)}{s^l B_2(s)}
$$

# Position Error Constants for Continuous Feedback Systems
The position eror constant \(K_p\) is a measure of error between the input and output if the inpyut is a unit step function. 
