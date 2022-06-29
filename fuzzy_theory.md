# Contents
        - [|Fuzzy Theory](#Fuzzy Theory.md)
        - [|Introduction](#Introduction.md)
                - [|Fuzzy Set](#Introduction#Fuzzy Set.md)
                        - [|Operations of Fuzzy Sets](#Introduction#Fuzzy Set#Operations of Fuzzy Sets.md)
                        - [|Fuzzy Set Properties](#Introduction#Fuzzy Set#Fuzzy Set Properties.md)
                - [|Triangular Fuzzy Number](#Introduction#Triangular Fuzzy Number.md)
                - [|Membership Functions](#Introduction#Membership Functions.md)
                        - [|Membership Function Properties](#Introduction#Membership Functions#Membership Function Properties.md)
                        - [|Fuzzification](#Introduction#Membership Functions#Fuzzification.md)
                                - [|Support Fuzzification (s-fuzzification) Method](#Introduction#Membership Functions#Fuzzification#Support Fuzzification (s-fuzzification) Method.md)
                                - [|Grade Fuzzification (g-fuzzification) Method](#Introduction#Membership Functions#Fuzzification#Grade Fuzzification (g-fuzzification) Method.md)
                        - [|Defuzzification](#Introduction#Membership Functions#Defuzzification.md)
                                - [|Max-Membership Method](#Introduction#Membership Functions#Defuzzification#Max-Membership Method.md)
                                - [|Centroid Method](#Introduction#Membership Functions#Defuzzification#Centroid Method.md)
                                - [|Weighted Average Method](#Introduction#Membership Functions#Defuzzification#Weighted Average Method.md)
                                - [|Mean-Max Membership](#Introduction#Membership Functions#Defuzzification#Mean-Max Membership.md)
                        - [|Fuzzy Arithmetic](#Introduction#Membership Functions#Fuzzy Arithmetic.md)
                - [|Comparing Fuzzy Numbers](#Introduction#Comparing Fuzzy Numbers.md)
        - [|Footnotes](#Footnotes.md)

# Fuzzy Theory

# Introduction
Fuzzy logic is a form of artificial intelligence that resembles the human decision-making methodology where we allow vague and imprecise information. In other words, it allows for imprecise (non-binary) decision to be modeled [|#3](#Footnotes#2.md). Contradictory to one's idea of fuzzy logic, fuzzy logic is not logic that is fuzzy, but logic that is is used to describe fuzziness [|#1](#Footnotes#1.md).

{{https://www.tutorialspoint.com/fuzzy_logic/images/fuzzy_logic_introduction.jpg|Example of fuzzy logic}}

An important fact about fuzzy logic is that _it does not require a model_. It works well with complex system where the mechanism are not fully known. As long as you have some intuition about the system, then the rules can be developed in implemented [|#3](#Footnotes#2.md).

The applied rules are the encoding of knowledge. For example, assume a banker wants to figure out the risk of giving a person a loan. We can say

* Good credit $\rightarrow$ low risk
* Neutral credit $\rightarrow$ medium risk
* Bad credit $\rightarrow$ high risk

The set of rules above are the _encoding of knowledge_ that can be used for predictions [|#3](#Footnotes#2.md).

## Fuzzy Set
Fuzzy [|sets](set_theory.md) allows elements to have varying degrees of memberships in sets. For example consider the image below 

{{https://www.tutorialspoint.com/fuzzy_logic/images/fuzzy_classical_set.jpg}}

The membership function of classical sets $A$ is binary in the sense that the element $a_i$ is either in the set or not. On the other hand, the membership function of fuzzy set $\tilde{A}$ has elements $\tilde{a}_i$ that have _varying degrees of membership in the set_. In other words, the membership functions describe the degree of truth in fuzzy logic.

### Operations of Fuzzy Sets
* Union/Fuzzy 'OR'
	* $\mu _{{\widetilde{A}\cup \widetilde{B} }}\left ( y \right ) = \mu _{\widetilde{A}}\vee \mu _\widetilde{B} \quad \forall y \in U$ where $\vee$ is the $max$ operation.
	* {{https://www.tutorialspoint.com/fuzzy_logic/images/union.jpg}}
* Intersection/Fuzzy 'AND'
	* $\mu _{{\widetilde{A}\cap  \widetilde{B} }}\left ( y \right ) = \mu _{\widetilde{A}}\wedge  \mu _\widetilde{B} \quad \forall y \in U$ where $\wedge$ represents the $min$ oepration
	* {{https://www.tutorialspoint.com/fuzzy_logic/images/intersection.jpg}}
* Complement/Fuzzy 'NOT"
	* $\mu _{\widetilde{A}} = 1-\mu _{\widetilde{A}}\left ( y \right )\quad y \in U$
	* {{https://www.tutorialspoint.com/fuzzy_logic/images/complement.jpg}}
	
### Operations of Trapozoidal/Triangular Fuzzy Sets
{{$
\begin{array}{l}
	\text{let } \tilde{A}_1 = (a_1, b_1, c_1, d_1) \\
	\text{let } \tilde{A}_2 = (a_2, b_2, c_2, d_2) \\
	\tilde{A}_1+\tilde{A}_2 = (a_1+a_2, b_1+b_2, c_1+c_2, d_1+d_2) \\
	\tilde{A}_1-\tilde{A}_2 = (a_1-d_2, b_1-c_2, c_1-b_2, d_1-a_2) \\
	\tilde{A}_1*\tilde{A}_2 = (a_1 a_2, b_1 b_2, c_1 c_2, d_1 d_2) \\
\end{array}
}}$

### Fuzzy Set Properties
Fuzzy sets have the same properties as [|classical sets](set_theory.wiki.md)

## Triangular Fuzzy Number
A triangular fuzzy number is represented by $\tilde{a} = (a, m, b)$.

{{https://imgr.search.brave.com/WDFxUWmyPZJZq9QI4nZoG6XwO4WAoQ9cDE6RxCIbB3o/fit/650/290/ce/1/aHR0cHM6Ly93d3cu/cmVzZWFyY2hnYXRl/Lm5ldC9wdWJsaWNh/dGlvbi8yNzEyOTM0/NjMvZmlndXJlL2Zp/ZzEvQVM6NjE1MDY1/NzI0MTQxNTY5QDE1/MjM2NTQ1MDQxNzMv/VHJpYW5ndWxhci1m/dXp6eS1udW1iZXIt/ZGlhZ3JhbS5wbmc|Triangular Fuzzy Number}}

## Membership Functions
Mathematically, membership functions are denoted as [|#1](#Footnotes#1.md)

{{$
\widetilde{A} = \left \{ \left ( y,\mu _{\widetilde{A}} \left ( y \right ) \right ) | y\in U\right \}
}}$

### Membership Function Properties
* Core: The set of values $y$ such that $\mu_{\tilde{A}}(y) = 1$
* Support: The set of values $y$ such that $\mu_{\tilde{A}}(y) > 0$
* Boundary: $1 > \mu_{\tilde{A}}(y) > 0$

{{https://www.tutorialspoint.com/fuzzy_logic/images/membership_functions_features.jpg}}

### Fuzzification
This is the process of transforming crisp sets into fuzzy sets. This process is used to determine how much the crisp number lies in each given region. In the example of determining risk for giving a loan in [|#2](#Footnotes#2.md), the example of a crisp value being fuzzified was $660 = ![pic](0,0.9,0.1)$ where the fuzzy value is bad, neutral, and good credit, respectively. There are multiple methods of doing this, two of methods are shown below [|#1](#Footnotes#1.md)

{{https://www.researchgate.net/profile/Abderrahim_Bennassar/publication/286013789/figure/fig2/AS:307781908353025@1450392333054/Block-diagram-of-a-fuzzy-logic-controller.png|Fuzzy logic block diagram}}

#### Support Fuzzification (s-fuzzification) Method

{{$
\widetilde{A} = \mu _1Q\left ( x_1 \right )+\mu _2Q\left ( x_2 \right )+...+\mu _nQ\left ( x_n \right )
}}$

where $Q(x_i)$ is called the _kernel of fuzzification_. This method is implemented by keeping $\mu_i$ constant and $x_i$ is transformed into a fuzzy set $Q(x_i)$.

#### Grade Fuzzification (g-fuzzification) Method
This is very similar to the s-fuzzification, but $x_i$ is held constant and $\mu_i$ is expressed as a fuzzy set. 

### Defuzzification
This is the process of transforming fuzzy sets into crisp sets [|#1](#Footnotes#1.md). This process happens after inferences have been made on the fuzzy numbers. This usually implies another set of fuzzy rules that determines the ranges of memberships [|#2](#Footnotes#2.md). Similar to the fuzzification process, there are multiple ways to defuzzify values [|#1](#Footnotes#1.md):

{{https://www.researchgate.net/profile/Abderrahim_Bennassar/publication/286013789/figure/fig2/AS:307781908353025@1450392333054/Block-diagram-of-a-fuzzy-logic-controller.png|Fuzzy logic block diagram}}

#### Max-Membership Method
This method is limited to peak output functions. Mathematically it is represented as

{{$
\mu _{\widetilde{A}}\left ( x^* \right )>\mu _{\widetilde{A}}\left ( x \right ) \: for \:all\:x \in X
}}$

where $x^*$ is the defuzzified output.

#### Centroid Method
Also known as the center of area or the center of gravity method:

{{$
x^* = \frac{\int \mu _{\widetilde{A}}\left ( x \right ).xdx}{\int \mu _{\widetilde{A}}\left ( x \right ).dx}
}}$

What this means is that given the fuzzy value to be defizzified, draw a horizontal line at the percentage of the membership as indicated by the fuzzy value, merge the areas together, and find the centroid of the geometric shape that was generated [|#2](#Footnotes#2.md).

#### Weighted Average Method
Each membership function is weighted by its maximum membership value:

{{$
x^* = \frac{\sum \mu _{\widetilde{A}}\left ( \overline{x_i} \right ).\overline{x_i}}{\sum \mu _{\widetilde{A}}\left ( \overline{x_i} \right )}
}}$

#### Mean-Max Membership
Also known as the middle of the maxima

{{$
x^* = \frac{\displaystyle \sum_{i=1}^{n}\overline{x_i}}{n}
}}$

### Fuzzy Arithmetic
If we have a nonnegative, triangular fuzzy number $\tilde{a} = (a_1, a_2, a_3)$ and $\tilde{b} = (b_1, b_2, b_3)$, then the sum is defined as

{{$
\tilde{a}+\tilde{b} = (a_1 + b_1, a_2 + b_2, a_3 + b_3)
}}$

and the difference is

{{$
\tilde{a}+\tilde{b} = (a_1 - b_3, a_2 - b_2, a_3 - b_1)
}}$

## Comparing Fuzzy Numbers
This is the same concept as [|defuzzification](#Defuzzification.md), but now we will put in context of its use. It is important to be able to compare fuzzy numbers, especially for [|Fuzzy Linear Programming](fuzzy_lin_prog.md) so one is able to state whether $\tilde{a} < \tilde{b}$ or $\tilde{a} > \tilde{b}$ when defining constraints. These methods are known as _ordering function. A common ordering function is simply taking the average of the fuzzy number [|#1](#Footnotes#1.md), [|#3](#Footnotes#3.md):

{{$
R(\tilde{a}) = \frac{a + m + b}{3}
}}$

# Footnotes
* *1* @tutorials_fuzzy    | Fuzzy logic, 2021. [Online; accessed 21-October-2021].
* *2* @matlab_fuzzy_logic | MATLAB. What is fuzzy logic, Aug 2021.
* *3* @kaur_2016          | Jagdeep Kaur and Amit Kumar (2016). An Introduction to Fuzzy Linear Programming Problems
