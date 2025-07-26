# Namespaces

This file contains information about namespaces in C++.

## Nested Namespaces

A nested namespace is a nested scope - its scope is nested within the namespace that contains it.

```c++
namespace cpp_primer {
	namespace QueryLib {
		// Code fore Query Library
	}
}
```

Nested namespaces follow the same rules. For example, if the `QueryLib` had a class called `Query`, we could instaciate the class with the following snippet:

```c++
cpp_primer::QueryLib::Query q = cpp_primer::QueryLib::Query(...)
```