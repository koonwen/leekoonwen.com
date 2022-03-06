
let log_level = Some Logs.Debug
let set_logger () =
  Logs.set_reporter (Logs_fmt.reporter ());
  Logs.set_level log_level
