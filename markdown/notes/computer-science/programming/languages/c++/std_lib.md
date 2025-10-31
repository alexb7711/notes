# Standard Library

# `std::optional`
The class template std::optional manages an optional contained value, i.e. a value that may or may not be present. A common use case for optional is the return value of a function that may fail. A good example of this is when extracting data from a `toml::table` in the `toml++` library.

```c++
#include <iostream>
#include <toml++/toml.hpp>
using namespace std::string_view_literals;

int main()
{
    static constexpr auto source = R"(
        str = "hello world"

        numbers = [ 1, 2, 3, "four", 5.0 ]
        vegetables = [ "tomato", "onion", "mushroom", "lettuce" ]
        minerals = [ "quartz", "iron", "copper", "diamond" ]

        [animals]
        cats = [ "tiger", "lion", "puma" ]
        birds = [ "macaw", "pigeon", "canary" ]
        fish = [ "salmon", "trout", "carp" ]
    )"sv;
    toml::table tbl = toml::parse(source);

    // different ways of directly querying data
    std::optional<std::string_view> str1 = tbl["str"].value<std::string_view>();
    std::optional<std::string>      str2 = tbl["str"].value<std::string>();
    std::string_view                str3 = tbl["str"].value_or(""sv);
    std::string&                    str4 = tbl["str"].ref<std::string>(); // ~~dangerous~~

    // .....

    return 0;
}
```

# `std::string_view`
`std::string_view` is a C++ feature introduced in C++17 that provides a non-owning, lightweight view into an existing sequence of characters. It is designed to offer efficient handling of string-like data without incurring the overhead of memory allocation or copying that std::string can involve.
