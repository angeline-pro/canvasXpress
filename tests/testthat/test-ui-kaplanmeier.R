context("canvasXpress Web Charts - Kaplanmeier")


test_that("cXkaplanmeier1", {
    check_ui_test(cXkaplanmeier1())
})

test_that("cXkaplanmeier2", {
    check_ui_test(cXkaplanmeier2())
})

test_that("cXkaplanmeier3", {
    check_ui_test(cXkaplanmeier3())
})

test_that("cXkaplanmeier4", {
    check_ui_test(cXkaplanmeier4())
})

test_that("cXkaplanmeier5", {
    check_ui_test(cXkaplanmeier5())

    warning("The subcharts are in a different layout order compared to web example")
})
