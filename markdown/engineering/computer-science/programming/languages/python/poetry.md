# Introduction
Poetry is a tool for dependency management and packaging in Python. It allows you to declare dependencies for your project as well as manage/update them for you (think `Cargo.toml` for Rust). Poetry offers a lockfile to ensure repeatable installs, and can build your project for distribution.

NOTE: You can set up tab-completion for poetry commands for ZSH.

# Basic Usage
To create a new project using poetry, simply type `poetry new [project name]`. From there, it will create skeleton project structure. The heart of configuring poetry is in the `pyproject.toml` file. It orchestrates the project dependencies.

On the other hand, if you have a pre-existing project that you want to turn into a poetry project, simply type `poetry init`.

## Specifying Dependencies

In the `project.toml` file, one can specific the dependencies via the following syntax

```toml
[project]
#...
dependecies = [
    "pendulum (>=2.1,<3.0)"
]
```

If you want to add a new dependency, one can either modify the file directory or type `poetry add [dependecy]`.

## Using The Virtual Environment
By default, poetry creates virtual environments in `[cache-dir]/virtualenvs`. There are multiple ways to execute the virtual environment.

### Activating the Virtual Environment
The `poetry env activate` commands prints the activate command of the virtual environment to the console. To actually run it, you can do something like `eval $(poetry env activate)`

# The `pyproject.toml` file

## Dependencies and Dependency Groups
Dependencies can be organized by groups to have more granular control over what is installed. For example, if you have dependencies only for testing:

```toml
[tool.poetry.group.test.dependecies]
pytest = "*"
```

Groups can be made optional via

```toml
[tool.poetry.groups.docs]
optional = true
```

To install the optional dependencies one can use `poetry install --with docs` to install the `docs` optional dependencies. If its easier, you can do the reverse and exclude groups via `poetry install --witout test,docs`. In the case you only want to install a single dependency type, you can use the `--only` flag.

## plugins
