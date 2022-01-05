open Opium
module R = Routes
module L = Logger
module V = View

let _ =
  L.set_logger ();
  V.generate_htmls ();
  App.empty 
  |> App.cmd_name "OCaml Server"
  |> App.middleware R.static
  |> R.add_routes
  |> App.run_command
