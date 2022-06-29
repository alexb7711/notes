# What is a Lipschitz Condition?

This is a basic introduction to Lipschitz conditions within the context of differential equations. Lipschitz conditions are connected with "contrastive mappings", which have important applications to the existence, uniqueness and approximation of solutions to equations - including ordinary differential equations.

## Introduction

General first order initial value problem

{{$
	x' = f(t,x),\; x(\tau) = A
}}$

where $x' = \frac{dx}{dt}$

Much of the theory for IVP, its variation involves a so-called Lipschitz condition. This condition is the cornerstone for gaining information about solutions to the IVP, such as existence, uniqueness and approximation.

    We say $f$ satisfies a Lipschitz condition on a set $D$ if there is a constant $L \geq 0$ such that

{{$
	|f(t,u) - f(t,v)| \leq L |u-v|,\; \text{for all } (t,v),(t,v)\in D
}}$

## When does a Lipschitz condition hold?
Given some $f$ and $D$, when does the Lipschitz Condition hold?

**Example** Let $D = \mathbb{R}^2$ and lat $f(t,u) := t^2 + 2u$. For each $(t,u), (t,v) \in D$ consider

{{$
\begin{array}{ll}
	| f(t,u) - f(t,v) | & = | (t^2 + 2u) - (t^2 - 2v) | \\
                            & = 2|u-v|
\end{array}
}}$

    *Lemma*: Let $D$ be a rectangle

{{$
	R:= \{(t,p) : t \in ![pic](a,b), |p-A| \leq B\}
}}$

    or the infinite strip

{{$
	S:= \{(t,p) : t \in ![pic](a,b), |p-A| \leq \infty \}
}}$

    If $f : D \rightarrow \mathbb{R}$ and $\frac{\partial f}{\partial y}$ exists, is continuous and there is some constant $K \geq 0$ such that

{{$
	\left| \frac{\partial f}{\partial y}(t,y) \right| \leq K,\; \text{for all } (t,y) \in D
}}$

    then the Lipschitz Condition holds with $L=K$

## Local Lipshitz
    *Theorem*: Let $f:R\rightarrow \mathbb{R}$ be continuous and let $(\tau A) \in R$. If there is a constant $L \geq 0$ satisfying

{{$
	|f(t,u) - f(t,v)| \leq L |u-v|,\; \text{for all } (t,v),(t,v)\in R
	
}}$

    then the IVP has a unique solution $x=x(t)$ on some interval containing $\tau$.

    *Corollary*: Let $f:R\rightarrow \mathbb{R}$ be continuous and let $\frac{\partial f}{\partial y}$ exists and is continuous on $R$ and there is dome constant $K \geq 0$ such that

{{$
	\left| \frac{\partial f}{\partial y}(t,y) \right| \leq K,\; \text{for all } (t,y) \in D
}}$

    then the IVP has a unique solution $x=x(t)$ on some interval containing $\tau$.

# References
* [|YouTube Video](https://www.youtube.com/watch?v=Cnc83B3C2pY.md)
