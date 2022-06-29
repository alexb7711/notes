# Discrete-Time Markov Chains
Variables:
* Process: evolves over time
* Random: Not perfectly predictable
* Discrete-time: Possible changes at periods
* State: A possible value for $X_n$

    Definition: Markov Chain: The future is independent of the past, given the present. In other words,

    {{$
    	P(X_{n+1} = j | X_n = i)\; \text{depends only on } i \text{ and } j
    }}$

# Representing A Discrete-Time Markov Chain
Ingredients of a discrete-time Markov chain are:
* Current State (order them)
* Transition possibilities (matrix represents $P_{ij}$ that represents the transition probabilities)
	* Rows sum up to 1

# Steady-State Distribution of a Discrete-Time Markov Chain
Under certain mild conditions, called ergodicity conditions, the state probabilities converge to values that do not depend on the initial state probabilities. _A necessary condition for this to occur is that we must be able to reach any other state with positive probability_.

## Calculating Steady-State Probabilities
The probability of entering node $i$ should be the same as the probability exiting node $i$, this is represented by the following equation:

{{$
	\pi_i \sum_{i \neq j} P_{ij} = \sum_{j\neq i} \pi_j P_{ji}
}}$

This also applies to subsets of the transition diagram.

## Markov Chain Ergodicity Conditions

    Necessary and sufficient condition: For a discrete Markov chain $X$, starting from any initial state or distribution, the probabilities $[\pi_1(n), \pi_2(n), ...]$ converge to a unique positive vector $\pi = [\pi_1, \pi_2,...]$ iff the chain is

    * irreducible
    * aperiodic
    * positive recurrent
