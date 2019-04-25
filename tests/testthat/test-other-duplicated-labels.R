context("canvasXpress duplicated labels")

y <- read.table(system.file("extdata", "cX-simple-dat.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
x <- read.table(system.file("extdata", "cX-simple-smp.txt.gz", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)

precalc.data <- data.frame(iqr1   = c(45,   7.3, 8, NA),     qtl1     = c(109, 14.9, 4, NA),
                           median = c(159, 20.1, 7.25, NA),  qtl3     = c(249, 26.2, 11.3, NA),
                           iqr3   = c(337, 40.6, 17.4, NA),  outliers = c("", "44.5, 46", "", ""),
                           type   = c("A", "B", "C", "D"),
                           stringsAsFactors = F)


test_that("segregated barplot duplicated labels", {

    x$Gene      <- "Gene1"
    x           <- as.matrix(x)
    colnames(y) <- c("S1", "S2", "S4", "S4", "S5", "S1", "S4", "S4")
    rownames(x) <- colnames(y)

    result <- canvasXpress(
        data                      = y,
        smpAnnot                  = x,
        colorBy                   = "IC50",
        graphOrientation          = "vertical",
        graphType                 = "Bar",
        smpOverlays               = list("Drug Sensitivity"),
        segregateSamplesBy        = list("Gene"),
        smpTitle                  = "Cell Lines",
        title                     = "Duplicated labels should appear correct",
        xAxis2Show                = FALSE
    )
    check_ui_test(result)
})

test_that("barplot duplicated labels", {

    x <- as.matrix(x)
    colnames(y) <- c("S1", "S2", "S4", "S4", "S5", "S1", "S4", "S4")
    rownames(x) <- colnames(y)

    result <- canvasXpress(
        data                      = y,
        smpAnnot                  = x,
        colorBy                   = "IC50",
        graphOrientation          = "vertical",
        graphType                 = "Bar",
        smpOverlays               = list("Drug Sensitivity"),
        smpTitle                  = "Cell Lines",
        title                     = "Duplicated labels should appear correct",
        xAxis2Show                = FALSE
    )
    check_ui_test(result)
})

test_that("segregated boxplot duplicated labels", {

    precalc.data$gene <- "Gene1"
    precalc.data <- as.data.frame(t(precalc.data))
    colnames(precalc.data) <- c("Assault", "Rape", "Assault", "Missing")

    result <- canvasXpress(data                  = precalc.data,
                           smpAnnot              = precalc.data[c("type", "gene"), ],
                           graphType             = "Boxplot",
                           graphOrientation      = "vertical",
                           smpLabelFontStyle     = "italic",
                           smpLabelRotate        = 90,
                           showLegend            = FALSE,
                           segregateSamplesBy    = list("gene"),
                           title                 = "Precalculated boxplot with segregation - data with smpAnnot",
                           titleScaleFontFactor  = 0.5)

    check_ui_test(result)
})

test_that("boxplot duplicated labels", {

    precalc.data <- as.data.frame(t(precalc.data))
    colnames(precalc.data) <- c("Assault", "Rape", "Assault", "Missing")

    result <- canvasXpress(data                  = precalc.data,
                           smpAnnot              = precalc.data["type", ],
                           graphType             = "Boxplot",
                           graphOrientation      = "vertical",
                           smpLabelFontStyle     = "italic",
                           smpLabelRotate        = 90,
                           showLegend            = FALSE,
                           title                 = "Precalculated boxplot - data with smpAnnot",
                           titleScaleFontFactor  = 0.5)

    check_ui_test(result)
})