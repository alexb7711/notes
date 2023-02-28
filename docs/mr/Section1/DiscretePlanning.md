# Discrete Planning
Discrete Planning: Section up the world, make a graph, and search for path to the goal.

How should the world be divided? An idea is to **create a graph**.

# Requirement for search algorithm
* Any search algorithm should be *systematic*
	* If the graph is finite, this means that the algorithm will visit every reachable state, which enables it to correctly declare in finite time whether or not a solution exists. To be systematic, the algorithm should keep track of states already visited; otherwise, the search may run forever by cycling through the same states. Ensuring that no redundant exploration occurs is sufficient to make the search systematic.
	* If the graph is infinite, we are willing to tolerate a weaker definition for being systematic. If a solution exists, then the search algorithm still must report in finite time; however, if a solution does not exist, it is acceptable for the algorithm to search forever. 

# Visibility
* Edges joining all pairs of vertices that can see each other
* Adjoin beginning and ending robot locations

## Characteristics
* Optimal path lengths
	* Solution takes robot as close to obstacles as possible
	* Tradeoff - optimality vs safety
		* Can inflate obstacles for additional safety
* Relatively simple if objects are described as polygons
* Size of representation and number of edges and nodes increase with number of polygons
	* Fast and efficient in sparse environments
	* Slow and inefficient in densely populated environments
* Path in graph corresponds to path in free space

# Voroni Diagram
* Find points which are equidistant from two or more obstacles - these points will form edges
* Vertices can be defined by maximize length along Voroni edges, intersections, and start and & points

## Characteristics
* Edges are executable - can use simple control laws to follow
* Usually far from optimal in terms of total path length
* Limited range sensors - can be difficult to localize
* Can be difficult to compute, but a very established method in computer vision
	* OpenCV has simple function calls
	* Can be used with grid maps of obstacles

# Exact Cell Decomposition
* Designed based on vertices of polygon
* Cells are either completely occupied or completely free

## Characteristics
* Basic abstraction
	* Particular position of robot does not matter
	* What is important is the ability to move between cells
	* No direct relationship between graph path and world path
* Number of cells depends on density of obstacles
	* Sparse environments have small number of cells	
