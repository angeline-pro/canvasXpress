context("canvasXpress legendTitle")

barplot_y <- read.table(system.file("extdata", "cX-simple-dat.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
barplot_x <- read.table(system.file("extdata", "cX-simple-smp.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
boxplot_y <- read.table(system.file("extdata", "cX-toothgrowth-dat.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
boxplot_x <- read.table(system.file("extdata", "cX-toothgrowth-smp.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)

get_plot_title <- function(plot) {
    paste(plot, "- No LegendTitle")
}

test_that("scatterplot LegendTitle", {

    y = read.table(system.file("extdata", "cX-scatterR3-dat.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    z = read.table(system.file("extdata", "cX-scatterR3-var.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    result <- canvasXpress(
                data            = y,
                varAnnot        = z,
                colorBy         = "Group",
                graphType       = "Scatter2D",
                title           = get_plot_title("Scatterplot"),
                showLegendTitle = FALSE
    )
    check_ui_test(result)
})

test_that("barplot LegendTitle", {

    result <-  canvasXpress(
        data                    = barplot_y,
        smpAnnot                = barplot_x,
        colorBy                 = "Drug Sensitivity",
        graphOrientation        = "vertical",
        graphType               = "Bar",
        title                   = get_plot_title("Barplot"),
        showLegendTitle         = FALSE
    )
    check_ui_test(result)
})

test_that("barplot (segregated) LegendTitle", {

    z <- data.frame(Plot = "Bar1", stringsAsFactors = F)
    rownames(z) <- rownames(barplot_y)
    result <-  canvasXpress(
        data                    = barplot_y,
        smpAnnot                = barplot_x,
        varAnnot                = z,
        colorBy                 = "Drug Sensitivity",
        graphOrientation        = "vertical",
        graphType               = "Bar",
        segregateVariablesBy    = list("Plot"),
        title                   = get_plot_title("Barplot (segregated)"),
        showLegendTitle         = FALSE
    )
    check_ui_test(result)
})

test_that("boxplot LegendTitle", {

    result <-  canvasXpress(
        data                    = boxplot_y,
        smpAnnot                = boxplot_x,
        colorBy                 = "dose",
        graphOrientation        = "vertical",
        graphType               = "Boxplot",
        groupingFactors         = list("dose"),
        showLegend              = TRUE,
        smpTitle                = "dose",
        stringSampleFactors     = list("dose"),
        title                   = get_plot_title("Boxplot"),
        showLegendTitle         = FALSE
    )
    check_ui_test(result)
})

test_that("boxplot (segregated) LegendTitle", {

    z <- data.frame(Plot = "Box1", stringsAsFactors = F)
    rownames(z) <- rownames(boxplot_y)
    result <-  canvasXpress(
        data                    = boxplot_y,
        smpAnnot                = boxplot_x,
        varAnnot                = z,
        colorBy                 = "dose",
        graphOrientation        = "vertical",
        graphType               = "Boxplot",
        segregateVariablesBy    = list("Plot"),
        groupingFactors         = list("dose"),
        showLegend              = TRUE,
        smpTitle                = "dose",
        stringSampleFactors     = list("dose"),
        title                   = get_plot_title("Boxplot (segregated)"),
        showLegendTitle         = FALSE
    )
    check_ui_test(result)
})

test_that("Scatterplot matrix LegendTitle", {

    y <- read.table(system.file("extdata", "cX-irist-dat.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    z <- read.table(system.file("extdata", "cX-irist-var.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    result <-  canvasXpress(
        data                    = y,
        varAnnot                = z,
        colorBy                 = "Species",
        graphType               = "Scatter2D",
        scatterPlotMatrix       = TRUE,
        title                   = get_plot_title("Scatterplot matrix"),
        showLegendTitle         = FALSE
    )
    check_ui_test(result)
})

test_that("dotplot LegendTitle", {

    result <-  canvasXpress(
        data                    = boxplot_y,
        smpAnnot                = boxplot_x,
        colorBy                 = "dose",
        stringSampleFactors     = list("dose"),
        groupingFactors         = list("supp"),
        graphOrientation        = "vertical",
        graphType               = "Dotplot",
        title                   = get_plot_title("Dotplot"),
        showLegendTitle         = FALSE
    )
    check_ui_test(result)
})

test_that("heatmap LegendTitle", {

    y  <- read.table(system.file("extdata", "cX-multidimensionalheatmap-dat.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    y2 <- read.table(system.file("extdata", "cX-multidimensionalheatmap-dat3.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    result <-  canvasXpress(
        data                    = list(y = y, data2 = y2),
        shapeBy                 = "Shape",
        shapeByData             = "data2",
        graphType               = "Heatmap",
        title                   = get_plot_title("Heatmap"),
        showLegendTitle         = FALSE
    )
    check_ui_test(result)
})
