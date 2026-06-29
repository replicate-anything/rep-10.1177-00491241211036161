# Dawid, Humphreys, and Musio (2022) — Bounding Causes of Effects With Mediators

Folder-backed replication materials for [10.1177/00491241211036161](https://doi.org/10.1177/00491241211036161).

## Layout

```
replication.yml
code/
artifacts/
```

This figure is generated entirely in code (no external data files).

The [registry](https://github.com/replicate-anything/registry) holds a lightweight stub under `papers/10.1177_00491241211036161/` that points here.

## Rebuild display artifacts

From this repository root:

```bash
Rscript -e "replicateEverything::replicate_paper('10.1177/00491241211036161', install_deps = TRUE)"
```

## Tests

From this repository root (with `replicateEverything` installed and the registry as a sibling folder):

```r
testthat::test_dir("tests/testthat")
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

