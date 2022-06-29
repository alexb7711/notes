# Contents
        - [|Optimal Estimation](#Optimal Estimation.md)
        - [|(1) Introduction](#(1) Introduction.md)
        - [|(2) Deterministic System Model](#(2) Deterministic System Model.md)
        - [|(3) Probability Theory](#(3) Probability Theory.md)
                - [|Moments of Random Variables](#(3) Probability Theory#Moments of Random Variables.md)
        - [|(4) Stochastic Process and Linear Dynamic System Models](#(4) Stochastic Process and Linear Dynamic System Models.md)
                - [|System Modeling: Objective and Directions](#(4) Stochastic Process and Linear Dynamic System Models#System Modeling: Objective and Directions.md)
                - [|Foundations: White Gaussian Noise and Brownian Motion](#(4) Stochastic Process and Linear Dynamic System Models#Foundations: White Gaussian Noise and Brownian Motion.md)
                - [|Stochastic Integrals](#(4) Stochastic Process and Linear Dynamic System Models#Stochastic Integrals.md)
                - [|Stochastic Differentials](#(4) Stochastic Process and Linear Dynamic System Models#Stochastic Differentials.md)
                - [|Linear Stochastic Differential Equations](#(4) Stochastic Process and Linear Dynamic System Models#Linear Stochastic Differential Equations.md)
                - [|Linear Stochastic Difference Equations](#(4) Stochastic Process and Linear Dynamic System Models#Linear Stochastic Difference Equations.md)
                        - [|Lear's Method](#(4) Stochastic Process and Linear Dynamic System Models#Linear Stochastic Difference Equations#Lear's Method.md)
                        - [|Savage's Method](#(4) Stochastic Process and Linear Dynamic System Models#Linear Stochastic Difference Equations#Savage's Method.md)
                - [|The Overall System Model](#(4) Stochastic Process and Linear Dynamic System Models#The Overall System Model.md)
        - [|(5) Optimal Filtering](#(5) Optimal Filtering.md)
        - [|Footnotes](#Footnotes.md)

# Optimal Estimation
This page has notes taken from the book (below) and [|class notes](optimal_estimation_class.md).

# (1) Introduction
# (2) Deterministic System Model
# (3) Probability Theory
## Moments of Random Variables
* The first moment is the mean [|#1](#Footnotes#1.md)

 {{$
	\boldsymbol{m} \equiv E![pic](x_i)
 }}$

* The second (noncentral) moment is defined by the _autocorrelation matrix_ of $x$ [|#1](#Footnotes#1.md).

{{$
	\Gamma \equiv E![pic](xx^T)
}}$

	which allows us to view the correlation of $x_i$ and $x_j$.

* The second (central) moment is the _covariance_ matrix and is expressed as

{{$
	P \equiv E[(x_i - m_i)(x_j - m_j)^T]
}}$

	where the square root of variance $P_{ii} = E[(x_i - [i](m_.md))^T] = \sigma^2$ is the _standard deviation_ ($\sigma$) of $x_i$.

# (4) Stochastic Process and Linear Dynamic System Models
This section adds dynamics to the system model developed in Chapter 3 of Maybeck [|#1](#Footnotes#1.md).

## System Modeling: Objective and Directions
Suppose we are given a physical system that can be subjected to known controls and to inputs beyond our own direct control (typically noise). Further assume we want to characterize certain outputs of the system, for instance, by depicting their mean and covariance kernal for all time values. Such a characteristic would be necessary to initiate designs of estimators or controllers for the system, and a prerequisite to a means of analyzing the performance capabilities of such devices as well [|#1](#Footnotes#1.md).

Consider the following differential equation

{{$
\begin{array}{c}
	\dot{x} = F(t)x(t) + B(t)u(t) + G(t)w(t) \\
	z(t_i) = H(t_i)x(t_i) + v(t_i)           \\
\end{array}
}}$

A _Markov Process_ states that given a sequence of probability distributions ($F_{x_{t_i | x_{t_i - 1},x_{t_i - 2}, ...}}(\zeta_i | x_{i-1}, x_{i-2}, ...)$), the entire sequence can simply be represented by the previous data set $F_{x_{t_i | x_{t_i - 1```(\zeta_i | x_{i-1})$. Assuming this sequence is greated by Gaussian white noise, the process is known as a _Gauss-Markov_ process [|#1](#Footnotes#1.md).

Furthuremore, $w(t)$ and $v(t)$ are white Gaussian noises, assumed independent of each other and their initial conditions. These noises model both the disturbances and noise corruption, but as well as the uncertainty inherent in the model itself (i.e. the model does not perfectly describe the true process) [|#1](#Footnotes#1.md).

## Foundations: White Gaussian Noise and Brownian Motion
A process $x(\cdot, \cdot)$ is a _white Gaussian process_ if, for any choice of $t_1,...,t_N \in T$, the $N$ random vectors $x(t_1, \cdot),...,x(t_N, \cdot)$ are independent Gaussian random vectors [|#1](#Footnotes#1.md).

_Brownian Motion_ will serve as a basic process for continuous-time modeling. With it, models can be properly developed in the form of stochastic differential equations whose solutions can be obtained. The process $\beta(\cdot,\cdot)$ is defined to be a _scalar constant-diffusion Brownian motion process_ if

* It is a process with independent increments
* The increments are Gaussian random variables such that for $t_1$ and $t_2$ any time instant in $T$,

{{$
\begin{array}{c}
	E\{ [\beta(t_2) - \beta(t_1)]\} = 0 \\
	E\{ [\beta(t_2) - \beta(t_1)]^2 = q|t_2 - t_1|
\end{array}
}}$

    where $q$ is known as the _diffusion_ of the process.

The statistics at any time instant $i$ is denoted

{{$
\begin{array}{c}
	m_{\beta}(t_i )      = E\{ ![pic](\beta(t_i))\} = 0 \\
	P_{\beta \beta}(t_i) = E\{ ![pic](\beta(t_i)^2) = q|t_i - t_0|
\end{array}
}}$

where $q$ indicates how fast the mean square value of $\beta(\cdot,\cdot)$ diverges from its initial value of zero at time $t_0$. To generalize this the vector Brownian motion with white process can be described as [|#1](#Footnotes#1.md)

{{$
\begin{array}{c}
	E\{w(t\}         = 0                 \\
	E\}{w(t)w(t)^T\} = Q(t) \delta(t-t') \\
\end{array}
}}$

Notes that Brownian motion is continuous but not differentiable [|#1](#Footnotes#1.md).

## Stochastic Integrals
A _scalar stochastic integral_ is of the form

{{$
l(t,\cdot) = \int_{t_0}^t a(\tau) d\beta (\tau,\cdot)
}}$

* Stocastic integrals exibit the usual linear properties of ordinary integrals
* Integration by parts is also valid. However, the second term is not a stocastic integral but an ordinary Stieltjes integral definable for each sample of $\beta(\cdot, \cdot)$, if $a(\cdot)$ is of bounded variation.

## Stochastic Differentials
Given a stochastic integral

{{$
l(t) = l(t_0) + \int_{t_0}^t A(\tau) d \beta (\tau)
}}$

the _stochastic integral_ of $l(t)$ is defined as [|#1](#Footnotes#1.md)

{{$
dl(t) = A(\tau) d \beta(\tau)
}}$

Noting that Brownian motion is nondifferentiable, $dl(t)$ is differentiable in the sense that if it is integrated over the entire interval $t_0$ to $t$, it yields the random variable $[l(t) - l(t_0)]$ [|#1](#Footnotes#1.md):

{{$
\int_{t_0}^t dlt(t) = l(t) - l(t_0)
}}$

Suppose we have a matrix $D(\cdot)$ of differentiable functions as well as a stocastic integral of the form

{{$
\begin{array}{c}
	s(t) = s(t_0) + \int_{t_0)^t A(\tau) d\beta (\tau) \\
	y(t) = D(t) s(t)                                   \\
\end{array}
}}$

It can be shown that the differential equation of y is

{{$
dy(t) = \dot{D}(t) s(t) dt + D(t) ds(t)
}}$

Where the integral of the first term can be interpreted as an ordinary Riemann integral for each sample function, and the integral of the second term is a stochastic integral which is defined properly only in th mean square sense. Futhermore, this equation revleals that the sthocastic differential of the linear form obeys the same formal rules as the dtermanistic total differential of a corresponding $y(t) = D(t)s(t)$ [|#1](#Footnotes#1.md).

## Linear Stochastic Differential Equations
We would like to generate a system of the form

{{$
\dot{x}(t) = F(t) x(t) + G(t) w(t)
}}$

However, this equation cannot be used to generate a solution directly. Therefore we employ the _linear stochastic differential equation_

{{$
dx(t) = F(t)x(t)dt + G(t) d\beta (t)
}}$

Where $G(\cdot)$ is a known matrix of piecewise continuous functions and $\beta(\cdot, \cdot)$ is a vector-valued Brownian motion process of diffusion $Q(t)$ [|#1](#Footnotes#1.md). Supose we propose a solution of the form

{{$
x(t) = \Psi (t,t_0) x(t_0) + int_{t_0}^t \Psi(t,\tau) B(\tau) u(\tau) d\tau + \int_{t_0}^t \Psi(t,\tau) G(\tau) d\beta(\tau)
}}$

that can be shown to satisfy both the initial condition as well as differential equation [|#1](#Footnotes#1.md). The first part of the equation defines the inital state, the second defines _determanistic control inputs_ into the system, and the third term is the set dyanamics to be observed and estimated. It is further noted that this solution is a Gauss-Markov process meaning that the next state relies only on the previous state. Because of this, it is useful to characterize the differential equations for $m_x(t)$ and $P_{xx}(t)$ to describe their evolution in time [|#1](#Footnotes#1.md)

{{$
\begin{array}{c}
	\dot{m}_x(t)    = F(t)m_x(t)  + B(t)u(t) \\
	\dot{P}_{xx}(t) = F(t)P_{xx}(t) + P_{xx}(t)F^T(t) + G(t)Q(t)G^T(t)
\end{array}
}}$

## Linear Stochastic Difference Equations
For a time-invariant or slowly varying $F(\cdot)$, $B(\cdot)$, and $![pic](G(\cdot)Q(\cdot)G^T(\cdot))$, if the sample period is short compared to the system's natural transients, a first order approxomation to the solution can be used [|#1](#Footnotes#1.md)

{{$
\begin{array}{c}
	\Psi(t_{i+1}, t_i) \approx I + F(t_i)[t_{i+1}, t_i] \\
	B_d \approx B(t_i)[t_{i+1}, t_i] \\
	Q_d(t_i) \approx G(t_i)Q(t_i)G^T(t_i)[t_{i+1}, t_i]
\end{array}
}}$

and the mean and covariance are propogated by [|#1](#Footnotes#1.md)

{{$
\begin{array}{c}
	m_x(t_{i+1}) = \Psi(t_{i+1}, t_i) m_x(t_i) + B_d(t_i)u(t_i) \\
	P_{xx}(t_{t+1}) = \Psi(t_{i+1}, t_i) P_xx(t_i) \Psi^T (t_{i+1}, t_i) + G(t_i)Q(t_i)G^T(t_i)
\end{array}
}}$

### Lear's Method
Given a differential equation of the form

{{$
ds(t) = F(t)x(t)dt + B(t) u(t) dt + G(t)d\beta (t)
}}$

The solution can be approximated as 

{{$
\Psi(t_{i+1}, t_i) = I + \Delta t \frac{F(t_{i+1} + F(t_i)}{2} + \frac{\Delta t^2}{2} F(t_{i+1})F(t_i)
}}$

### Savage's Method
Given a differential equation of the form

{{$
dx(t) = F(t)x(t)dt + B(t) u(t) dt + G(t)d\beta (t)
}}$

The solution can be approximated as 

{{$
\begin{array}{l}
	\Delta \Psi = \int_{t_i}^{t_{i+1}} F(\tau) d\tau \\
	\Psi(t_{i+1},t_i) = I + \Delta \Psi + \frac{\Delta \Psi^2}{2!} + \frac{\Delta \Psi^3}{3!} + \cdots
\end{array}
}}$

## The Overall System Model
The measurements can be written as 

{{$
\begin{array}{l}
dx(t) = F(t)x(t)dt + B(t) u(t) dt + G(t)d\beta (t)
z(t_i) = H(t_i)x(t_i) + v(t_i)
\end{array}
}}$

Where $dx(t)$ is the continuous model with measurements available at intervals $z(t_i)$. The noise will be modeled as a white Gaussian discrete-time stocastic process with a first moment (mean) of 0 and a second moment (covariance) of $R(t_i)\; \iff t_i = t_j$.

# (5) Optimal Filtering

{{https://2.bp.blogspot.com/_7YSZm5NIAmQ/S_wNkdp6ClI/AAAAAAAAAOU/hEYy4fWR9Rg/s1600/rw_plot.jpg|Plot of estimate, mean, and covariance}}

# Footnotes
* *1* @maybeck_1979 | Peter S. Maybeck. Stochastic models, estimation and control: A series of monographs and textbooks. Acad. Press, 1979.

