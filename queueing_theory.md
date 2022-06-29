# Fundamentals of Queueing Theory
## Introduction
### Measurement of System Performance
* Types of effectiveness of a queuing system
	* Waiting Time
	* Number of customers
	* Idle time
* Allows us to allocate resources to acquire a desired system performance

### Characteristics of Queueing Systems
1. Arrival Pattern of customers
	* Common arrival process is the _Poisson process_
	* Arrival pattern that does not change with time is _stationary_
	* Arrival pattern that does change with time is _nonstationary_
	* The behavior of arriving customers is also important
		* If a customer decides not to enter the queue on arrival, the customer _balked_
		* If a customer enters a line then exits later, the customer _reneged_
		* If a costumer enters a line then leaves it to enter another line, the customer _jockeyed_
2. Service pattern of servers
	* The server may depend on the number of customers in line. If so, then the server is said to be _state-dependent_
	* Servers may be stationary and nonstationary in the same sense of customers
3. Number of servers and service channels
4. System Capacity
5. Queue discipline
	* FIFO
	* LIFO
	* Priority sorted
		* Nonepreemtive: The highest priority customer goes to the head of the queue but waits for process to finish
		* Preemtive: Higher priority is allows to enter service immediately upon arrival
6. Number of service stages

### Exponential Distribution
* Tail distribution

{{$
	P(X \geq x) = \text{exp}(-\lambda x)
}}$

* Mean, variance and squared coefficient of variation:
	* Mean: $E(X) = 1/\lambda$
	* Variance: $var(X) = E(X^2) - (E(X))^2 = E((X - E(X))^2 = 1/\lambda^2$
	* Squared coefficient of variation: $Cv^2 = var(x)/(E(X))^2 = 1 \forall \lambda$

* Properties:
	* Memoryless
		* $P(U_i \geq u) = \text{exp}(-\lambda u)$
	* Minimum of two exponential random variables
		* $ P(U\leq S) = \frac{\lambda}{\lambda + \mu}$
		* $ P(U > S) = \frac{\mu}{\lambda + \mu}$

### Poisson Arrivals
The successive inter-arrival times $U_i = T_{i+1} - T_i$ are independent and distributed according to the exponential law with parameter $\lambda$

{{$
	P(U_i \geq u) = \text{exp}(-\lambda u)
}}$

where $\lambda$ represents the average arrivals per unit time.

### Exponential Service Durations
In general, it is assumed that

* service times are independent and identically distributed
* characterized by their probability distribution

The exponential distribution is an important case of service duration

{{$
	P(S_i \geq s) = \text{exp}(-\mu s)
}}$

where $\mu$ is the average number of clients served per unit time.

### Offered Load
Average performance depends on the offered load $\rho$, defined as

{{$
	\rho = \frac{\lambda}{\mu}
}}$

The unit of $\rho$ is the Erlang, a dimensionless unit.


## Motivating Examples and M/M/1 queue

### Steady-State Probabilities Computation
{{$
	\pi_i = \pi_0 \frac{\lambda}{\mu}^i\; i = 1,2,...
}}$

### Stability Condition for Steady State Behavior
The arrival rate is lower than the service rate:

{{$
	\lambda < \mu
}}$

or $\rho = \lambda/\mu < 1$ (traffic intensity or load$

### Kendall Notation
    A/B/c/K/m/z

* A: Interarrival distribution
* B: Service time distribution
* X: number of servers
* Y: The capacity of the queue
* Z: Queue discipline
  * FIFO
  * LIFO
  * etc.

| Characteristics                    | Symbol | Explanation                  |
|------------------------------------|--------|------------------------------|
| Interarrival-time distribution (A) | $M$    | Exponential                  |
|                                    | $D$    | Deterministic                |
|                                    | $E_k$  | Erlang type $k\; (k = 1,2)$  |
| Service-time distribution (B)      | $H_k$  | Mixture of $k$ exponentials  |
|                                    | $PK$   | Phase type                   |
|                                    | G      | General                      |
| Parallel servers (X)               | 1 2    |                              |
| System capacity (Y)                | 1 2    |                              |
| Queue discipline (Z)               | FCFS   | First come first serve       |
|                                    | LCFS   | Last come first serve        |
|                                    | RSS    | Random selection for service |
|                                    | PR     | Priority                     |
|                                    | GD     | General discipline           |

## Little's Law
* $\lambda$: Average rate that customers arrive to a system
* $W$: Average wait time that a customer spends in the system
* $L$: Average number of customers in the system

{{$
	L = \lambda W
}}$

## $H = \lambda G$
$L = \lambda W$ is a special case of a more general relation.

{{$
	H = \lambda G
}}$

* $G$: Average cost or work associated with a customer
* $H$: Total average cost per time incurred by the system

## Simple Streams

The foundation for queuing theory is based on the modeling of customers arriving at a queuing system. This is the _simple case of streams_ is represented as the probability that $k$ customers arrive in a timer interval of length $t$ is represented as

{{$
  P_{k}(t) = \frac{\lambda t)^k}{k!} e^{\lambda t}
}}$

where $\lambda > 0$. Importantly, the incoming stream is assumed to compose the following properties

    Given any finite group of nonoverlapping time intervals, the number of customers arriving during each interval are [|theory_of_statistics](mutually independent random variables.md).

*Definition*: A finite or countable sequence $\tau_n$ of random variables defined on the same probability space under the ocndition that in any fixed time interval $(a,b)$ with probability 1 a finite number of these variables falls in it is called a _stream of homogenous events_.

*Lemma* The number of $v(a,b)$ of events of a stream in the half-interval $[a-b)$ is a random variable.

## Qualitative Assumptions and Their Analysis
The following are some conditions for estabilshing what a simple stream is:

* *Stationarity of a stream*: The probability that $k_1, k_2, ..., k_n$ costomers, respectively, will arrive in each interval of any finite group of $n$ nonoverlapping time intervals depends only on the $k_i$ and on the lengths of the time intervals, but not on their positions on the axis in time.
* *Absence of aftereffects*: The probability of $k$ customers arriving during a time interval $(T,T+t) does not depend on the number and type of customers arriving before $T$.
* *Orderliness of the stream*: Expresses the practical impossibility that two or more customers will arrive at the same instant of time. 

Therefore a simple stream must adhere to all these conditions. Although they don't comletely model real world scenarios accurately, it provides a good basis to start from

## Distribution of Events
*Theorem*: Under the condition that the number of events of a simple steam in the interval $(a,b)$ equals $n$, the times of these events are independent and uniformally disributed on the interval $(a,b)$.

## The Intensity and Parameter of a Stream
The mean number of customers arriving in a time interval is denoted as

{{$
M\mu(t) = e^{\lambda t} \sum_{k=1}^{\infty} k \frac{(\lambda t)^k)}{k!} = \lambda t
}}$

Where $\mu(t)$ is the actual number of customers arriving during a time interval of length $t$. The mathematical expectation of the number of costomers arriving in this unit time is called the _intensity of th stream_. For a simple queue $\lambda = \mu$ for which $\lambda$ is called the _parameter of the stream_.

# Serivicing and Waiting


# References
* 1 @fundamentals | John F Shortle, James M Thompson, Donald Gross, and Carl M Harris. Fundamentals of Queueing Theory. John Wiley {\&} Sons, Inc., jan 2018.
* [|Introduction To Queuing Theory](https://www.youtube.com/watch?v=rSZWig173xM.md)
