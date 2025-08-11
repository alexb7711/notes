[TOC]

# 5: Time Variability and Time Invariance
> A time-variable equation is an equation with one or more terms depending *explicitly* on time.

> A time-invariant equation is an equation where none of the terms depend *explicitly* on time.

Any differential equation of the form

$$
\sum_{i=0}^{n} a_i \frac{d^iy}{dt^i} = \sum_{i=0}^{n} b_i \frac{d^iu}{dt^i}
$$

is *time-invariant*. But, for example, say we have

$$
t \dot{y}(t) + y(t) = u(t)
$$

then the equation is *time-variant*.

# 6: The Differential Operator \(D\) and the Characteristic Equation
Suppose we have

$$
\sum_{i=0}^{n} a_i \frac{d^iy}{dt^i} = u
$$

where \(a_n = 1\). Let \(D \equiv \dot{d}\) and \(D^n \equiv \dot{d}^n\). Then we get

$$
\sum_{i=0}^{n} a_i D^i y = u
$$

The following polynomial is defined as the *characteristic polynomial*

$$
\sum_{i=0}^{n} a_i D^i
$$

and the following equation is the *characteristic equation*

$$
\sum_{i=0}^{n} a_i D^i = 0
$$

Again, note that \(a_i = 1\). By the fundamental theorem of algebra, the characteristic equation has \(n\) solutions (roots) that are not necessarily distinct.

# 7: Linear Independence and Fundamental Sets
A set of functions are *linearly independent* if

$$
c_1 f_1 + c_2 f_2 + \cdots + c_n f_n = 0 \;\forall c_i = 0; i = 1-n
$$

A *homogeneous* \(n^{th}\) order linear differential equation is of the form

$$
\sum_{i=0}^{n} a_i \frac{d^iy}{dt^i} = 0
$$

Any homogeneous \(n^{th}\) linear differential equation has at least one set of linearly independent solutions. Any set of linearly independent solutions for a homogeneous \(n^{th}\) order differential equation is a *fundamental set*. All fundamental sets have a non-zero determinant because, as per the definition, they are linearly independent.

## Distinct Roots
If the characteristic equation \(\sum_{i=0}^{n} a_i D^i\) has distinct roots, then a fundamental set of the homogeneous equation is the set of functions: \(y_1 = e^{D_1t}\), \(y_2 = e^{D_2t}\), \(\cdots\), \(y_n = e^{D_nt}\).

## Repeated Roots
If the characteristic equation \(\sum_{i=0}^{n} a_i D^i\) has repeated roots, then a fundamental set of the homogeneous equation is the set of functions: \(y_1 = e^{D_1t}\), \(y_2 = te^{D_2t}\), \(\cdots\), \(y_n = t^{n_{i-1}}e^{D_nt}\).

# 8: Solution of Linear Constant-Coefficient Ordinary Differential Equations
Consider the differential equation:

$$
\sum_{i=0}^{n} a_i \frac{d^iy}{dt^i} = b_i \frac{d^iu}{dt^i}
$$

If the equation describes a physical system, then generally \(m \le n\) and \(n\) is called the *order* of the system.

To completely specify the problem such that a *unique solution* \(y(t)\) can be obtained, two pieces of information are required:

1. The interval of time over which a solution is desired and
2. a set of initial conditions for \(y(t)\) and its first \(n-1\) derivatives.

The solution of a differential equation of this class can be divided into two parts:

1. free response and
2. forced response

The sum of the free and forced responses make the *total response*.

# 9: The Free Response
The *free response* of a differential equation is the solution to the following equation:

$$
\sum_{i=0}^{n} a_i \frac{d^iy}{dt^i} = 0
$$

## Example
Find the free response of the differential equation \(\dot{y}^2 + 3\dot{y} + 2y = u\):

```python
>>> c = [1, 3, 2]
>>> np.roots(c)
array([-2., -1.])
```

Therefore: \(y_a(t) = c_1e^{-t} + c_2e^{-2t}\).

Assuming the initial conditions are zero. If we take the first derivative of \(y_a(t)\) and solve for \(c_1\) and \(c_2\) you find \(c_1 = 1\) and \(c_2 = -1\).

---

# 10: The Forced Response
The *forced response* $y_b(t)$ of a differential equation is the solution of the differential equations when all the initial responses are zero. **The implication of this definition is that the force response depends only on the input \(u(t)\)**.

The forced response for a linear constant-coefficient ordinary differential equation can be written in terms of a *convolution integral*

$$
y_b(t) = \int_0^t w(t-\tau) \Big[ \sum_{i=0}^{n} b_i \frac{d^iu(\tau)}{d\tau^i} \Big] d \tau
$$

The term \(w(t-\tau)\) is the weighting function (or kernel) of the differential equation. The weighting function must be described by a causal system. Setting \(w(t) = \sum_{i=1}^n c_i y_i(t)\; t \ge 0\) (i.e. setting the weighting function equal to the free response of the system) allows one to determine the forced response of the system.

## Example
Find the step response of the differential equation \(\dot{y}^2 + 3\dot{y} + 2y = u\):

From the previous example finding the free response, we know that the weighting function is

$$
w(t) = e^{-t} - e^{-2t}
$$

The step response implies that $u(t) = 1$. Then the forced response is

