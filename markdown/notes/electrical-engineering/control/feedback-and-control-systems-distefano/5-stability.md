[TOC]

# Stability Definitions
> A continuous system is stable if its impulse response \(y_f(t)\) approaches zero as time goes to infinity

Alternatively, one can say

> A continuous or discrete-time system is stable if every bounded input produces a bounded output

This brings up the concept of relative stability. What bounds of inputs keep a system stable?

# Characteristic Root Locations for Continuous Systems
**A necessary and sufficient condition for a system to be stable is that the real parts of the roots of the characteristic equation has to have negative real parts**

If the system has negative and zero real parts of the roots, then the system is said to be marginally stable. **Certain inputs will still produce unbounded outputs in this case, so marginally unstable is still unstable**.

# Routh Stability Criterion
The Routh-Hurwitz criterion is a method for determining the stability of a linear time-invariant (LTI) system by examining the coefficients of its characteristic polynomial.  A system is stable if and only if all the roots of its characteristic polynomial have negative real parts.  The Routh-Hurwitz criterion avoids explicitly calculating the roots.

## Procedure

Consider a characteristic polynomial given by:

$$
Q(s) = a_n s^n + a_{n-1} s^{n-1} + a_{n-2} s^{n-2} + \cdots + a_1 s + a_0
$$

where \(a_n, a_{n-1}, \dots, a_0\) are real coefficients and \(a_n > 0\).

**1. Construct the Routh Array:**

The Routh array is constructed as follows:

\begin{center}
\begin{tabular}{c|ccccc}
$s^n$     & $a_n$     & $a_{n-2}$ & $a_{n-4}$ & $a_{n-6}$ & $\cdots$ \\
$s^{n-1}$ & $a_{n-1}$ & $a_{n-3}$ & $a_{n-5}$ & $a_{n-7}$ & $\cdots$ \\
$s^{n-2}$ & $b_1$     & $b_2$     & $b_3$     & $b_4$     & $\cdots$ \\
$s^{n-3}$ & $c_1$     & $c_2$     & $c_3$     & $c_4$     & $\cdots$ \\
$\vdots$  & $\vdots$  & $\vdots$  & $\vdots$  & $\vdots$  &         \\
$s^1$     & $k_1$     &           &           &           &         \\
$s^0$     & $l_1$     &           &           &           &
\end{tabular}
\end{center}

**2. Calculate the Elements of the Routh Array:**

The elements of the array are calculated using the following formulas:

\begin{align*}
b_1 &= -\frac{1}{a_{n-1}} \begin{vmatrix} a_n     & a_{n-2} \\ a_{n-1} & a_{n-3} \end{vmatrix} = \frac{a_{n-1} a_{n-2} - a_n a_{n-3}}{a_{n-1}} \\
b_2 &= -\frac{1}{a_{n-1}} \begin{vmatrix} a_n     & a_{n-4} \\ a_{n-1} & a_{n-5} \end{vmatrix} = \frac{a_{n-1} a_{n-4} - a_n a_{n-5}}{a_{n-1}} \\
b_3 &= -\frac{1}{a_{n-1}} \begin{vmatrix} a_n     & a_{n-6} \\ a_{n-1} & a_{n-7} \end{vmatrix} = \frac{a_{n-1} a_{n-6} - a_n a_{n-7}}{a_{n-1}} \\
&\vdots \\
c_1 &= -\frac{1}{b_1} \begin{vmatrix} a_{n-1} & a_{n-3} \\ b_1     & b_2     \end{vmatrix} = \frac{b_1 a_{n-3} - a_{n-1} b_2}{b_1} \\
c_2 &= -\frac{1}{b_1} \begin{vmatrix} a_{n-1} & a_{n-5} \\ b_1     & b_3     \end{vmatrix} = \frac{b_1 a_{n-5} - a_{n-1} b_3}{b_1} \\
&\vdots
\end{align*}

And in general:

$$
(\text{element in row } i \text{, column } j) = -\frac{1}{(\text{element above left})} \begin{vmatrix} (\text{element above left}) & (\text{element two positions to the right in the row above}) \\ (\text{element immediately above}) & (\text{element diagonally above and to the right}) \end{vmatrix}
$$

**3. Stability Criterion:**

The system is stable if and only if all the elements in the first column of the Routh array have the same sign (usually positive, since we assumed $a_n > 0$).

The number of sign changes in the first column is equal to the number of roots of the characteristic polynomial with positive real parts.  Therefore, a system is unstable if there is at least one sign change in the first column.

## Special Cases

- **Zero in the first column:** If a zero appears in the first column, but not an entire row of zeros, replace the zero with a small positive number \(\epsilon\) and proceed. Then, analyze the array as \(\epsilon \rightarrow 0\).
- **Entire row of zeros:** If an entire row of zeros occurs, it indicates that there are roots that are equal in magnitude but opposite in sign (i.e., on the $j\omega$-axis, or symmetrically located about the origin in the complex plane).  This means the polynomial has factors that are either even or odd.

To continue, form an auxiliary polynomial using the coefficients of the row immediately \emph{above} the row of zeros. The roots of this auxiliary polynomial are also roots of the original polynomial.  Then, take the derivative of the auxiliary polynomial and use its coefficients to replace the row of zeros and continue the Routh array.

# Stability Criteria For Discrete-Time Systems
The stability for discrete systems is defined by the unit circle \(|z| = 1\). 
