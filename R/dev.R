#' Inspect JSON sent to plotly.js
#' 
#' This function is useful for obtaining/viewing/debugging JSON 
#' sent to plotly.js.
#' 
#' @param p a plotly or ggplot object.
#' @param jsonedit use \code{listviewer::jsonedit} to view the JSON?
#' @param ... other options passed onto \code{listviewer::jsonedit}
#' @export
#' @examples 
#'   
#' plotly_json(plot_ly())
#' plotly_json(plot_ly(), FALSE)

plotly_json <- function(p = last_plot(), jsonedit = interactive(), ...) {
  plotlyJSON <- to_JSON(plotly_build(p)$x, pretty = TRUE)
  if (jsonedit) {
    try_library("listviewer", "plotly_json")
    listviewer::jsonedit(plotlyJSON, mode = "form", ...)
  } else {
    plotlyJSON
  }
}

#' Display plotly's plot schema
#' 
#' The schema contains valid attributes names, their value type, 
#' default values (if any), and min/max values (if applicable).
#' 
#' @export
#' @examples 
#' schema()

schema <- function() {
  listviewer::jsonedit(Schema, mode = "form")
}
