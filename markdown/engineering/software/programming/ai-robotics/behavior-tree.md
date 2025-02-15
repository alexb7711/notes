# What Are Behavior Trees?

A Behavior Tree (BT) is a way to structure the switching between different tasks.

## A Short History and Motivation of BTs

A good quote to describe the difference between BTs and Finite State Machines:

> BTs provide an alternative view of Finite State Machines (FSMs) that support design of modular systems.

An other good quote about BT utility

> The main advantage is that individual behaviors can easily be reused in the context of another high-level behavior, without needing to specify how they relate to subsequent behaviors.

## What Is Wrong With FSMs? The Need For Reactiveness And Modularity

FSMs fundamentally require one-way control transfers. Think of a `goto` statement in code. The code jumps to another part of the execution, and continues from there. Modern development utilizes two-way control transfers, such as functions, where the execution jumps to the method, executes the routine, and returns to the where the execution was called. BTs in this regard utilize two-way control transfers.

## Classical Formulation of BTs

A BT is a directed rooted tree where the internal nodes are called control flow nodes and leaf nodes are called execution nodes. Note that control flow nodes can never return the status of `Running`.

A BT starts its execution from the root node that generates signals that allow the execution of a node called ticks with a given frequency, which are sent to its children. A node is executed if and only if it receives ticks. The child immediately returns `Running` to the parent, if its execution is underway, `Success` if it has achieved its goal, or `Failure` otherwise.

In classical formulation there are four types of control nodes:

- Sequence: Execute child nodes from left to right until `Failure` or `Running` is returned, `Success` is returned only if all the child nodes return `Success`.
- Fallback: Execute child nodes from left to right until `Success` or `Running` is returned from a child node. It returns `Failure` only if all the child nodes return `Failure`.
- Parallel: Execute each child node from left to right such that they begin executing simultaneously. Return `Success` if $M$ children return `Success`, return `Failure` otherwise.
- Decorator: This node can only ever have one childe node. The decorator specifically manipulates the return state of the child node according to a user-defined rule and also selectively ticks the child according to some predefined rule. Some examples of decorators are:
  - invert: Return opposite of `Success`/  `Failure`
  - max-N-tries: Retry the node `N` times before returning `Failure`
  - max-T-sec: Allow the child to run for `T` seconds before returning `Failure`

### Control Flow With Memory

Control flow nodes with memory always remember whether a child has returned `Success` or `Failure` to avoid re-execution of the node. The memory is cleared when the parent node returns `Success` or `Failure`.

BTs are non-reactive since they do not allow actions other than the currently active one to react to changes. BTs with only memory nodes are denoted as non-reactive since the original return state is maintained until the behavior is complete. Because reactivity is one of the key strengths of BTs, the non-reactive ones are of limited use.

# How Behavior Trees Generalize And Relate To Earlier Ideas

## Finite State Machines

FSMs consists of a set of states, transitions, and events.

### Advantages And Disadvantages

Advantages:

- Very common structure
- Intuitive and easy to understand
- Easy to implement

Disadvantages

- Reactivity/Modularity. Since every transition is a `goto` which introduces
  - Maintainability issues in adding or removing states. This could introduce issues in a state not having a `goto` for example.
  - Scalability. The more states, the more transitions, the more difficult the system becomes to understand and modify
  - Reusability. The transition between states may depend on internal variables, making it unpractical reuse the same sub-FSM in multiple projects.

## Heirachical Finite State Machines

In a HFSM, a superstate can contain one or more substates. A generalized transition in HFSM is a transition between superstates. Each superstate has one substate identified as the starting state.

### Advantages And Disadvantages

Advantages:

- Increased modularity. It is possible to separate tasks into subtasks
- Behavior inheritance: These superstates can be nested in other superstates

Disadvantages

- Maintainability: Adding or removing states is still hard.
- Manually created hierarchy. 

## Subsumption Architecture

Several controllers are ran in parallel. Each one is allowed to output both its actuation command and a binary value that signifies if it wants to control the robot or not. The highest priority controller that wants to control the robot subsumes the other controllers and take it action.

### Advantages And Disadvantages

Advantages

- Easy to implement
- Modular
- Hierarchy 

Disadvantages

