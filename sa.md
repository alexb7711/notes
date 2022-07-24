# Overview of Metaheuristic Optimization

## Introduction

An optimization problem can be defined as

$$
\begin{array}{c}
    min/max\; F(x) \\
    \text{Subject to} \\
    g(x) = 0 \\
    h(x) \leq 0 \\
    x \in X
\end{array}
$$

Where a constrained optimization problem includes the constraints and an unconstrained problem does not. There are two main approaches to the optimization problem: Classical or exact optimization methods and heuristic optimization techniques.

> Exact optimization methods, such as the Augmented Lagrangian, Newton-Raphson, sequential quadratic programing, dynamic and integer programming, and interior point method, are abased on an estimation of the global optimum. Classical methods such as linear programming and nonlinaer programming are efficient approaches that can e used to solve special cases of optimization problem in power system applications. However, due to difficulties of differentiability, nonlinearity, and nonconvexity, these methods failed to provide the global optimum and only reached the local one. Moreover, these methods exhibit some limitations depending on the type of problem.

## Description of metaheuristics
An important feature of heuristic algorithms is that they can solve problems of high complexity with approximate accuracy. However, there is not guarantee of optimality. The recent trend in the literature is to name all stocastic algorithms with randomization and local search as "metaheuristic." 

* Random process generates aribrary solutions (explore the search space)
* Determine convergence and focus on achieving good solutions in a specific regio  (exploitation: local search)

> A metaheuristic is a high-level problem-independent algorithmic framework that provides a set of guidelines or strategies to develop heuristic optimization algorityhms. The term is also used to refer to a problem specific implementation of a heuristic optimization algorithm alccording to the guidelines expressed in such a framework.


A fundamental difference between the methods is based on the number of solutions in one iteration

* single-solution-based (simulated annealing, etc.)
    *  exploitation oriented
* popluation-based (genetic algorithm, particle swarm, etc.)
    * exploration oriented

## Princicple of popluation-based mateheuristics
* $N$ agents: size of population
* $n$ control variables

Generate new population by applying algorithmic operators with stochastic search mechanism on agents from the current population.

```C
F(x) // Define objective function
POP(0) // Generate initial population
iter = 0 // Iteration counter

while !stop_criteria
{
    F(xi(iter)) // Calculate the fitness for each agent
    POP(i+1) // Generate new population by applying algorithmic operaters
}

return x;
```

### Genetic Algorithm (GA)
1. Data is represented as a string. Each substring represents a binary encoded variable on which the process of optimization is carried out on
2. Init: Random strings are set
3. Fitness function is used to rateindivituals
4. Selection: Parents are decided to create children (pass down good trates)
5. Crossover: Exchange of parts between parents to make a child
6. Mutation: With a given probability, allow random variation in the child
7. Ending conditions: This process when the maximum number of generations is achieved or some other criteria is met.

### Differential Evolution
This process uses similar operators as GA. It is however more greedyin the selection process

1. Initialize
2. Mutation: Generate new vectors by adding weighted differences between two solution vectors to a third. $v_i(iter+1) = x_{k1}(iter) + F*(x_{k2}(iter) - x_{k3}(iter$))
3. Crossover: The mutated vector that was just created is then mixed with another vector. Each item is iterated through and if rand(0,1) > CR then they are swapped, otherwise they are not
4. If the trail vector has a lower cost than the vector used in the crossover, swap them. Each vector in the poopulation must be used as the crossover vector each generation.
5. Repeat until stopping conditions met

### Evolutionary Programming (EP)
Very similar to the methods previously described, EP makes new solutions by perturbing each componnt of existing solutions by a random amount.

$$
x_i^d (iter+1) = x_i^d(iter) + N[0,(\sigma_i^d)^2]
$$

* $x_i^d$ is the $d^{th}$ component in the solution vector
* $N[0,(\sigma_i^d)^2]$ is a Gaussian random number with a mean of zero and a standard deviation of $\sigma_i^d$.

$$
\sigma_i^d = (x_{i,max}^d - x_{i,min}^d)\frac{fit_{max}-fit_i}{fit_{max}-a^t}
$$

* $fit_i$ is the fitness of individual i
* $fit_{max}$ is the maximum fitness in the current poopulation
* $x_{i,min/max}^d$ is the minimum/maximum limuts of the $d^{th}$ variable

### Particle Swarm Optimization
"Particles fily around" in the search space to find the best solution. These particles consider the best global solution found as well as the best local solution found to determine their next move. The velocities are updated via

$$
v(iter+1) = w\cdot v_i(iter) +C_1\cdot r_1 \cdot (pbest_i(iter) - x_i(iter)) + C_2\cdot r_2 \cdot (gbest(iter) - x_i(iter))
$$

To which the solution vector is updated by

$$
x_i(iter+1) = x_i(iter) + v_i(iter+1)
$$

* $C$ values are positive constants
* $r$ values are random numbers between 0 and 1

## Ant colony optimization
Search paths leaves pheremones. The better solutions attract more ants, leaving more pheremones, which attracts more ants.

## Multi-Objective Particles Swarm Optimization Approaches
* What is an optimal solution for a multi-objective probem: Pareto optimal
    * There exists no other feasible solution which would decrease some objective without causing a simultaneous increase in at least one other objective
    
## Concepts and Notation
* Strong dominance: one solution is better than another in all decision variables
* Weak dominance: one solution is better than another in some decision variables
    *  Irreflexive: solution does not dominate itself
    *  Asymmetric: $x_1 \leq x_2$ does not imply $x_2 \leq x_1$
    *  Tansitive: if $x_1 \leq x_2$ and $x_2 \leq x_3$ then $x_1 \leq x_3$

## Multi-Objective Evolutionary Algorithms
Elitism/Non-Elitms Approach is based on whether the algorithm stores or does not store the best solutions
    * Initialize
    * (optional) select elitist solutions from search space from population
    * Create mating pool(s) (create a seperate one for elitist choices)
    * Perform reproduction based on the pool
    * Possibly combine elitist pool into population
    * Repeat until terminal condition

## Problems and Research Issues
* interdependency among variables
* scaleability
* expensive object-value evaluation

## Performance Assessments
Usually used to compare algorithms to understand which one is better in what aspects. A couple of critera are employed:

* Closeness of the objtained nondominated setto the Pareto optimal front
* A gooness distribution of solutions within the set
* Spread of the objtained nondominated front. For each objective, a wide range of values should be covered by the nondominated solutions

### Metrics Evaluating Closeness to the POF
Error rate ($ER$) is calculated by the percentage of solutions that are not POF

$$
ER = \frac{\sum_{i=1}^{N} e_i}{N}
$$

* N is the size of the objtained set
* $e_i = 1$ if the solution is not POF, otherwise it is 0
* Not a good solution when comparing solutions from different POFs

The second metric is the generation distance ($GD$). This is the average distance from the set of solutions found by evolution of the POF

$$
GD = \frac{\sqrt{\sum_{i=1}^N d_i^2}}{N}
$$

* $$ is the Euclidiean distance from solution $i$ to the nearest solution in the POF

### Metrics Evaluating Diversity Among Obtained Nondominated Solutions
Spacing method ($S$)

$$
S = \frac{1/N \sum_{i=1}^N(\bar{d} - d)^2}{\bar{d}}
$$

where $d_i = min \sum_{m=1}^M|f_m^i - f_m^j|$
