open Opium
open Lwt.Syntax

let get_static_page path =
  Opium.Handler.serve (fun () ->
      let* page = Opium.Body.of_file path in
      match page with
      | Some p -> Lwt.return_ok p
      | None -> failwith "")
;;

let static = Middleware.static_unix ~local_path:"./static" ~uri_prefix:"/" ()
let about_handler = get_static_page "./static/about.html"
let project_handler = get_static_page "./static/projects.html"
let cv_handler = get_static_page "./static/cv.html"
let contact_handler = get_static_page "./static/contact.html"
let contact_callback_handler = get_static_page "./static/contact_callback.html"

let route_collection =
  [ App.get "/" about_handler
  ; App.get "/about" about_handler
  ; App.get "/projects" project_handler
  ; App.get "/cv" cv_handler
  ; App.get "/contact" contact_handler
  ; App.post "/contact" Contact.post_contact_handler
  ; App.get "/contact/sent" contact_callback_handler
  ]
;;

let add_routes app = Core.List.fold ~init:app ~f:( |> ) route_collection