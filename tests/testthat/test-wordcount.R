context("Word counts")

dir <- system.file("extdata", package = "textreuse")
corpus <- TextReuseCorpus(dir = dir)

test_that("counts words correctly for different classes", {
  w <- c("One two three four five six seven; all good children go to heaven.")
  expect_equal(wordcount(w), 13)
  w_doc <- TextReuseTextDocument(w)
  expect_equal(wordcount(w), 13)
})

test_that("counts words for a corpus", {
  wc <- wordcount(corpus)
  expect_true(!is.null(names(wc)))
  wc <- unname(wc)
  expect_equal(wc, c(729, 217, 790))
})
