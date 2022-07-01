# Stochastic Programming
As stated by [Wikipedia](https://en.wikipedia.org/wiki/Stochastic_programming.md):

	Stochastic programming is a framework for modeling optimizaiton problems that involve uncertainty. A stochastic program is an optimization problem in which som eor all problem parameters are uncertain, but follow known probability distributions.

## Two-Stage Problem
The idea of two-stage stochastic programming is that (optimal) decisions should be based on data at the time the decisions are made and cannot depend on future observations. The two-stag formulation is widely used in stochastic programming. The general formulation of a two-stage stochastic programming problem is [1](#.md) :

{{$

min_{x \in X}\{g(x) = f(x) + E_{![pic](\zeta)}![pic](Q(x,\zeta))\}

}}$

where $A(x,\zeta)$ is the optimal value of the second-stage problem

{{$
min_{y}\{q(y,\zeta) | T(\zeta)x + W(\zeta)y = h(\zeta)\} \\
}}$

# Footnotes
* *1*. @wiki_stochastic_programming: {Wikipedia contributors} (2021). Stochastic programming --- {Wikipedia}{,} The Free Encyclopedia
