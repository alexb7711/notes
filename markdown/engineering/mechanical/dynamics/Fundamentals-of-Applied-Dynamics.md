# 5: Variational Formulation For Systems of Particles
## 5-4: Generalized Variables And Variational Concepts
### Generalized Coordinates

In the definition of degrees of freedom below, it uses the concept of "admissible variations". These admissible
variations describe the set independent variables that are allowed to vary. In other words, when looking at the
differential equation that describes the way a system evolves over time, the set of independent variables is the degree
of freedom.

> The number of independent admissible variations in a complete set of admissible variations is the number of degrees of
> freedom.

When we have fully defined the DOF of a system, we may have (or may further apply) constraints on the system to lower
the DOF of the system. These constraints are geometric constrains.

> A geometric constraint is any requirement that reduces the number of degrees of freedom.

These constraints that we apply may be holonomic or nonholonomic. When a constraint is holonomic, that means the set of
generalized coordinates (the set of variables that describes the system) is the same set as the admissible variations.
For example, assuming a bead can only slide along a plane constrains it to a 2 DOF set $x, y$, and the set of allowed
variations are $\delta x, \delta y$. On the other hand, assuming we have a non-slipping disk on a 2D plane, the
"generalized coordinates" are $x, y, \phi, \theta$ where $\phi$ and $\theta$ are the orientation of the wheel and the
amount it has rotated, respectively. However, the set of allowed variation is $\delta \phi, \delta \theta$ since we are
now allowing slipping. That means you can't just "push" the wheel without rotating or turning it. This geometric
constraint is thus nonholonomic.

> If the number of generalized coordinates in a complete and independent set is equal to the number of degrees of
> freedom, the system is said to be holonomic.

On the other hand,

> If the number of generalized coordinates in a complete and independent set is not equal to the number of degrees of
> freedom, the system is said to be holonomic.

Note that in nonholonomic systems, the DOF will always be less than the number of generalized coordinates in a complete
and independent set.

A system can be holonomic over a certain range, such as a bead on a rod constrained by a wall on one side. In this case,
the bead's position is holonomic over the range $0 < x < l$ where $l$ is the length of the rod. When this is the case,
the system is said to be piecewise holonomic.

## 5-5: Equations Of Motion For Holonomic Mechanical Systems Via Variational Principles

Hamilton's principle for a $n$ DOF holonomic system can be stated as follows:

> An admissible motion of the system between specified configurations at $t_1$ and $t_2$ is a natural motion if, and
> only if, the variatinoal indicator vanishes for arbitrary admissible variations.

That is, if the geometric motions (called "admissible motions") are satisfied, and the constitutive requirements (i.e.
the intertial terms, conservative forces, and nonconservative forces fully define the mechanical system), then the
force-dynamic requirements will be satisfied (i.e. the system is fully defined).

# Vibration Of Linear Lumped-Parameter Systems
