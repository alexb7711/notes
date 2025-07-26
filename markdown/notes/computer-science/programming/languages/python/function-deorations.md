# Classmethod

the `@classmethod` decorator is used to declare a method in the class as a class method that can be called using `ClassName.MethodName()`.

```python
class MyClass:
    @classmethod
    def class_method(cls, arg1, arg2):
        # cls refers to the class itself
        print("Class method called with:", cls, arg1, arg2)

# Calling the class method
MyClass.class_method("hello", "world")
```