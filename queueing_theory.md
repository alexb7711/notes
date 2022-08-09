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
+--------------------------------+----------------+-------------------------------+
| Characteristics                | Symbol         | Explanation                   |
+================================+================+===============================+
| Interval-time distribution (A) | $M$            | Exponential                   |
| Service-time distribution (B)  | $D$            | Deterministic                 |
|                                | $E_k$          | Erlang type $k \in (1,2,...)$ |
|                                | $H_k$          | Mixture of $k$ exponentials   |
|                                | $PH$           | Phase type                    |
|                                | $G$            | General                       |
+--------------------------------+----------------+-------------------------------+
| Parallel servers (X)           | $1,2,...,\inf$ |                               |
| System Capacity (Y)            | $1,2,...,\inf$ |                               |
| Queue discipline (Q)           | FIFO           | First In First Out            | 
|                                | LIFO           | Last In First Out             |
|                                | RSS            | Random Selection of Service   |
|                                | PR             | Priority                      |
|                                | GD             | General discipline            |
+--------------------------------+----------------+-------------------------------+

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

$$
L = \lambda W
$$

A few notes can be taken about this theorem:

* It is a statement about long running averages
* The limits for $\lambda$ and $W$ must exists. This therefore does not include systems that grow without bound (i.e. customers arrive faster than the services can output)
* The theorem does not nececarrily require "queues". Rather it requries a "system" to which the entities arrive and from which they depart. The system can therefore be reguarded as a black box with no specific requirements as to what happens in the box.

# Review of Stochastic Process

# Simple Markovian Queuing Models

# Advanced Markovian Queuing Models

# General Arrival or Service Patterns

# Bounds And Approximations

# Numerical Techniques And Simulation
