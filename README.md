# cron-py

Python bindings for the `cron` Rust crate.

In development.

# Usage

```shell
uv add git+https://github.com/danielgafni/cron-py.git
```

```python
from cron import Schedule

schedule = Schedule("0 0 * * *")
```

# Development

## Setup
With nix, you can run `nix develop` to automatically enter a shell with all the necessary dependencies. `direnv` users can run `direnv allow` to get the same effect.

## Building the full project

```shell
uv sync --build
```

## Running tests

```bash
uv run pytest
```
