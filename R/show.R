#' Display a color palette
#'
#' Display a palette in the graphics window by calling its name.
#'
#' @param ... the name of the palette or palettes; shows all palettes if no
#'   argument is give.
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_tile
#' @importFrom ggplot2 aes_
#' @importFrom ggplot2 scale_fill_manual
#' @importFrom ggplot2 scale_x_continuous
#' @importFrom ggplot2 scale_y_continuous
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 theme_minimal
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 element_text
#'
#' @export
#' @examples
#' library(vapeplot)
#' show_palette("cool", "sunset")
show_palette <- function(...) {

  option <- as.list(substitute(list(...)))[-1L]
  pals <- vapeplot::vapeplot_palettes
  nms <- if (length(option) == 0) names(pals) else names(pals[unlist(option)])

  p <- lapply(nms, plot_palette)
  gridExtra::grid.arrange(gridExtra::arrangeGrob(grobs = p))
}

plot_palette <- function(option) {
  cols <- vapeplot::vapeplot_palettes[[option]]
  df <- data.frame(n = seq_along(cols))

  ggplot(df) +
    geom_tile(aes_(x = ~n, y = ~1, fill = ~factor(n))) +
    scale_fill_manual(values = cols, guide = FALSE) +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    labs(title = option) +
    theme_minimal() +
    theme(axis.text = element_blank(),
          axis.title = element_blank(),
          plot.title = element_text(hjust = 0.5))
}