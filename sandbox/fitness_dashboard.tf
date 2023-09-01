resource "datadog_dashboard" "tfer--dashboard_sdw-scs-39h" {
  description  = "Fitness Dashboard - Managed by Terraform"
  is_read_only = "false"
  layout_type  = "ordered"
  reflow_type  = "fixed"

  template_variable {
    default = "*"
    name    = "segment_name"
    prefix  = "segment_name"
  }

  template_variable {
    default = "*"
    name    = "activity_name"
    prefix  = "activity_name"
  }

  template_variable {
    default = "*"
    name    = "activity_id"
    prefix  = "activity_id"
  }

  title = "Fitness Dashboard [Terraform Managed]"
  url   = "/dashboard/sdw-scs-39h/fitness-dashboard"

  widget {
    note_definition {
      background_color = "orange"
      content          = "Summary"
      font_size        = "36"
      has_padding      = "true"
      show_tick        = "true"
      text_align       = "center"
      tick_edge        = "bottom"
      tick_pos         = "50%"
      vertical_align   = "center"
    }

    widget_layout {
      height          = "1"
      is_column_break = "false"
      width           = "12"
      x               = "0"
      y               = "0"
    }
  }

  widget {
    query_value_definition {
      autoscale   = "true"
      custom_unit = "m"
      precision   = "2"

      request {
        conditional_formats {
          comparator      = ">"
          custom_fg_color = "#ff4f00"
          hide_value      = "false"
          image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
          palette         = "custom_text"
          value           = "0"
        }

        formula {
          formula_expression = "query1"
        }

        query {
          metric_query {
            aggregator  = "sum"
            data_source = "metrics"
            name        = "query1"
            query       = "sum:kyouhei.strava.distance{activity_type:run}"
          }
        }
      }

      timeseries_background {
        type = "bars"
      }

      title       = "Run Distance"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "3"
      x               = "0"
      y               = "1"
    }
  }

  widget {
    timeseries_definition {
      legend_columns = ["sum", "avg", "max", "min", "value"]
      legend_layout  = "auto"

      request {
        display_type = "bars"

        formula {
          formula_expression = "query1"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "sum:kyouhei.strava.distance{activity_type:run}.rollup(sum, 86400)"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "orange"
        }
      }

      request {
        display_type = "line"

        formula {
          formula_expression = "cumsum(query0)"
        }

        on_right_yaxis = "true"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query0"
            query       = "sum:kyouhei.strava.distance{activity_type:run}.rollup(sum, 86400)"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "dog_classic"
        }
      }

      show_legend = "true"
      title       = "Run Distance"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "3"
      x               = "3"
      y               = "1"
    }
  }

  widget {
    query_value_definition {
      autoscale   = "false"
      custom_unit = "m"
      precision   = "2"

      request {
        conditional_formats {
          comparator      = ">"
          custom_fg_color = "#ff4f00"
          hide_value      = "false"
          image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
          palette         = "custom_text"
          value           = "0"
        }

        formula {
          formula_expression = "query1"
        }

        query {
          metric_query {
            aggregator  = "sum"
            data_source = "metrics"
            name        = "query1"
            query       = "sum:kyouhei.strava.elevation_gain{activity_type:run}"
          }
        }
      }

      timeseries_background {
        type = "bars"
      }

      title       = "Run Elevation Gain"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "3"
      x               = "6"
      y               = "1"
    }
  }

  widget {
    timeseries_definition {
      legend_columns = ["sum", "value", "min", "max", "avg"]
      legend_layout  = "auto"

      request {
        display_type = "bars"

        formula {
          formula_expression = "query1"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "sum:kyouhei.strava.elevation_gain{activity_type:run}.rollup(sum, 86400)"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "orange"
        }
      }

      request {
        display_type = "line"

        formula {
          formula_expression = "cumsum(query0)"
        }

        on_right_yaxis = "true"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query0"
            query       = "sum:kyouhei.strava.elevation_gain{activity_type:run}.rollup(sum, 86400)"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "dog_classic"
        }
      }

      show_legend = "true"
      title       = "Run Elevation Gain"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "3"
      x               = "9"
      y               = "1"
    }
  }

  widget {
    toplist_definition {
      request {
        formula {
          formula_expression = "query1"

          limit {
            count = "10"
            order = "desc"
          }
        }

        query {
          metric_query {
            aggregator  = "sum"
            data_source = "metrics"
            name        = "query1"
            query       = "count:kyouhei.strava.segment.effort_id{*} by {segment_name}"
          }
        }
      }

      title       = "Recent Segments"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "4"
      x               = "0"
      y               = "3"
    }
  }

  widget {
    query_value_definition {
      autoscale   = "true"
      custom_unit = "kg"
      precision   = "2"

      request {
        conditional_formats {
          comparator      = ">="
          custom_fg_color = "#ff4f00"
          hide_value      = "false"
          image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
          palette         = "white_on_red"
          value           = "70"
        }

        conditional_formats {
          comparator = ">="
          hide_value = "false"
          palette    = "white_on_yellow"
          value      = "68"
        }

        conditional_formats {
          comparator = "<"
          hide_value = "false"
          palette    = "white_on_green"
          value      = "68"
        }

        formula {
          formula_expression = "cutoff_min(exclude_null(query1), 40)"
        }

        query {
          metric_query {
            aggregator  = "last"
            data_source = "metrics"
            name        = "query1"
            query       = "max:kyouhei.strava.weight{*}.rollup(max, 600)"
          }
        }
      }

      timeseries_background {
        type = "area"

        yaxis {
          include_zero = "false"
        }
      }

      title       = "Body Weight"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "3"
      x               = "4"
      y               = "3"
    }
  }

  widget {
    timeseries_definition {
      legend_columns = ["sum", "avg", "max", "min", "value"]
      legend_layout  = "auto"
      live_span      = "1w"

      request {
        display_type = "line"

        formula {
          formula_expression = "forecast(cutoff_min(query1, 40), 'linear', 1)"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "sum:kyouhei.strava.weight{*}.rollup(max, 60)"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "green"
        }
      }

      show_legend = "true"
      title       = "Body Weight Forecust"
      title_align = "left"
      title_size  = "16"

      yaxis {
        include_zero = "false"
      }
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "5"
      x               = "7"
      y               = "3"
    }
  }

  widget {
    group_definition {
      background_color = "vivid_pink"
      layout_type      = "ordered"
      show_title       = "true"
      title            = "Activity Metrics"

      widget {
        image_definition {
          has_background   = "false"
          has_border       = "true"
          horizontal_align = "center"
          sizing           = "contain"
          url              = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
          vertical_align   = "center"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "3"
          x               = "0"
          y               = "0"
        }
      }

      widget {
        query_value_definition {
          autoscale   = "true"
          custom_unit = "m"
          live_span   = "1w"
          precision   = "2"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#ff4f00"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.distance{*}"
              }
            }
          }

          title       = "Distance Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "3"
          x               = "3"
          y               = "0"
        }
      }

      widget {
        query_value_definition {
          autoscale   = "false"
          custom_unit = "m"
          live_span   = "1w"
          precision   = "2"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#ff4f00"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.elevation_gain{*}"
              }
            }
          }

          title       = "Elv Gain Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "3"
          x               = "6"
          y               = "0"
        }
      }

      widget {
        query_value_definition {
          autoscale = "true"
          live_span = "1w"
          precision = "1"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#fc4d04"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.elapsed_time{*}"
              }
            }
          }

          title       = "Duration Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "3"
          x               = "9"
          y               = "0"
        }
      }

      widget {
        sunburst_definition {
          hide_total = "false"
          live_span  = "1w"

          request {
            formula {
              formula_expression = "query1"

              limit {
                count = "0"
                order = "desc"
              }
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "count:kyouhei.strava.elapsed_time{*} by {activity_type}"
              }
            }
          }

          title       = "Activity Type Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "4"
          is_column_break = "false"
          width           = "4"
          x               = "0"
          y               = "2"
        }
      }

      widget {
        note_definition {
          background_color = "orange"
          content          = "Run"
          font_size        = "24"
          has_padding      = "true"
          show_tick        = "true"
          text_align       = "center"
          tick_edge        = "bottom"
          tick_pos         = "50%"
          vertical_align   = "center"
        }

        widget_layout {
          height          = "1"
          is_column_break = "false"
          width           = "8"
          x               = "4"
          y               = "2"
        }
      }

      widget {
        query_value_definition {
          autoscale   = "true"
          custom_unit = "m"
          live_span   = "1w"
          precision   = "2"

          request {
            conditional_formats {
              comparator      = "<"
              custom_fg_color = "#ff4f00"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "75000"
            }

            conditional_formats {
              comparator = ">="
              hide_value = "false"
              palette    = "white_on_green"
              value      = "75000"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.distance{activity_type:run}"
              }
            }
          }

          timeseries_background {
            type = "bars"
          }

          title       = "Run Distance Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "2"
          x               = "4"
          y               = "3"
        }
      }

      widget {
        query_value_definition {
          autoscale   = "false"
          custom_unit = "m"
          live_span   = "1w"
          precision   = "2"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#fc4d04"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.elevation_gain{activity_type:run}"
              }
            }
          }

          title       = "Run Elv Gain Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "2"
          x               = "6"
          y               = "3"
        }
      }

      widget {
        query_value_definition {
          autoscale = "true"
          live_span = "1w"
          precision = "1"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#fc4d04"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.elapsed_time{activity_type:run}"
              }
            }
          }

          title       = "Run Duration Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "2"
          x               = "8"
          y               = "3"
        }
      }

      widget {
        query_value_definition {
          autoscale   = "true"
          custom_unit = "m/km"
          live_span   = "1w"
          precision   = "2"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#fc4d04"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "60 / (query1 * 60 * 60) * 1000"
            }

            query {
              metric_query {
                aggregator  = "avg"
                data_source = "metrics"
                name        = "query1"
                query       = "avg:kyouhei.strava.average_speed{activity_type:run}"
              }
            }
          }

          title       = "Run Avg Pace 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "2"
          x               = "10"
          y               = "3"
        }
      }

      widget {
        note_definition {
          background_color = "pink"
          content          = "Ride"
          font_size        = "24"
          has_padding      = "true"
          show_tick        = "true"
          text_align       = "center"
          tick_edge        = "bottom"
          tick_pos         = "50%"
          vertical_align   = "center"
        }

        widget_layout {
          height          = "1"
          is_column_break = "false"
          width           = "8"
          x               = "4"
          y               = "5"
        }
      }

      widget {
        timeseries_definition {
          legend_columns = ["avg", "max", "value", "sum", "min"]
          legend_layout  = "auto"
          live_span      = "1w"

          request {
            display_type = "bars"

            formula {
              formula_expression = "query1"
            }

            on_right_yaxis = "false"

            query {
              metric_query {
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.distance{*} by {activity_type,activity_name,activity_id}"
              }
            }

            style {
              line_type  = "solid"
              line_width = "normal"
              palette    = "orange"
            }
          }

          show_legend = "true"
          title       = "Distance Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "4"
          x               = "0"
          y               = "6"
        }
      }

      widget {
        query_value_definition {
          autoscale   = "true"
          custom_unit = "m"
          live_span   = "1w"
          precision   = "2"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#ff4f00"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.distance{activity_type:ride}"
              }
            }
          }

          title       = "Ride Distance Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "2"
          x               = "4"
          y               = "6"
        }
      }

      widget {
        query_value_definition {
          autoscale   = "false"
          custom_unit = "m"
          live_span   = "1w"
          precision   = "2"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#fc4d04"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.elevation_gain{activity_type:ride}"
              }
            }
          }

          title       = "Ride Elv Gain Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "2"
          x               = "6"
          y               = "6"
        }
      }

      widget {
        query_value_definition {
          autoscale = "true"
          live_span = "1w"
          precision = "1"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#fc4d04"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1"
            }

            query {
              metric_query {
                aggregator  = "sum"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.elapsed_time{activity_type:ride}"
              }
            }
          }

          title       = "Ride Duration Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "2"
          x               = "8"
          y               = "6"
        }
      }

      widget {
        query_value_definition {
          autoscale   = "true"
          custom_unit = "km/h"
          live_span   = "1w"
          precision   = "1"

          request {
            conditional_formats {
              comparator      = ">"
              custom_fg_color = "#fc4d04"
              hide_value      = "false"
              image_url       = "https://www.samaritanscycle.com/wp-content/uploads/2018/03/strava-logo-2016.png"
              palette         = "custom_text"
              value           = "0"
            }

            formula {
              formula_expression = "query1 * 3600 / 1000"
            }

            query {
              metric_query {
                aggregator  = "avg"
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.average_speed{activity_type:ride}"
              }
            }
          }

          title       = "Ride Avg Speed 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "2"
          is_column_break = "false"
          width           = "2"
          x               = "10"
          y               = "6"
        }
      }

      widget {
        query_table_definition {
          custom_link {
            is_hidden = "false"
            label     = "View Strava"
            link      = "{{activity_url.value}}"
          }

          has_search_bar = "auto"
          live_span      = "1w"

          request {
            formula {
              alias              = "Duration"
              cell_display_mode  = "bar"
              formula_expression = "query1"
            }

            formula {
              alias              = "Sort"
              cell_display_mode  = "number"
              formula_expression = "query2"

              limit {
                count = "500"
                order = "desc"
              }
            }

            limit = "0"

            query {
              metric_query {
                aggregator  = "avg"
                data_source = "metrics"
                name        = "query1"
                query       = "avg:kyouhei.strava.elapsed_time{*} by {activity_name,activity_url}"
              }
            }

            query {
              metric_query {
                aggregator  = "avg"
                data_source = "metrics"
                name        = "query2"
                query       = "avg:kyouhei.strava.activity_id{*} by {activity_name,activity_url}"
              }
            }
          }

          title       = "Activities Past 1 Week"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "3"
          is_column_break = "false"
          width           = "12"
          x               = "0"
          y               = "8"
        }
      }

      widget {
        timeseries_definition {
          legend_columns = ["max", "avg", "sum", "min", "value"]
          legend_layout  = "auto"
          live_span      = "1mo"

          request {
            display_type = "area"

            formula {
              formula_expression = "cumsum(query1)"
            }

            on_right_yaxis = "false"

            query {
              metric_query {
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.distance{*} by {activity_type}.rollup(sum, 86400)"
              }
            }

            style {
              line_type  = "solid"
              line_width = "normal"
              palette    = "orange"
            }
          }

          show_legend = "true"
          title       = "Distance per Type Past 1 Month"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "3"
          is_column_break = "false"
          width           = "6"
          x               = "0"
          y               = "11"
        }
      }

      widget {
        timeseries_definition {
          legend_columns = ["avg", "sum", "min", "value", "max"]
          legend_layout  = "auto"
          live_span      = "1mo"

          request {
            display_type = "line"

            formula {
              formula_expression = "forecast(query1, 'linear', 1)"
            }

            on_right_yaxis = "false"

            query {
              metric_query {
                data_source = "metrics"
                name        = "query1"
                query       = "sum:kyouhei.strava.distance{activity_type:run}.rollup(sum, 604800)"
              }
            }

            style {
              line_type  = "solid"
              line_width = "normal"
              palette    = "dog_classic"
            }
          }

          show_legend = "true"
          title       = "Run Forecast"
          title_align = "left"
          title_size  = "16"
        }

        widget_layout {
          height          = "3"
          is_column_break = "false"
          width           = "6"
          x               = "6"
          y               = "11"
        }
      }
    }

    widget_layout {
      height          = "15"
      is_column_break = "false"
      width           = "12"
      x               = "0"
      y               = "5"
    }
  }

  widget {
    note_definition {
      background_color = "blue"
      content          = "Segments"
      font_size        = "36"
      has_padding      = "true"
      show_tick        = "true"
      text_align       = "center"
      tick_edge        = "bottom"
      tick_pos         = "50%"
      vertical_align   = "center"
    }

    widget_layout {
      height          = "1"
      is_column_break = "false"
      width           = "12"
      x               = "0"
      y               = "0"
    }
  }

  widget {
    timeseries_definition {
      legend_columns = ["max", "avg", "value", "min", "sum"]
      legend_layout  = "auto"

      request {
        display_type = "line"

        formula {
          alias              = "min"
          formula_expression = "query1 / 60"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "avg:kyouhei.strava.segment.elapsed_time{$segment_name,$activity_name} by {segment_name}.rollup(avg, 600)"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "warm"
        }
      }

      show_legend = "true"
      title       = "Segments Time"
      title_align = "left"
      title_size  = "16"

      yaxis {
        include_zero = "false"
      }
    }

    widget_layout {
      height          = "4"
      is_column_break = "false"
      width           = "12"
      x               = "0"
      y               = "1"
    }
  }

  widget {
    timeseries_definition {
      legend_columns = ["value", "sum", "min", "max", "avg"]
      legend_layout  = "auto"

      request {
        display_type = "line"

        formula {
          formula_expression = "query1"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "avg:kyouhei.strava.segment.average_watts{$segment_name} by {segment_name}"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "dog_classic"
        }
      }

      show_legend = "true"
      title       = "Segments Power"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "4"
      x               = "0"
      y               = "5"
    }
  }

  widget {
    timeseries_definition {
      legend_columns = ["min", "max", "avg", "value", "sum"]
      legend_layout  = "auto"

      request {
        display_type = "line"

        formula {
          formula_expression = "query1"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "avg:kyouhei.strava.segment.average_heartrate{$segment_name} by {segment_name}"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "dog_classic"
        }
      }

      show_legend = "true"
      title       = "Segments HR"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "4"
      x               = "4"
      y               = "5"
    }
  }

  widget {
    timeseries_definition {
      legend_columns = ["avg", "sum", "min", "value", "max"]
      legend_layout  = "auto"

      request {
        display_type = "line"

        formula {
          formula_expression = "2 * query1"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "avg:kyouhei.strava.segment.average_cadence{$segment_name} by {segment_name}"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "dog_classic"
        }
      }

      show_legend = "true"
      title       = "Segments Cadence"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "2"
      is_column_break = "false"
      width           = "4"
      x               = "8"
      y               = "5"
    }
  }

  widget {
    query_table_definition {
      custom_link {
        is_hidden = "false"
        label     = "Segment URL"
        link      = "{{segment_url.value}}"
      }

      request {
        formula {
          alias              = "Sort"
          cell_display_mode  = "number"
          formula_expression = "query3"

          limit {
            count = "500"
            order = "desc"
          }
        }

        formula {
          alias              = "Time"
          cell_display_mode  = "bar"
          formula_expression = "query1 / 60"
        }

        limit = "0"

        query {
          metric_query {
            aggregator  = "avg"
            data_source = "metrics"
            name        = "query3"
            query       = "avg:kyouhei.strava.segment.effort_id{$segment_name,$activity_name} by {segment_name,segment_url}"
          }
        }

        query {
          metric_query {
            aggregator  = "avg"
            data_source = "metrics"
            name        = "query1"
            query       = "avg:kyouhei.strava.segment.elapsed_time{$segment_name,$activity_name} by {segment_name,segment_url}"
          }
        }
      }

      title       = "Segment Efforts"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "4"
      is_column_break = "false"
      width           = "12"
      x               = "0"
      y               = "7"
    }
  }

  widget {
    log_stream_definition {
      message_display     = "inline"
      query               = "service:strava_datadog"
      show_date_column    = "true"
      show_message_column = "true"

      sort {
        column = "time"
        order  = "desc"
      }

      title       = "Logs"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "4"
      is_column_break = "false"
      width           = "12"
      x               = "0"
      y               = "11"
    }
  }

  widget {
    timeseries_definition {
      legend_columns = ["value", "avg", "max", "min", "sum"]
      legend_layout  = "auto"

      request {
        display_type = "line"

        formula {
          formula_expression = "query1 / 60"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "avg:kyouhei.strava.segment.elapsed_time{$segment_name,$activity_name} by {segment_name}"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "dog_classic"
        }
      }

      request {
        display_type = "line"

        formula {
          formula_expression = "query0"
        }

        on_right_yaxis = "true"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query0"
            query       = "avg:kyouhei.strava.segment.average_heartrate{$segment_name,$activity_name} by {segment_name}"
          }
        }

        style {
          line_type  = "solid"
          line_width = "normal"
          palette    = "orange"
        }
      }

      show_legend = "true"
      title       = "Segments with HR testing"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "4"
      is_column_break = "false"
      width           = "6"
      x               = "0"
      y               = "15"
    }
  }

  widget {
    timeseries_definition {
      request {
        formula {
          formula_expression = "query1"
        }

        on_right_yaxis = "false"

        query {
          metric_query {
            data_source = "metrics"
            name        = "query1"
            query       = "avg:kyouhei.strava.token.life{*}.rollup(avg, 600)"
          }
        }

        style {
          palette = "dog_classic"
        }
      }

      show_legend = "false"
      title       = "avg:kyouhei.strava.token.life{*}.rollup(avg, 600)"
      title_align = "left"
      title_size  = "16"
    }

    widget_layout {
      height          = "4"
      is_column_break = "false"
      width           = "5"
      x               = "6"
      y               = "15"
    }
  }
}
