let () =
  Dream.run ~error_handler:Dream.debug_error_handler
  @@ Dream.logger
  @@ Dream.router [ Dream.get "/**"  (Dream.static ".")]
