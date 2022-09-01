# Random Variables
Real-valued point function which assigns a real value to each point in the sample space. This is typically denoted as

$$
    x(\omega) = x
$$

# Probability Density Function (Cumulative Distribution Function) (CDF)
The probabilities established as $P(A)$ and the realizations $x(\omega)$ of the random variable $x$ are related by the probability distribution function $F_x(\cdot)$. a mapping from $\mathbb{R}^n$ to $[0,1]$. that yields $F_x(\xi)$ as the probability of the set of $\omega \in Omega$ such that $x(\omega) \leq \xi$.

# Probability Density Function (PDF)
$$
    F_x(\xi) = \int_{- \infty}^{\xi} f_x(\rho) d\rho
$$

# Expected Values
The expected value is just the average value one would obtain over the ensemble of outcomes of an "experiment". It is denoted as $E[x]$.

# First And Second MomentsT
The first moment is simply the mean of a random variable $x$:

$$
    m \equiv E[x] = \int_{- \infty}^{\infty} \xi f_x(\xi) d\xi
$$

The second (non-central) moment (otherwise known as the autocorrelation matrix) of $x$  is

$$
    \Psi \equiv E[xx^T] = \int_{- \infty}^{\infty} \xi \xi^T f_x(\xi) d\xi
$$

The second central moment of $x$ (covariance matrix) can be written as:

$$
    P \equiv E[(x-m)(x-m)^T] = \int_{- \infty}^{\infty} (\xi - m)(\xi - m)^T f_x(\xi) d\xi
$$

Where $P$ is positive semi-definite (eigenvalues are nonnegative).

# Transition Matrix
A transition matrix describes the probability of moving from one node in a graph to another. Markov chains are said to be

* Irreducible: It is possible to move from any state in the state space to any other state
* Recurrent: The probability of eventually returning to a state is 1
* The rows add up to 1

# Stationary Distribution
Any solution to the stationary equations

$$
\begin{array}{c}
    p = p P \\
    \sum_{j} p_j = 1
\end{array}
$$

is called a stationary distribution.

# Ergodicity
 A stochastic process $X(t)$ is ergodic in the most general sense if all its "measures" can be determined or well approximated from a single realization $X_0(t)$ of the process.

# TODO Poisson Process

# TODO Exponential Random Variable
