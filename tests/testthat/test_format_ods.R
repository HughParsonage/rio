context("ODS imports/exports")
require("datasets")

test_that("Import from ODS", {
    ods <- import(system.file("examples", "mtcars.ods", package = "rio"))
    expect_true(is.data.frame(ods), label = "ODS import returns data.frame")
    expect_true(identical(names(mtcars), names(ods)), label = "ODS import returns correct names")
    expect_true(identical(dim(mtcars), dim(ods)), label = "ODS import returns correct dimensions")
})

test_that("Export to ODS", {
    expect_true(export(iris, "iris.ods") %in% dir())
})

unlink("iris.ods")
