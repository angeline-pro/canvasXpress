context("canvasXpress Web Charts - Bar")


test_that("cXbar1", {
    check_ui_test(cXbar1())
})

test_that("cXbar2", {
    check_ui_test(cXbar2())
})

test_that("cXbar3", {
    check_ui_test(cXbar3())
})

test_that("cXbar4", {
    check_ui_test(cXbar4())
})

test_that("cXbar5", {
    check_ui_test(cXbar5())
})

test_that("cXbar6", {
    check_ui_test(cXbar6())
})

test_that("cXbar7", {
    check_ui_test(cXbar7())
})

test_that("cXbar8", {
    check_ui_test(cXbar8())
})

test_that("cXbar9", {
    check_ui_test(cXbar9())
})

test_that("cXbar10", {
    check_ui_test(cXbar10())

    warning("Durable overlay looks different in R than on the CX website, missing the following parm: smpOverlayProperties=list('Durable' = list('type'='Boolean'))")
})

test_that("cXbar11", {
    check_ui_test(cXbar11())

    warning("Durable overlay looks different in R than on the CX website, missing the following parm: smpOverlayProperties=list('Durable' = list('type'='Boolean'))")
})
