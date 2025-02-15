# Functions

This file contains information about function (or method) calls in C++.

## Read Only Functions

In C++, placing the `const` keyword after a member function declaration indicates that the function is a "read-only" function that does not modify the object on which it is called. 

Here's how it works:

```c++
class MyClass {
private:    
	int data;
public:
    int getData() const { // const member function        
		return data;    
	}    
	void setData(int value) { // non-const member function        
		data = value;    
	}
};
```

**Explanation:**

- **Const Member Functions:**

  The `getData()` function is declared as `const`. This means it guarantees that it will not modify any non-static data members of the object. If you try to modify `data` inside `getData()`, you'll get a compiler error.
- **Non-Const Member Functions:**

  The `setData()` function is not declared as `const`, so it is allowed to modify the object's data members.

**Benefits:**

- **Improved Code Safety:**

  `const` correctness helps you prevent accidental modifications to objects, making your code more robust.
- **Clearer Interfaces:**

  The `const` keyword signals to users of your class that a function is safe to call on constant objects.
- **Flexibility:**

  Const member functions can be called on both const and non-const objects, while non-const member functions can only be called on non-const objects.