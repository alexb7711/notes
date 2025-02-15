# Abstract Base Class (ABC)

As the name implies, this module provides the infrastructure for defining abstract base classes. 

## class `abc.ABC`

The ABC class is a helper class that creates an abstract base class by simply deriving from it. The `ABC` class is derived from the `ABCMeta` class. Every abstract base class must be derived from an `ABCMeta` class.

```python
from abc import ABC

class MyABC(ABC):
    pass
```

## class `abc.ABCMeta`

To make things confusing, there is the `ABCMeta` class. This class exists to be able to create custom abstract base classes (rather than the generic `ABC` class that is provided). The `ABCMeta` class provides a `register` function that allows any abstract base class to become an ancestor of any arbitrary concrete class.

As a simple example, we can create an abstract class that defines an abstract function, but is a subclass of a dictionary:

```python
import abc 
  
class AbstractClass(metaclass=abc.ABCMeta): 
    def abstractfunc(self): 
        return None
  
print(AbstractClass.register(dict)) 
```

So when you invoke `print(issubclass(dict, AbstractClass)` the result is `True`. Using the `@abc.abstractmethod` decorator, you can enforce virtual functions that must be implemented in the derived classes:

```python
import abc 
  
class AbstractClass(metaclass=abc.ABCMeta): 
    @abc.abstractmethod 
    def abstractName(self): 
        pass
  
class ValidSubClass(AbstractClass): 
    def abstractName(self): 
        return 'Abstract 1'
  
vc = ValidSubClass() 
print(vc.abstractName()) 
```