# Contents
        - [|Backstepping](#Backstepping.md)
        - [|Lyapunov Redesign](#Lyapunov Redesign.md)
                - [|Online Lectures](#Lyapunov Redesign#Online Lectures.md)

# Backstepping
Consider the system

{{$
\begin{array}{l}
  \dot{\eta} = f_a(\eta) + g_a(\eta) \zeta \\
  \dot{\zeta} = f_b(\eta,\zeta) + g_b(\eta,\zeta)u
\end{array}
}}$

where the state is $x=\begin{bmatrix} \eta & \zeta \end{bmatrix}^T$. The objective is to find a $u$ such that $x=0$.

We begin by noting that the output of the second equation is the input of the first (i.e. the system cascades). When this is the case, backstepping works. Lets work with one equation at a time (since we will back one equation into the next due the cascading nature of the system). Therefore we will assume that the "input" term from the second system ($\zeta$) is the "control" of the first system. We want to choose the form of $\zeta$ such that $\dot{\eta} \rightarrow 0$. Let

{{$
\begin{array}{l}
  \zeta = \phi(\eta) \\
  \phi(0) = 0
\end{array}
}}$

such that $\eta \rightarrow 0$.

Suppose the Lyapunov function $V_1 = 1/2 \eta^2 \implies \dot{V}_1 = \dot{\eta}\eta$. We are now left to choose a $\phi(\eta)$ that will make $\eta \rightarrow 0$

{{$
\dot{V}_1 = \eta^T(f(\eta) + g(\eta)\phi(\eta)] \leq w(\eta)
}}$

Going back to the $\dot{\eta}$ equation, add and subtract $g(\eta)\phi(\eta)$ to it such that you are left with:

{{$
  \dot{\eta} = \eta(f(\eta) + g(\eta)(\zeta - \phi(\eta)) + g(\eta)\phi(\eta))
}}$

and let $z = \zeta - \phi(\eta)$. This change of variable is done because (up to this point) we have shown that the $\dot{\eta}$ is stable as long as $\zeta$ behaves a certain way. Now, the goal is to define a $u$ such that $\zeta$ behaves in the way that we want. That we have chosen a controller that stabilizes the system.

Begin by defining our original system with our new $z$ term

{{$
\begin{array}{l}
\dot{\eta} = f(\eta) + g(\eta)\phi(\eta) + g(\eta)z \\
\dot{z} = u - \dot{\phi}
\end{array}
}}$

Now that we have our new system defined our new system, we want to prove that the original system added on to the new system is still stable

{{$
\begin{array}{l}
V = V1 + V2 \
V = V1 + 1/2z^2
\dot{V} = \eta f(\eta) + \eat g(\eta)z + \eta g(\eta)\phi(\eta) + z\dot{z} \\
\dot{V} = f(\eta) + g(\eta)z + g(\eta)\phi(\eta) + z(u - \dot{\phi}) \\
\dot{V} = f(\eta) + g(\eta)\phi(\eta) + z(\eta g(\eta) + u - \dot{\phi})
\end{array}
}}$

We want to cancel out all the terms in the parenthesis with $u$ as well as create the controller that will stabilize the system. Choose

{{$
u = \dot{\phi}(\eta) - \eta g(\eta) - kz
}}$

where $k > 0$. This leaves $V = f(\eta) + g(\eta)\phi(\eta) + z(\eta g(\eta) + u - \dot{\phi}) < 0$

# Lyapunov Redesign

## Online Lectures
* [|Nonlinear 2020 Backstepping](https://www.youtube.com/watch?v=RzNmxUsMS2I.md)