$$
\begin{split}
y_b(t) &= \int_0^t \big[ e^{-(t - \tau)} - e^{-2(t - \tau)} \big] d\tau \\
       &= \frac{1}{2} (1 - 2e^{-t} + e^{-2t})
\end{split}
$$

---

# 11: The Total Response
The total response is simply the free response added to the forced response: \(y_t(t) = y_a(t) + y_b(t)\).

# 12: The Steady State and Transient Response
> The *steady state* response is the part of the total response which does not approach zero as time goes to infinity

> The *transient state* response is the part of the total response which approaches zero as time goes to infinity

# 13: Singularly Functions: Steps, Ramps, and Impulses
The unit step function is defined as

$$
1(t - t_0) =
\begin{cases}
1 & t > t_0 \\
0 & t \le t_0 \\
\end{cases}
$$

A unit ramp function is defined as

$$
\int_{-\infty}^t 1(\tau - t_0) d\tau =
\begin{cases}
t-t_0 & t > t_0 \\
0 & t \le t_0 \\
\end{cases}
$$

Unit impulse function \(\delta(t)\) is defined as

$$
\delta(t) = \lim_{\Delta t \rightarrow 0^+} \frac{1(t) - 1(t - \Delta t)}{\Delta t}
$$

where \(1(t)\) is the unit step function. An important property of the \(\delta(t)\) is \(\int_{-\infty}^{\infty} \delta (t) dt = 1\). Another important function of the unit impulse is that the convolution of \(\delta(t)\) and any function \(y(t)\) is \(y(t_0)\).

> The unit step response of the output \(y(t)\) when the input is \(u(t) = 1(t)\)

> The unit ramp response of the output \(y(t)\) when the input is \(u(t) = t\)

# 14: Second Order Systems
Linear constant-coefficient second-order differential equations of the form

$$
\dot{y}^2 + 2 \zeta w_n \dot{y} + w_n^2 y = w_n^2u
$$

are important because higher-order systems can often be approximated by second-order systems.

- \(\zeta\): dampening ratio
- \(w\): undamped natural frequency

# 15: State Variable Representation of Systems Described By Linear Differential Equtaions
This is basically an introduction to linear systems theory:

$$
\dot{x} = Ax + Bu
$$

# 16: Solution of Linear Constant-Coefficient Difference Equations
$$
\sum_{i=0}^{n} a_i y(k + i) = \sum_{i=0}^{n} b_i u(k+i)
$$

Similar naming applies for difference equations as differential equations, such as the *characteristic polynomial*, *characteristic equation*, and *fundamental set*.
The only part that is different is how one defines the free response equations for unique and repeated roots:

$$
y_a(k) = c_1(a)^k + c_2(b)^k + \cdots
$$

For the forced response, the convolution of difference equations is defined as:

$$
y_b(k) = \sum_{j=0}^{k-1} w(k-j) \Big[ \sum_{i=0}^m b_i u(j+1) \Big]\; k = 0,1,\cdots , n
$$

Where the weighting function is defined as

$$
w(k-l) = \sum_{j=1}^n \frac{M_j(l)}{a_n M(l)} y_j (k)
$$

Where \(M(l)\) is the determinant:

$$
M(l) =
\begin{vmatrix}
y_1(l+1) & y_2(l+1) & \cdots & y_n(l+1) \\
y_1(l+2) & y_2(l+2) & \cdots & y_n(l+2) \\
\vdots   & \vdots   & \ddots & \vdots   \\
y_1(l+n) & y_2(l+n) & \cdots & y_n(l+n) \\
\end{vmatrix}
$$

and \(M_j(l)\) is the [cofactor](https://www.geeksforgeeks.org/maths/cofactor-matrix/) of the last element of the \(j\)th column of \(M(l)\).

# 17: State Variable Representation of Systems Described By Linear Difference Equations
Similar to constant equations, we can decompose the difference equation into \(x(k) = A^k x(0) + \sum_{j=0}^{k-1} A^{k-1-j} Bu(j)

## Discretization of Difference Equations
Consider a differential equation system described as

$$
x(t) = e^{At} x(0) + \int_0^t e^{A (t-\tau)} B u(\tau) d\tau
$$

If we want to discretize the equation, then one can write an *exact discretization* as follows:

$$
u'(k) = e^{AkT} \int_{kT}^{(k+1)T} e^{A(T-\tau)} B u(\tau) d\tau
$$

Then the solution can be expressed as the vector-matrix difference equation:

$$
x(k+1) = e^{AT}x(k) + u'(k)
$$

Note that \(A' \equiv e^{AT}\) is a transition matrix.

# 18: Linearity and Superposition

If all initial conditions are zero, then the system is a linear system if

1. An input \(u_1(t)\) produces an output \(y_1(t)\)
2. An input \(u_2(t)\) produces an output \(y_2(t)\)
2. An input \(c_1u_1(t) + c_2u_2(t)\) produces an output \(c_1y_1(t) + c_2y_2(t)\) for all combinations of \(c\) and \(u\).

If a system is linear, then its input-output relationship is described by the *convolution integral*.

**Principle of Superposition**
> The response \(y(t)\) of a linear system due to several inputs acting simultaneously us equal to the sum of the responses of each input acting alone, when all initial conditions are zero in the system.

# 19: Causality and Physically Realizable Systems
> A system in which time is the independent is called *causal* if the output depends only on the present and past values of the input.

The implication of the previous definition is that a causal system is one which cannot anticipate what its future input will be.
