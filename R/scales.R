#' Create a color ramp from a \code{vapeplot} palette
#'
#' @param n The number of colors (≥ 1) to be in the palette.
#' @param option Choose from "vaporwave" (default), "cool", "crystal_pepsi",
#'   "mallsoft", "jazzcup", "sunset", "macplus", "seapunk".
#' @param alpha The alpha transparency, a number in [0,1]
#' @param reverse If \code{TRUE}, the direction of the colours is reversed;
#'   \code{FALSE} is the default.
#'
#' @importFrom grDevices colorRampPalette
#'
#' @rdname vapeplot
#' @examples
#' library(vapeplot)
#' image(volcano, col = vapeplot("sunset", 20))
#' @export
vapeplot <- function(option = "vaporwave", n, alpha = 1, reverse = FALSE) {

  pal <- vapeplot_palettes[[option]]

  if (is.null(pal))
    stop("Palette not found.")

  if(missing(n)) {
    n <- length(pal)
  }

  if (reverse) {
    pal <- rev(pal)
  }

  pal <- colorRampPalette(pal, alpha)(n)

  return(pal)

}

#' @rdname vapeplot
#' @importFrom grDevices colorRampPalette
#' @export
vapeplot_pal <- function(option = "vaporwave", alpha = 1, reverse = FALSE) {

  function(n) {
    vapeplot(option, n, alpha, reverse)
  }

}


#' Vaporwave-aligned color maps
#'
#' The \code{vapeplot} scales provide continuous and discrete color schemes
#' found in the Python package
#' \href{https://github.com/dantaki/vapeplot}{vapeplot}.
#'
#' @inheritParams vapeplot_pal
#' @param option Choose from "vaporwave" (default), "cool", "crystal_pepsi",
#'   "mallsoft", "jazzcup", "sunset", "macplus", "seapunk".
#' @param reverse If \code{TRUE}, the direction of the colours is reversed.
#' @param alpha The alpha transparency, a number in [0,1]
#' @param ... additional arguments to pass to \code{scale_color_gradientn} or
#'   \code{discrete_scale}.
#'
#' @rdname scale_vapeplot
#' @export
#' @examples
#' library(ggplot2)
#' library(vapeplot)
#'
#' ggplot(diamonds) +
#'  geom_point(aes(x = carat, y = price, color = cut)) +
#'  scale_color_vapeplot_d("mallsoft")
#'
#' ggplot(diamonds) +
#'   geom_bar(aes(x = cut, fill = clarity)) +
#'   scale_fill_vapeplot_d("seapunk")



#' @export
#' @rdname scale_vapeplot
#' @importFrom ggplot2 scale_colour_manual
#' @importFrom ggplot2 discrete_scale
#' @importFrom ggplot2 scale_color_gradientn
scale_color_vapeplot_c <- function(option = "vaporwave", alpha = 1, reverse = FALSE, ...) {
  scale_color_gradientn(colours = vapeplot(option, 256, alpha = alpha, reverse = reverse), ...)
}

#' @export
#' @rdname scale_vapeplot
scale_color_vapeplot_d <- function(option = "vaporwave", alpha = 1, reverse = FALSE, ...) {
    discrete_scale("colour", "vapeplot", vapeplot_pal(option, alpha = alpha, reverse = reverse), ...)
}

#' @rdname scale_vapeplot
#' @export
scale_colour_vapeplot_c <- scale_color_vapeplot_c

#' @rdname scale_vapeplot
#' @export
scale_colour_vapeplot_d <- scale_color_vapeplot_d


#' @importFrom ggplot2 scale_fill_manual
#' @importFrom ggplot2 scale_fill_gradientn
#' @rdname scale_vapeplot
#' @export
scale_fill_vapeplot_c <- function(option = "vaporwave", alpha = 1, reverse = TRUE, ...) {
  scale_fill_gradientn(colours = vapeplot(option, 256, alpha = alpha, reverse = reverse), ...)
}

#' @rdname scale_vapeplot
#' @export
scale_fill_vapeplot_d <- function(option = "vaporwave", alpha = 1, reverse = TRUE, ...) {
  discrete_scale("fill", "vapeplot", vapeplot_pal(option, alpha = alpha, reverse = reverse), ...)
}

