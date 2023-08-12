let about _req =
  Dream.html Frontend.Templates.index

let () =
  Dream.run ~error_handler:Dream.debug_error_handler
  @@ Dream.logger
  @@ Dream.router [ 
    Dream.get "/" about;
    Dream.get "/about" about;
    Dream.get "/resume" (Dream.from_filesystem "assets" "resume.pdf");
    Dream.get "/assets/**" (Dream.static "assets")
  ]
