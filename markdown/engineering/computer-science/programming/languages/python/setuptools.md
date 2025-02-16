# Package Discovery and Namespace Packages

In a typical `project.toml` file one would manualy specxfy the packages to be included:

```toml
# ...
[tool.setuptools]
packages = ["mypkg", "mypkg.subpkg1", "mypkg.subpkg2"]
# ...
```

If you have an unconventional package structure, you may also have to configure `package_dir`:

```toml
[tool.setuptools]
# ...
package-dir = {"" = "src"}
    # directory containing all the packages (e.g.  src/mypkg1, src/mypkg2)

# OR

[tool.setuptools.package-dir]
mypkg = "lib"
# mypkg.module corresponds to lib/module.py
"mypkg.subpkg1" = "lib1"
# mypkg.subpkg1.module1 corresponds to lib1/module1.py
"mypkg.subpkg2" = "lib2"
# mypkg.subpkg2.module2 corresponds to lib2/module2.py
# ...
```

## Automatic Discovery

Seutptools considers two popular project layouts (src-layout and flat-layout). Setuptools by default will scan your project and look for these directory layouts and try to guess the values for the `packages` and `py_modules`. Note that automatic discovery will only occur if `packages` and `py_modules` are not provided in the configuration.

### src-layout

The src-layout is useful for automatic discovery since you don't have to worry about other python files or folders in your project root being distributed by mistake.

```
project_root_directory
├── pyproject.toml  # AND/OR setup.cfg, setup.py
├── ...
└── src/
    └── mypkg/
        ├── __init__.py
        ├── ...
        ├── module.py
        ├── subpkg1/
        │   ├── __init__.py
        │   ├── ...
        │   └── module1.py
        └── subpkg2/
            ├── __init__.py
            ├── ...
            └── module2.py
```

### flat-layout

This method is practical for using the REPL, but can be more error prone. To avoid confusion, file and folder names that are used by popular tools (or well-known conventions) are automatically filtered out.

```
project_root_directory
├── pyproject.toml  # AND/OR setup.cfg, setup.py
├── ...
└── mypkg/
    ├── __init__.py
    ├── ...
    ├── module.py
    ├── subpkg1/
    │   ├── __init__.py
    │   ├── ...
    │   └── module1.py
    └── subpkg2/
        ├── __init__.py
        ├── ...
        └── module2.py
```

Default excluded names:

```python
FlatLayoutPackageFinder.DEFAULT_EXCLUDE: ClassVar[tuple[str, ...]] = ('ci', 'ci.*', 'bin', 'bin.*', 'debian', 'debian.*', 'doc', 'doc.*', 'docs', 'docs.*', 'documentation', 'documentation.*', 'manpages', 'manpages.*', 'news', 'news.*', 'newsfragments', 'newsfragments.*', 'changelog', 'changelog.*', 'test', 'test.*', 'tests', 'tests.*', 'unit_test', 'unit_test.*', 'unit_tests', 'unit_tests.*', 'example', 'example.*', 'examples', 'examples.*', 'scripts', 'scripts.*', 'tools', 'tools.*', 'util', 'util.*', 'utils', 'utils.*', 'python', 'python.*', 'build', 'build.*', 'dist', 'dist.*', 'venv', 'venv.*', 'env', 'env.*', 'requirements', 'requirements.*', 'tasks', 'tasks.*', 'fabfile', 'fabfile.*', 'site_scons', 'site_scons.*', 'benchmark', 'benchmark.*', 'benchmarks', 'benchmarks.*', 'exercise', 'exercise.*', 'exercises', 'exercises.*', 'htmlcov', 'htmlcov.*', '[._]*', '[._]*.*')
```

Reserved package names:

```python
FlatLayoutModuleFinder.DEFAULT_EXCLUDE: ClassVar[tuple[str, ...]] = ('setup', 'conftest', 'test', 'tests', 'example', 'examples', 'build', 'toxfile', 'noxfile', 'pavement', 'dodo', 'tasks', 'fabfile', '[Ss][Cc]onstruct', 'conanfile', 'manage', 'benchmark', 'benchmarks', 'exercise', 'exercises', '[._]*')
```

### single-module distribution

There is a unique configuration of the flat-layout called the single-module distribution method. This method is useful when you have a stand alone module that consists of just one file:

```
project_root_directory
├── pyproject.toml  # AND/OR setup.cfg, setup.py
├── ...
└── single_file_lib.py
```

## Custom Discovery

If  automatic the search is not working or you wish to use packages that use reserved names such as `task`, `example`, or `docs`, or you want to exclude nested packages, you can use the following tools for package discovery:

```toml
# ...
[tool.setuptools.packages]
find = {}  # Scanning implicit namespaces is active by default
# OR
find = {namespaces = false}  # Disable implicit namespaces
```

### Finding Simple Packages

Consider the following project tree

```
mypkg
├── pyproject.toml  # AND/OR setup.cfg, setup.py
└── src
    ├── pkg1
    │   └── __init__.py
    ├── pkg2
    │   └── __init__.py
    ├── additional
    │   └── __init__.py
    └── pkg
        └── namespace
            └── __init__.py
```

To have setuptools automatically include packages found in the `src` directory that start with the name `pkg` and not `additional`:

```toml
[tool.setuptools.packages.find]
where = ["src"]
include = ["pkg*"]  # alternatively: `exclude = ["additional*"]`
namespaces = false
```

# Resources

\- <https://setuptools.pypa.io/en/latest/userguide/package_discovery.html#finding-simple-packages>