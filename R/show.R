#' Display a color palette
#'
#' Display a palette in the graphics window by calling its name.
#'
#' @param option the name of the palette.
#' @export
#' @examples
#' library(vapeplot)
#' show_palette("cool")
show_palette <- function(option) {

  name <- option
  palette <- vapeplot(option)
  n <- length(palette)

  if (length(palette > 0)) {

    graphics::image(1:n, 1, as.matrix(1:n), col = palette,
                    xlab = "", ylab = "", xaxt = "n", yaxt = "n",
                    bty = "n")
    graphics::title(main = name)

  }
}