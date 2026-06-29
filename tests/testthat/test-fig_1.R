DOI <- "10.1177/00491241211036161"
WHAT <- "fig_1"
FOLDER <- "10.1177_00491241211036161"
STUDY_REPO <- "replicate-anything/rep-10.1177-00491241211036161"

study_test_context <- function() {
  study_root <- normalizePath(
    testthat::test_path("..", ".."),
    winslash = "/",
    mustWork = FALSE
  )
  registry_root <- normalizePath(
    file.path(study_root, "..", "registry"),
    winslash = "/",
    mustWork = FALSE
  )
  monorepo_root <- normalizePath(
    file.path(study_root, ".."),
    winslash = "/",
    mustWork = FALSE
  )

  local_index <- data.frame(
    folder = FOLDER,
    doi = paste0("https://doi.org/", DOI),
    title = "Bounding Causes of Effects With Mediators",
    journal = "Sociological Methods & Research",
    year = 2022,
    authors = "Macartan Humphreys, Philip Dawid, Monica Musio",
    repo = STUDY_REPO,
    stringsAsFactors = FALSE
  )

  list(
    study_root = study_root,
    registry_root = registry_root,
    monorepo_root = monorepo_root,
    local_index = local_index
  )
}

test_that("run_replication executes fig_1", {
  testthat::skip_if_not_installed("replicateEverything")
  testthat::skip_if_not_installed("ggplot2")

  ctx <- study_test_context()
  testthat::skip_if_not(dir.exists(ctx$registry_root), "registry checkout missing")

  withr::with_options(
    list(
      replicateEverything.registry_root = ctx$registry_root,
      replicateEverything.index = ctx$local_index,
      replicateEverything.use_sibling_packages = TRUE,
      replicateEverything.study_folders_root = ctx$monorepo_root
    ),
    {
      invisible(suppressMessages(capture.output({
        bounds <- replicateEverything::run_replication(DOI, WHAT)
      })))
      testthat::expect_true(is.data.frame(bounds))
      testthat::expect_true("L" %in% names(bounds))
      testthat::expect_true("H" %in% names(bounds))
    }
  )
})

test_that("formatted live figure matches precomputed artifact", {
  testthat::skip_if_not_installed("replicateEverything")
  testthat::skip_if_not_installed("ggplot2")

  ctx <- study_test_context()
  testthat::skip_if_not(dir.exists(ctx$registry_root), "registry checkout missing")
  artifact_path <- file.path(ctx$study_root, "artifacts", "fig_1.png")
  testthat::skip_if_not(file.exists(artifact_path), "fig_1 artifact missing")

  withr::with_options(
    list(
      replicateEverything.registry_root = ctx$registry_root,
      replicateEverything.index = ctx$local_index,
      replicateEverything.use_sibling_packages = TRUE,
      replicateEverything.study_folders_root = ctx$monorepo_root
    ),
    {
      invisible(suppressMessages(capture.output({
        plot <- replicateEverything::run_replication(DOI, WHAT, format = TRUE)
      })))
      testthat::expect_true(inherits(plot, "ggplot"))

      tmp <- tempfile(fileext = ".png")
      ggplot2::ggsave(
        tmp,
        plot = plot,
        width = 8,
        height = 6,
        dpi = 150
      )
      testthat::expect_equal(
        unname(tools::md5sum(tmp)),
        unname(tools::md5sum(artifact_path))
      )
    }
  )
})