- Scalability: complex actions through a distributed system of inhibition and suppression can be hard
- Maintainability. Due to the lack of structure, the consequences of adding or removing controllers can be hard to estimate.

### How BTs Generalize The Subsumption Architecture

This boils down to a sequence of behaviors under a `Fallback` composition with the highest priority behavior on the left and the least on the right.

## Teleo-Reactive Programs

In its simplest form, a TR program is described by a list of condition-action rules.

$$$

\\begin{align\*}

c_1 \\rightarrow a_1 \\\\

c_2 \\rightarrow a_3 \\\\

\\vdot \\\\

c_3 \\rightarrow a_3 \\\\

\\end{align\*}

The condition-action rule list is scanned from the top until it finds a condition that holds. This action will continue to be performed as long as it is the highest priority condition that is being met.

### Advantages And Disadvantages

Advantages

- Reactive execution. By nature, this method is reactive because of the continuous monitoring of the conditions
- Intuitive structure, especially for small problems

Disadvantages

- Maintainability. Adding or removing items is prone to cause errors (??)
- Failure Handling. a TR program needs to have a condition that checks if an action fails

## Decision Trees

Decision trees are a directed graph that represents a list of nested if-then clauses which is used to derive decisions. Leaf nodes describe decisions, conclusions, or actions. The non-leaf nodes describe predicates to be evaluated.

### Advantages And Disadvantages

Advantages

- Modular
- Hierarchy
- Intuitive Structure

Disadvantages

- No information flow out from the nodes, making failure handling very difficult

## Advantages And Disadvantages Of Behavior Trees

### Advantages

- Modular. It is simple to separate and recombine conditions/actions.
- Hierarchical organization
- Reusable code
- Reactivity
- Human readable
- Expressive (can encode a wide variety of behaviors)
- Suitable for analysis: Safety critical robots often require an analysis of the qualitative and quantitative system properties
- Suitable for automatic synthesis: Action ordering of a task or policy can be automatically synthesized 

### Disadvantages

- The BT engine can be complex to implement
- Checking all the conditions can be expensive
- Sometimes a simpler architecture is sufficient
- BTs require a different mindset wend designing
- BT tools are less mature

# Design Principles

## Improving Readability Using Explicit Success Conditions

One thing that is not shown with BTs is the details regarding when the individual actions returns `Success` and `Failure`. To remove the ambiguity of the return conditions, explicit `Success` conditions can be included in the BT.

## Improving Reactivity Using Implicit Sequences

By reversing the order and specifying preconditions one can improve the reactivity and reduce processing. For example, if we wanted a robot to go through the door, the first pre-condition is to check if the robot has passed. If it didn't, then we can check if the door is already open, if it is not, then we can check if the door is unlocked, etc.

## Handling Different Cases Using A Decision Tree Structure

BTs can behave like Decision Trees. By this it is meant that depending on the current state that is being observed, different BTs can be executed. An example of this is PacMan either being chased or chasing the ghosts.

## Improving Safety Using Sequences

A Sequence node can be used to guarantee unwanted scenarios and unsafe conditions.

## Creating Deliberative BTs Using Backchaining

This is meant to say that BTs can be structured in away that allows the agent to behave in a predictable way to achieve a specified goal.

## Creating Un-Reactive BTs Using Memory Nodes

Nodes with memory can be used to avoid unwanted re-execution of some nodes. As discussed before, this can cause the BT to become less reactive. For this reason, it is advised to use memory nodes exclusively for cases where there is no unexpected event that will undo the execution of the subtree in a composition with memory.

## Choosing The Proper Granularity Of A BT

As common sense would dictate, here are some good rules of thumb:

- It makes sense to encode the behavior in a single leaf when the potential subparts of the behavior are always used and executed in this particular combination. 
- It makes sense to encode a behavior as a sub-BT, braking it up into conditions, actions and flow control nodes, when the subparts are likely to be usable in other combinations in other parts of the BT, and when the reactivity of BTs can be used to re-execute parts of the behavior when needed.

## References

\- \[Introduction To Behavior Trees\](<https://roboticseabass.com/2021/05/08/introduction-to-behavior-trees/>)

\- Behavior Trees in Robotics and AI: An Introduction by Michele Colledanchise and Petter Ogren