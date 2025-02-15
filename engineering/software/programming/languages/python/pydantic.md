Pydantic is a data validation library for Python. The question is, what is data validation?

Basically, Pydantic allows you to create a basic data class that is derived from a Pydantic class. The parent class has
functionality that allows your new data class to automatically import a set of structured data (it seems like its main
target is JSON, but I'm assuming YAML is also accepted).

It basically abstracts a lot of the checks required when inputting data. It also does a lot of the type checking and
error handling for you.

# Examples
```python
from datetime import datetime
from pydantic mport BaseModel, PositiveInt

class User(BaseModel):
    id: int
    name: str = "John Doe"
    signup_ts: datetime | None
    tastes: dict[str, PositiveInt]

external_data = {
    'id': 123,
        'signup_ts': '2019-06-01 12:22',
        'tastes': {
            'wine': 9,
            b'cheese': 7,
            'cabbage': '1',
        },
}

try:
    user = User(**external_data)
    print(user.id)
    print(user.model_dump())
except ValidationError as e:
    print(e.errors())
```
