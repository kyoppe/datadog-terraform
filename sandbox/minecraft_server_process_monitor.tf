resource "datadog_monitor" "tfer--monitor_130389149" {
  escalation_message = ""
  evaluation_delay   = "0"
  include_tags       = "false"
  locked             = "false"
  message            = "Minecraft Server process is down. Please go check;\n\n- http://160.251.176.148:60000/\n- `ssh root@minecraft.boxhouse120.com`\n\n  \n@kyouhei@gmail.com @slack-monitoring"

  monitor_thresholds {
    critical = "1"
  }

  name                 = "Minecraft Server Process Monitor [Terraform Managed]"
  new_group_delay      = "0"
  new_host_delay       = "300"
  no_data_timeframe    = "0"
  notify_audit         = "false"
  notify_no_data       = "false"
  priority             = "0"
  query                = "processes('java server minecraft').over('command:nogui,host:vm-37ccf7ab-68').rollup('count').last('5m') < 1"
  renotify_interval    = "0"
  renotify_occurrences = "0"
  require_full_window  = "false"
  tags                 = ["service:minecraft","terraform_managed"]
  timeout_h            = "0"
  type                 = "process alert"
}
