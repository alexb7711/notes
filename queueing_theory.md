# Introduction

## Characteristics of Queueing Systems

* Arrival pattern of customers
    * Usual arrival processes are stochastic so it is necessary to know the probability distribution describing the times between successvie customer intervals (Poisson process)
* Service paterns of servers
    *  Service times are typically stochastic as well, so it is good to know the probability distribution to describe the sequence of customer service times
* Number of servers and service channels
    *  The number of servers cause the system to be expensive to it is good to have the numbers of server be a choice
* System capacity
    * Physical limiations of the system.
* Queue discipline
    *  FIFO, LIFO, RSS (random selection of service), etc.
* Number of service stages
    * Single stage service, multi-stage service

### Notation
+-------------------------------------+---------------------+------------------------------------+
| Characteristics                     | Symbol              | Explanation                        |
+=====================================+=====================+====================================+
| Interval-time distribution (A)<br/> | $M$            <br/>| Exponential                   <br/>|
| Service-time distribution (B) <br/> | $D$            <br/>| Deterministic                 <br/>|
|                                     | $E_k$          <br/>| Erlang type $k \in (1,2,...)$ <br/>|
|                                     | $H_k$          <br/>| Mixture of $k$ exponentials   <br/>|
|                                     | $PH$           <br/>| Phase type                    <br/>|
|                                     | $G$            <br/>| General                       <br/>|
    +-------------------------------------+-----------------+------------------------------------+
| Parallel servers (X)                | $1,2,.,\infty$ <br/>|                                    |
| System Capacity (Y)                 | $1,2,.,\infty$ <br/>|                                    |
| Queue discipline (Q)                | FIFO           <br/>| First In First Out            <br/>|
|                                     | LIFO           <br/>| Last In First Out             <br/>|
|                                     | RSS            <br/>| Random Selection of Service   <br/>|
|                                     | PR             <br/>| Priority                      <br/>|
|                                     | GD             <br/>| General discipline            <br/>|
+-------------------------------------+---------------------+------------------------------------+

## Little's Law
A fundamental law used extensivly in queuing theory is Little's Law. Little's Law provides a relationship between three funcamental quantities: The average rage $\lambda$ that customers arrive to the system, the average wait time $W$ that a customer spends in the system, and the average number $L$ of customers in the system. This relationship is given by $L=\lambda W$.

\begin{equation}
\label{eq:little\limits}

\begin{array}{lll}

    \lambda \equiv \lim_{t \rightarrow \infty} \frac{A(t)}{t}             &
    W \equiv \lim_{k \rightarrow \infty} \frac{1}{k} \sum_{i=1}^{k} W^k   &
    L \equiv \lim_{T \rightarrow \infty} \frac{1}{T} \int_{0}^{T} N(t) dt

\end{array}
\end{equation}

Where

* $A(t)$: Cumulative number of arrivals at time $t$
* $W^k$: Time customer $k$ spends in the system
* $N(t)$: Number of customers in the system at time $t$

