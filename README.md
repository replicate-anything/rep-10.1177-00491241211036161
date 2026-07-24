# Dawid, Humphreys, and Musio (2022) — Bounding Causes of Effects With Mediators

Folder-backed replication materials for [10.1177/00491241211036161](https://doi.org/10.1177/00491241211036161).

## Layout

```
replication.yml
code/
outputs/
tests/testthat/
```

This figure is generated entirely in code (no external data files).

The [registry](https://github.com/replicate-anything/registry) holds a lightweight stub at `studies/10.1177_00491241211036161.yml` that points here (no `registry/` materials are stored in this repo).

## Build display artifacts

From this repository root:

```r
library(replicateEverything)
options(
  replicateEverything.registry_root = "../registry",
  replicateEverything.use_sibling_packages = TRUE
)
replicateEverything::build_study_outputs(".", install_deps = TRUE)
```

## Tests

```r
testthat::test_dir("tests/testthat")
```

## Validate, then sync to registry checkout

Contributor: validate (and optionally bake outputs); maintainer: write the
registry stub. Both write only into the registry repository, never into this
study repo:

```r
options(replicateEverything.registry_root = "../registry")
replicateEverything::check_and_bake_study(".", build_artifacts = FALSE)
replicateEverything::sync_study_to_registry(".")
```

Or `register_study(".")` to run both steps in one call.

## Local development (monorepo)

```r
options(
  replicateEverything.registry_root = "../registry",
  replicateEverything.use_sibling_packages = TRUE
)
replicateEverything::run_replication(
  doi = "10.1177/00491241211036161",
  what = "fig_1",
  format = TRUE
)
```

See `vignette("folder-replication-checklist", package = "replicateEverything")`.
