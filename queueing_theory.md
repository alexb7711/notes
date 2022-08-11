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
+-------------------------------------+---------------------+------------------------------------+
| Parallel servers (X)                | $1,2,...,\inf$ <br/>|                                    |
| System Capacity (Y)                 | $1,2,...,\inf$ <br/>|                                    |
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

    \lambda \equiv \lim_{t \rightarrow \inf} \frac{A(t)}{t}             &
    W \equiv \lim_{k \rightarrow \inf} \frac{1}{k} \sum_{i=1}^{k} W^k   &
    L \equiv \lim_{T \rightarrow \inf} \frac{1}{T} \int_{0}^{T} N(t) dt

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
* $\lambda$: Average rate that customers arrive to the system

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

# Simple Markovian Queuing Models

# Advanced Markovian Queuing Models

# General Arrival or Service Patterns

# Bounds And Approximations

# Numerical Techniques And Simulation
