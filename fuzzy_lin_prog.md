# Contents
        - [|Fuzzy Linear Programming](#Fuzzy Linear Programming.md)
                - [|Fuzzy Objective](#Fuzzy Linear Programming#Fuzzy Objective.md)
                - [|Fuzzy Constraints](#Fuzzy Linear Programming#Fuzzy Constraints.md)
                - [|Fuzzy Coefficients](#Fuzzy Linear Programming#Fuzzy Coefficients.md)
        - [|Formulating FFLP](#Formulating FFLP.md)
                - [|A General FLP Model](#Formulating FFLP#A General FLP Model.md)
                        - [|Nasseri's Method](#Formulating FFLP#A General FLP Model#Nasseri's Method.md)
                        - [|Zimmermans's Methods](#Formulating FFLP#A General FLP Model#Zimmermans's Methods.md)
                                - [|min operator](#Formulating FFLP#A General FLP Model#Zimmermans's Methods#min operator.md)
                                - [|product operator](#Formulating FFLP#A General FLP Model#Zimmermans's Methods#product operator.md)
                - [|Zimmerman's Product Example](#Formulating FFLP#Zimmerman's Product Example.md)
                - [|Fuzzy Berth Allocation Problem (BAP) Example](#Formulating FFLP#Fuzzy Berth Allocation Problem (BAP) Example.md)
        - [|Footnotes](#Footnotes.md)

# Fuzzy Linear Programming
Fuzzy linear programming introduces the idea of uncertainty into the model's parameters. This allows for adaptability of plans or "fuzziness" to the solution of the linear program. By doing so, this allows for a more robust model that is guaranteed to result in an efficient solution [|#1](#Footnotes#1.md), [|#3](#Footnotes#3.md). Fuzzy LP is based off [|fuzzy theory](fuzzy_theory.md) which is the basis that allows for the uncertainty.

When a Linear Program's (LP) parameters and decision variables are to be modeled as fuzzy, then the LP is said to be a Fully Fuzzy Lineal Programming Problem (FFLP)  [|#1](#Footnotes#1.md). In other cases when only part of the LP is fuzzy, it is known as a Fuzzy Linear Program (FLP). There are many methods to solve FLP's and FLLP's. Most of them convert the FFLP into a LP [|#3](#Footnotes#3.md).

In [|#3](#Footnotes#3.md), Zimmerman describes 3 approaches to "single out" one specific solution from the set of efficient solutions which qualifies as "optimal"

- The utility approach
- Goal Programming
- Interactive Approaches

The first two assumes that the decision maker can specify their "preference-function" with respect to the combination of teh individual objctive functions in advnace as either a sum of weights (utilites) or distance functions (distance from ideal solution). The third uses only local information in order to arrive at an acceptable compromise solution. We new introduce the fuzzy approach.

## Fuzzy Objective
The fuzzy objective function is characterized by its [|membership function](fuzzy_theory.md), same with its constraints. The "decision" in a fuzzy environment, much like its crips brother, can be viewed as the intersection of fuzzy constraints and fuzzy objective functions. This is implying that the relationship between constraints and the objective functions is fully symmetric (there is no longer a difference between the former and latter) [|#3](#Footnotes#3.md).

## Fuzzy Constraints
As stated previously, fuzzy constraints tolerate violations in the accomplishment of the constraints. The constraint can be represented by

$$
a_i x \lesssim b_i
$$

Where $a$ and $b$ modeled using a [|membership function](fuzzy_theory.md) as described in [|#2](#Footnotes#2.md) and [|#3](#Footnotes#3.md).

$$
\mu_i (x) =
\begin{cases}
	1          & \text{if } a_i x \leq b                        \\
	f_i(a_i x) & \text{if } b_i \leq a_i x \leq b_i + \bar{b}_i \\
	0          & \text{if } a_i x \geq b_i + \bar{b}_i          \\
\end{cases}
$$

A fuzzy solution is found from the solution of the [|parametric linear program](parametric_lin_prog.md) [|#2](#Footnotes#2.md):

$$
\begin{array}{l}
	\text{max } xc    \\
	Ax \leq g(\alpha) \\
	x \geq 0          \\
	\alpha \in (0,1]
\end{array}
$$

where $g(\alpha)$ is a column vector defined by the inverse functions of the $f_i$.

Zimmerman proposes that given a LP:

$$
\begin{array}{l}
	cx \lesssim z_0 \\
	Ax \lesssim b   \\
	x \gtrsim 0
\end{array}
$$

with a linear [|membership function](fuzzy_theory.md), the solution can be of the form [|#3](#Footnotes#3.md)

$$
\begin{array}{l}
	f(x) = 1 - \frac{(Bx)_i - b_i'}{\bar{b}_i} \\
	\lambda \leq \frac{b_i'}{\bar{b}_i} - (\frac{B}{\bar{b}} x)_i
\end{array}
$$

where $f(\cdot)$ defines the linear membership function and $\lambda$ is the developed linear constraint. $B$ is the constraint matrix from $Ax \leq b$ augmented with the objective equations. Similarly $b'$ is $b$ augmented with upper bounds for the objective equations, and $\bar{b}$ are subjectively chosen constraints off addmissible violations [|#3](#Footnotes#3.md).

## Fuzzy Coefficients
If the decision maker does not know exactly the values of the coefficients taking part in the problem, fuzzy numbers can be used to represent this uncertainty [|#2](#Footnotes#2.md).

$$
\sum_{j=1}^n \tilde{a}_{ij} x_j \leq \tilde{b}_i
$$

Given a similar model to solve as before the model for fuzzy coefficients can be defined as

$$
\begin{array}{l}
	\text{max } cx                                                 \\
	[(1-1/2h)(a_i + \bar{a}_i) + 1/2h(a_i - \underline{a}_i)]x \leq \\
	(1-1/2h)(b_i + \bar{b}_i) + 1/2h(b_i - \underline{b}_i),        \\
	[1/2h(a_i + \bar{a}_i) + (1-1/2h)(a_i - \underline{a}_i)]x \leq \\
	1/2h(b_i + \bar{b}_i)+(1-1/2h)(b_i - \underline{b}_i),          \\
	x \geq 0
\end{array}
$$

where $h \in (0,1]$ is a level or degree of optimism being specified by the decision maker a priori. $(a + \bar{a})$ is the upper bound and $(a - \underline{a})$ is the lower bound. Furthermore it is assumed that the upper bound of $a$ is greater than $b$ and similarly lower bound of $a$ is greater than $b$.

# Formulating FFLP
This section contains a list of different ways of formulating LP's.

## A General FLP Model
Consider

$$
\begin{array}{l}
	\text{max } cx \\
	Ax \lesssim b  \\
	x \geq 0
\end{array}
$$

where $a$ is a matrix of fuzzy numbers and $b$ is a column vector of fuzzy numbers. We can then create an ordering via [|ranking functions](fuzzy_theory.md) and state the "fuzziness" with the following constraint:

$$
Ax < b + (1-\alpha)
$$

Where if $\alpha=1$ then the constraint is completely verified and if $\alpha = 0$ then the variable is fully "fuzzy".

### Nasseri's Method
Given an FFLP:

$$
	max\; \sum_{j=1}^n \tilde{c}_j \tilde{x}_j \\
$$
	subject to
$$
	\sum_{j=1}^n \tilde{a}_{ij} \tilde{x}_j \leq \tilde{b}_i\; \forall i = 1 - m \\
$$

where $\tilde{c_j}$, $\tilde{a_{ij$$, $\tilde{b_j}$ are parameters and $\tilde{x_j}$ are non-negative fuzzy numbers [|#1](#Footnotes#1.md). Because these are fuzzy numbers, we can represent them as such:

$$
\begin{array}{l}
	\tilde{c}_j    = (c1_j, c2_j, c3_j)          \\
	\tilde{a}_{ij} = (a1_{ij}, a2_{ij}, a3_{ij}) \\
	\tilde{b}_j    = (b1_j, b2_j, b3_j)          \\
	\tilde{x}_j    = (x1_j, x2_j, x3_j)          \\
\end{array}
$$

Nasseri then proposes that the FFLP can be rewritten as a LP in the following manner:

$$
max\; R\Big(\sum_{j=1}^n (c1_j, c2_j, c3_j)(x1_j, x2_j, x3_j)\Big)
$$
Subject to
$$
\begin{array}{c}
	\sum_{j=1}^n a1_{ij}x1_j \leq b1_j \\
	\sum_{j=2}^n a2_{ij}x2_j \leq b2_j \\
	\sum_{j=3}^n a3_{ij}x3_j \leq b3_j \\
	x2_j - x1_j \geq 0 \\
	x3_j - x2_j \geq 0 \\
\end{array}
$$

### Zimmermans's Methods
Zimmerman proposes two methods in his work:

* FLP using the 'min' operator
* FLP using the dot product operator

#### min operator
Given a FLP with objective function(s) $c^T x$ that is subject to constraints $Ax \leq b$. A membership function can be written such that

$$
\begin{cases}
	0                        & \text{for } (A'x)_i \leq b'_i            \\
	\frac{(A'x)_i b'_i}{d_i} & \text{for b_i < (A'x)_i \leq b'_i + d_i} \\
	1                        & \text{for } (A'x)_i > b'_i + d_i 
\end{cases}
$$

Where this draws a line from $z(-b'_i) = 0$ to $z(d_i) = 1$. Constraints can then be made using the form

$$
\lambda = \frac{b'_i}{d_i} - (\frac{A}{d_i}x)_i
$$

which is appended to the set of constraints.

#### product operator
This method uses the same membership function

$$
\begin{cases}
	0                        & \text{for } (A'x)_i \leq b'_i            \\
	\frac{(A'x)_i b'_i}{d_i} & \text{for b_i < (A'x)_i \leq b'_i + d_i} \\
	1                        & \text{for } (A'x)_i > b'_i + d_i 
\end{cases}
$$

Rather than append to the constraints and maximize or minimize $\lambda$, the objective function is updated with

$$
\text{max } \prod_{i = 1}^K = \frac{(c^i)^T x - p_i}{d_i}
$$

where $c^i$ is the vector to be multiplied with $x$. The constraints are left the same.

## Zimmerman's Product Example
A company manufactures two products, 1 and 2 on given capacities.

* Product 1:
	* profit of 2$
	* import cost of of 1$
* Product 2:
	* profit of 1$
	* profit of 2$ (exported)

As such, there are two goals

a) Profit maximization
b) Maximum improvement of the balance of trade (maximum difference of exports minus imports)

As an example, the membership function for $z_1$ is shown in the figure below

{{local:docs/../img/z1_membership_func.png|Membership function}}

and the problem is written as

$$
\begin{array}{l}
	\text{max } Z(x) =
	\begin{bmatrix}
		-1 & 2 \\
		2  & 1
	\end{bmatrix}
	\begin{bmatrix}
		x1 \\
		x2
	\end{bmatrix} \\
	-x_1 + 3x_2 \leq 21 \\
	x_1 + 3x_2 \leq 27  \\
	4x_1 + 3x_2 \leq 45 \\
	3x_1 + x_2 \leq 30  \\
	x1,x2 \geq 0
\end{array}
$$

Using the method proposed by Zimmerman (as described in [|Fuzzy Constraints](#Fuzzy Linear Programming#Fuzzy Constraints.md)), one yeilds the following formulation

$$
\begin{array}{l}
	\text{max } \lambda \\
	\lambda \leq -0.05582x_1 + 0.117x_2 + 0.1764 \\
	\lambda \leq 0.1429x_1 + 0.0714x_2 - 0.5     \\
	21 \geq -x1 + 3x_2                           \\
	27 \geq x1 + 3x_2                            \\
	45 \geq 5x_1 + 3x_2 	                     \\
	30 \geq 3x_1 + x_2                           \\
	x \geq 0
\end{array}
$$

Where the maximum "overval satisfaction" of $\lambda = 0.74$ is achived with $x = [5.03, 7.32]^T$.

## Fuzzy Berth Allocation Problem (BAP) Example
In the [|BAP](berth_allocation_problem.wiki.md), arrivals of each vessel are highly uncertain, meaning vessels can arrive earlier or later than they were scheduled to arrive. Having to frequently review the berthing plan is not desirable from a planning of resources point of view. A FFLP for the BAP problem to minimize the total time can be expressed as

$$
min\; \sum_{i\in V} (\tilde{m}_i - \tilde{a}_i)
$$

Such that

$$
\begin{array}{l}
	\tilde{m}_i \geq \tilde{a}_i                               \\
	p_i + l_i \leq L                                           \\
	p_i + l_i \leq p_j + M(1-z_{ij}^x)                         \\
	\tilde{m}_i + \tilde{h}_i \leq H                           \\
	\tilde{m}_i + \tilde{h}_i \leq \tilde{m}_j + M(1-z_{ij}^x) \\
	z_{ij}^x + z_{ji}^x + z_{ij}^y + z_{ij}^y + \geq 1         \\
	z_{ij}^x, z_{ij}^y \in \{0,1\}
\end{array}
$$

where the parameters are

* $L$   : Total length of the quay
* $H$   : Planning horizon
* $V$   : Set of incoming vessels
* $a_i$ : Arrival time at port
* $l_i$ : Vessel length
* $h_i$ Handling time of the vessel ($\tilde{h} = (h, h, h)$
	* This value is considered a _singleton_?

and the decision variables are

* $m_i$      : Berthing time of the vessel
* $p_i$      : Berthing position of the vessel
* $z_{ij}^x$ : Indicates if vessel $i$ is to the left of vessel $j$ at berth
* $z_{ij}^y$ : Indicates that the berthing time of vessel $i$ is before that of $j$

Using Nasseri's Method in [|#1](#Footnotes#1.md) the BAP can be described as

$$
min\; \sum_{i\in V} (m1_i - a3_i, m2_i - a2_i, m3_i - a1_i)
$$

Subject to

$$
\begin{array}{l}
	{m}1_i \geq {a}1_i                                 \\
	{m}2_i \geq {a}2_i                                 \\
	{m}3_i \geq {a}3_i                                 \\
	p_i + l_i \leq L                                   \\
	p_i + l_i \leq p_j + M(1-z_{ij}^x)                 \\
	{m}1_i + {h}1_i \leq H                             \\
	{m}2_i + {h}2_i \leq H                             \\
	{m}3_i + {h}3_i \leq H                             \\
	{m}1_i + {h}_i \leq {m}1_j + M(1-z_{ij}^x)         \\
	{m}2_i + {h}_i \leq {m}2_j + M(1-z_{ij}^x)         \\
	{m}3_i + {h}_i \leq {m}3_j + M(1-z_{ij}^x)         \\
	z_{ij}^x + z_{ji}^x + z_{ij}^y + z_{ij}^y + \geq 1 \\
	z_{ij}^x, z_{ij}^y \in \{0,1\}
\end{array}
$$

An example solution in [|#1](#Footnotes#1.md) can be shown in the following figure:

{{local:docs/../img/fuzzy_berth_plan.png|Fuzzy berth plan in polygonal-shape}}

# Footnotes
* *1* @gutierrez_2019 | Flabio Gutierrez and Edwar Lujan and Rafael Asmat and Edmundo Vergara (2019). Fully Fuzzy Linear Programming Model for the Berth Allocation Problem with Two Quays
	- [ ] Read ![pic](6)
	- [ ] Read ![pic](7)
	- [ ] Read ![pic](8)
* *2* @delgado_1989 | M. Delgado, J.L. Verdegay, and M.A. Vila. A general model for fuzzy linear programming. Fuzzy Sets and Systems, 29(1):21--29, 1989.
* *3* @zimmermann_1978 | multiobjective lp fuzzy | H.-J. Zimmermann (1978). Fuzzy programming and linear programming with several objective functions
