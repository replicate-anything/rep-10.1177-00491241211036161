# Dawid, Humphreys, and Musio (2022) — Bounding Causes of Effects With Mediators

Folder-backed replication materials for [10.1177/00491241211036161](https://doi.org/10.1177/00491241211036161).

## Layout

```
replication.yml
code/
artifacts/
tests/testthat/
```

This figure is generated entirely in code (no external data files).

The [registry](https://github.com/replicate-anything/registry) holds a lightweight stub under `papers/10.1177_00491241211036161/` that points here.

## Build display artifacts

From this repository root:

```r
library(replicateEverything)
options(
  replicateEverything.registry_root = "../registry",
  replicateEverything.use_sibling_packages = TRUE
)
replicateEverything::build_study_artifacts(".", install_deps = TRUE)
```

## Tests

```r
testthat::test_dir("tests/testthat")
```

## Validate before merge

```r
replicateEverything::check_folder_replication(
  ".",
  registry_root = "../registry"
)
```

Use `full_replication = TRUE` to also run every table/figure live.

## Register with the registry

After checks pass (from the monorepo, with registry as a sibling):

```r
options(replicateEverything.registry_root = "../registry")
replicateEverything::add_folder_paper(".")
```

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
