#' ggplot2 themes
#'
#' Themes set the general aspect of the plot such as the colour of the
#' background, gridlines, the size and colour of fonts.
#'
#' @param base_size base font size
#' @param base_family base font family
#'
#' @details \describe{
#'
#' \item{\code{theme_gray}}{
#' The signature ggplot2 theme with a grey background and white gridlines,
#' designed to put the data forward yet make comparisons easy.}
#'
#' \item{\code{theme_bw}}{
#' The classic dark-on-light ggplot2 theme. May work better for presentations
#' displayed with a projector.}
#'
#' \item{\code{theme_linedraw}}{
#' A theme with only black lines of various widths on white backgrounds,
#' reminiscent of a line drawings. Serves a purpose similar to \code{theme_bw}.
#' Note that this theme has some very thin lines (<< 1 pt) which some journals
#' may refuse.}
#'
#' \item{\code{theme_light}}{
#' A theme similar to \code{theme_linedraw} but with light grey lines and axes,
#' to direct more attention towards the data.}
#'
#' \item{\code{theme_minimal}}{
#' A minimalistic theme with no background annotations.}
#'
#' \item{\code{theme_classic}}{
#' A classic-looking theme, with x and y axis lines and no gridlines.}
#'
#' }
#'
#' @examples
#' p <- ggplot(mtcars) + geom_point(aes(x = wt, y = mpg,
#'      colour=factor(gear))) + facet_wrap(~am)
#'
#' p
#' p + theme_gray()
#' p + theme_bw()
#' p + theme_linedraw()
#' p + theme_light()
#' p + theme_minimal()
#' p + theme_classic()
#'
#' @name ggtheme
NULL

#' @export
#' @rdname ggtheme
theme_grey <- function(base_size = 12, base_family = "") {
  theme(
    # Elements in this first block aren't used directly, but are inherited
    # by others
    line =               element_line(colour = "black", size = 0.5, linetype = 1,
                            lineend = "butt"),
    rect =               element_rect(fill = "white", colour = "black", size = 0.5, linetype = 1),
    text =               element_text(family = base_family, face = "plain",
                            colour = "black", size = base_size,
                            hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.9),
    axis.text =          element_text(size = rel(0.8), colour = "grey50"),
    strip.text =         element_text(size = rel(0.8)),

    axis.line =          element_blank(),
    axis.text.x =        element_text(vjust = 1),
    axis.text.y =        element_text(hjust = 1),
    axis.ticks =         element_line(colour = "grey50"),
    axis.title.x =       element_text(),
    axis.title.y =       element_text(angle = 90),
    axis.ticks.length =  unit(0.15, "cm"),
    axis.ticks.margin =  unit(0.1, "cm"),

    legend.background =  element_rect(colour = NA),
    legend.margin =      unit(0.2, "cm"),
    legend.key =         element_rect(fill = "grey95", colour = "white"),
    legend.key.size =    unit(1.2, "lines"),
    legend.key.height =  NULL,
    legend.key.width =   NULL,
    legend.text =        element_text(size = rel(0.8)),
    legend.text.align =  NULL,
    legend.title =       element_text(size = rel(0.8), face = "bold", hjust = 0),
    legend.title.align = NULL,
    legend.position =    "right",
    legend.direction =   NULL,
    legend.justification = "center",
    legend.box =         NULL,

    panel.background =   element_rect(fill = "grey92", colour = NA),
    panel.border =       element_blank(),
    panel.grid.major =   element_line(colour = "white"),
    panel.grid.minor =   element_line(colour = "grey95", size = 0.25),
    panel.margin =       unit(0.25, "lines"),
    panel.margin.x =     NULL,
    panel.margin.y =     NULL,

    strip.background =   element_rect(fill = "grey80", colour = NA),
    strip.text.x =       element_text(),
    strip.text.y =       element_text(angle = -90),

    plot.background =    element_rect(colour = "white"),
    plot.title =         element_text(size = rel(1.2)),
    plot.margin =        unit(c(1, 1, 0.5, 0.5), "lines"),

    complete = TRUE
  )
}
#' @export
#' @rdname ggtheme
theme_gray <- theme_grey

#' @export
#' @rdname ggtheme
theme_bw <- function(base_size = 12, base_family = "") {
  # Starts with theme_grey and then modify some parts
  theme_grey(base_size = base_size, base_family = base_family) %+replace%
    theme(
      axis.text         = element_text(size = rel(0.8)),
      axis.ticks        = element_line(colour = "black"),
      legend.key        = element_rect(colour = "grey80"),
      panel.background  = element_rect(fill = "white", colour = NA),
      panel.border      = element_rect(fill = NA, colour = "grey50"),
      panel.grid.major  = element_line(colour = "grey90", size = 0.2),
      panel.grid.minor  = element_line(colour = "grey98", size = 0.5),
      strip.background  = element_rect(fill = "grey80", colour = "grey50", size = 0.2)
    )
}

#' @export
#' @rdname ggtheme
theme_linedraw <- function(base_size = 12, base_family = "") {
  # Starts with theme_grey and then modify some parts
  theme_grey(base_size = base_size, base_family = base_family) %+replace%
    theme(
      axis.text         = element_text(colour = "black", size = rel(0.8)),
      axis.ticks        = element_line(colour = "black", size = 0.25),
      legend.key        = element_rect(colour = "black", size = 0.25),
      panel.background  = element_rect(fill = "white", colour = NA),
      panel.border      = element_rect(fill = NA, colour = "black", size = 0.5),
      panel.grid.major  = element_line(colour = "black", size = 0.05),
      panel.grid.minor  = element_line(colour = "black", size = 0.01),
      strip.background  = element_rect(fill = "black", colour = NA),
      strip.text.x      = element_text(colour = "white"),
      strip.text.y      = element_text(colour = "white", angle = -90)
    )
}

#' @export
#' @rdname ggtheme
theme_light <- function(base_size = 12, base_family = "") {
  # Starts with theme_grey and then modify some parts
  theme_grey(base_size = base_size, base_family = base_family) %+replace%
    theme(
      axis.ticks        = element_line(colour = "grey70", size = 0.25),
      legend.key        = element_rect(fill = "white", colour = "grey50", size = 0.25),
      panel.background  = element_rect(fill = "white", colour = NA),
      panel.border      = element_rect(fill = NA, colour = "grey70", size = 0.5),
      panel.grid.major  = element_line(colour = "grey85", size = 0.25),
      panel.grid.minor  = element_line(colour = "grey93", size = 0.125),
      strip.background  = element_rect(fill = "grey70", colour = NA),
      strip.text.x      = element_text(colour = "white"),
      strip.text.y      = element_text(colour = "white", angle = -90)
    )

}

#' @export
#' @rdname ggtheme
theme_minimal <- function(base_size = 12, base_family = "") {
  # Starts with theme_bw and then modify some parts
  theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(
      legend.background = element_blank(),
      legend.key        = element_blank(),
      panel.background  = element_blank(),
      panel.border      = element_blank(),
      strip.background  = element_blank(),
      plot.background   = element_blank()
    )
}

#' @export
#' @rdname ggtheme
theme_classic <- function(base_size = 12, base_family = ""){
  theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(
      panel.border     = element_blank(),
      axis.line        = element_line(colour = "black"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      strip.background = element_rect(colour = "black", size = 0.5),
      legend.key       = element_blank()
    )
}