> Theorem 1.1: [Little's Law] If the limit $\lambda$ and $W$ in \ref{eq:little-limits} exists and are finits then the limit $L$ exists and

\begin{equation*}
L = \lambda W
\end{equation*}

A few notes can be taken about this theorem:

* It is a statement about long running averages
* The limits for $\lambda$ and $W$ must exists. This therefore does not include systems that grow without bound (i.e. customers arrive faster than the services can output)
* The theorem does not necessarily require "queues". Rather it requries a "system" to which the entities arrive and from which they depart. The system can therefore be regarded as a black box with no specific requirements as to what happens in the box.

### $H = \lambda G$
It turns out that Little's Law is a special case of a more general relationship $H = \lambda G$

* $G$: Cost or work
* $H$: Total average cost per time incurred by the system
nn* $\lambda$: Average rate that customers arrive to the system

### Distributional Form of Little's Law
TODO: Link to probability section for moments
TODO: Link for stationary

Little's law provides a relationship between the first moments of $N(T) \equiv A(t) - D(t)$ (Arrival - Departure) and $W^k$. It is also possible to relate higher moments as well. To state the distributional form a few assumptions are made

1. Arrival process is stationary
2. Customers depart from the system in the order they arrive
3. The time spent $W^k$ by the $k$th customer in the system is stationary
4. $W^k$ is independent of the arrival process after the arrival of customer $k$

\begin{equation}
   Pr\{N(t) \leq j\} = Pr\{A(W^k) \leq j\}
\end{equation}

The statement above states: if one generates a random waiting time $W^k$ and then generates a random number of arrivals occuring over an interval of length $W^k$ then this has to be the same distribution as the number of customers in the system.

# Review of Stochastic Process
TODO: Add stochastic process section link here

Exponential distributions are often used to model the time until a particular event occurs. It is closely related to the Poisson process as well as fundamental to the theory of Markov chains.

> Definition 2.1: An exponential random variable is a continuous random variable with probability density function (PDF)

\begin{equation}
    f(t) = \lambda e^{-\lambda t}\; (t\geq 0)
\end{equation}

> where $\lambda$ is a constant.

Furthermore,

> Theorem 2.1: An exponential random variable has the memoryless property

> Theorem 2.3: Let $T_1,...,T_n$ be independent exponential random variables with rates $\lambda_1,...,\lambda_n$, respectively. Then $min\{T_1,...,T_n\}$ is exponentially distributed with rate $\lambda_1+...+\lambda_n$.

> Theorem 2.4 Let $T_1,...,T_n$ be independent exponential random variables with rates $\lambda_1,...,\lambda_n$, respectively. Then

\begin{equation}
    Pr\{T_i = min\{T_1,...,T_n\}\} = \frac{\lambda_i}{\lambda_1+...+\lambda_n}
\end{equation}

> Theorem 2.5: Let $T_1,...,T_n$ be independent exponential random variables with rates $\lambda_1,...,\lambda_n$, and let $T = min\{T_1,...,T_n\}$. Then the event $\{T_i = T\}$ is independent of $T$.

## The Poisson Process
Intuitively, the process can be though of describing events that occur "randomly" in time. A _counting_ process is a stochastic process in which $N(t)$ takes on nonnegative integer values and is nondecreasing in time. A counting process typically represents the cumulative number of events that have occurred by time $t$.

> Definition 2.3: A Poisson process with rate $\lambda > 0$ is a counting process $N(t)$ with the following properties:
>
> 1. $N(0) = 0$
> 2. $Pr\{ \text{1 event between } t+ \Delta t\} = \lambda \Delta t + o(\Delta_t)$
> 3. $Pr\{ \text{2 event between } t+ \Delta t\} = o(\Delta_t)$
> 4. The number of events in non-overlapping intervals are statistically independent; that is, the process has independent increments.

The Poison random variable is

> Definition 2.4: A Poisson random variable is a discrete random variable with probability mass function

\begin{equation}
    p_n = e^{-A \frac{A^n}{n!}}\; (n=0,1,2,...)
\end{equation}

> where $A>0$ is a constant.

The following theorem links the Poisson process and the Poisson random variable.

> Theorem 2.6: Let $N(t)$ be a Poisson process with rate $\lambda >0$. The number of events occurring by time $t$ is a Poisson random variable with mean $\lambda t$. That is,

\begin{equation}
    p_n = e^{-A \frac{A^n}{n!}}\; (n=0,1,2,...)
\end{equation}

> where $p_n(t) \equiv Pr\{N(t) = n\}$.

Furthermore, the Poisson process is

* The distribution is stationary, that is the of the number of events in a given time interval is dependent only on the length of the interval and not the location of the interval
* The times between successive events are exponentially distributed with rate $\lambda$
* Event times are uniformly distributed on a time interval $[0,T]$, given that a certain number of events have occurred on the interval. The _ordered_ event times follow the order statistics of $k$ independent uniform random variables.
* (Splitting): Let $N(t)$ be a Poisson process with rate $\lambda$. Suppose that each event is labeled a type-i event with probability $p_i$, independent of all else. Let $N_i(t)$ be the number of type-i events by time $t$. Then $N_i(t)$ is a Poisson process with rate $\lambda p_i,\; i=1,...,n$. Furthermore, $N_i(t)$ and $N_j(t)$ are independent for all $i\neq j$.
* (Superposition): Let $N_1(t),...,N_n(t)$ be independent Poisson processes with rates $\lambda_1,...,\lambda_n$, respectively. Then $N(t) \equiv N_(1) + ... + N_n(t)$ is a Poisson process with rate $\lambda \equiv \lambda_1 + ... + \lambda_n$.

## Discrete-Time Markov Chains
For discrete-time Markov chains, the transitions are assumed to occur at discrete points in time. The fundamental assumption that underlines Markov chains is the Markov property

\begin{equation}
    Pr\{X_{x+1} = j | X_0 = i_0, X_1=i_1,...,X_n=i_n\} = Pr\{ X_{n+1} = j | X_n = i_n \}
\end{equation}

Intuitively, this means that to characterize the future behavior it is just as useful to know only the present state or the present state as well as all the history.

### Properties of Markov Chains
State $j$ is *accessible* to state $i\; (i \rightarrow j)$ if there exists an $n \geq 0$ such that $p_{ij}^n > 0$. Two states communicate with each other if $i \leftrightarrow j$. A chain is *irreducible* if all of its state communicate (any state can get to any other state). A state is recurrent if the probability of returning to itself is 1, and it is transient if it will return to itself in $n$ steps.

### Long-Run Behavior
The concept of long run behavior consists of the idea that the probability of being at a particular state does not depend on the starting state.

> Theorem 2.13: An irreducible and positive recurrent discrete-time Markov chain has a unique soltion to the stationary equations

\begin{equation}
\begin{array}{ccc}
   \pi = \pi P  & \text{and} & \sum_j \pi_j = 1
\end{array}
\end{equation}

> namely, $\pi_j = 1/m_{jj}$. Futhermore, if the chain is aperiodic, the limiting probability distribution exists and is equal to the stationary distribution.

### Ergodicity
[Ergodicity](./statistics.html#ergodicity) is important in that it deals with the problem of determining measures of a stochastic process. In general, a stochastic process is ergotic if all its "measures" can be determined, or well approximated from a single realization. Since statistical measures are usually expressed as time averages it is said: the stochastic process is ergotic if the time averages equal ensemble averages (expected values). *An ensemble average is obtained from multiple realizations of the process at a fixed point in time*. 

We say that a process is fully ergodic (ergodic in distribution function) if this property holds for all moments. A process might be ergodic for certain moments, but not for others. In queueing theory, we are typically interested in fully ergodic processes.

## Continuous-Time Markov Chains
A CTMC transitions from state to state just like a discretetime Markov chain, but the time spent in each state is now an exponential random variable in continuous time. Alternatively, a CTMC can be parameterized by a matrix

$$
q_{ij} = v_i p_{ij}
$$

* $v_i$ can be interpreted as the transition rate out of state $i$
* $q_{ij}$ can be interpreted as the transition rate from state $i$ to state $j$

> The equation above states that the transition rate from $i$ to $j$ equals the transition rate out of $i$ multiplied by the probability of going from $i$ to $j$.

This also drives the meaning of the *rate-transistion matrix*

$$
\begin{bmatrix}
v_{0} & q_{01} & q_{02} & \cdots \\
q_{10} & v_{1} & q_{11} & \cdots \\
\vdots & \vdots & \ddots & \ddots 
\end{bmatrix}
$$

Many queueing systems can be represented as birth death processes, where the system state $X(t)$ denotes the number of customers in the system at time $t$

### Long-Run Behavior

> Theorem 2.16: For a continuous time Markov chain, if the embedded discretetime chain is irreducible and positive recurrent, then there is a unique solution to the stationary equations $0 = pQ$ and $\sum_j p_j = 1$ where 0 is a vector of zeros (0; 0; : : :). Furthermore, if the mean holding times in all states are bounded (vi > 0 for all i), the chain has a limiting probability distribution equal to the stationary distribution.

In component form

$$
   p_j v_j = \sum_{r \neq j} p_r q_{rj}
$$

This can be interpreted as follows. The left side is the rate of transitions out of state $j$. On the right side, $p_r q_{rj}$ is the rate of transitions from state $r$ to $j$. Summing over $r$ gives the overall rate of transitions into state $j$. Thus, theorem 2.16 is a statement that the rate of transitions out of a state equals the rate of transitions into the state.

# Simple Markovian Queuing Models

# Advanced Markovian Queuing Models

# General Arrival or Service Patterns

# Bounds And Approximations

# Numerical Techniques And Simulation
