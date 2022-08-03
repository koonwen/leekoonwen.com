open Shared.Pagetypes
open Tyxml.Html

module ContactPage : PageSig = struct
  let page = Contact
  let filename = "contact.html"

  let form =
    [ p [ txt "Any questions? Get in touch!" ]
    ; form
        ~a:[ a_action "/contact"; a_method `Post ]
        [ ul
            [ li
                [ label [ txt "Name:" ]
                ; input
                    ~a:[ a_input_type `Text; a_id "name"; a_name "name"; a_required () ]
                    ()
                ]
            ; li
                [ label [ txt "Email:" ]
                ; input
                    ~a:
                      [ a_input_type `Email; a_id "email"; a_name "email"; a_required () ]
                    ()
                ]
            ; li
                [ label [ txt "Message:" ]
                ; textarea ~a:[ a_id "message"; a_name "message"; a_required () ] (txt "")
                ]
            ]
        ; input
            ~a:[ a_class [ "submit-button" ]; a_input_type `Submit; a_value "Submit" ]
            ()
        ]
    ]
  ;;

  let content = form

  (* Add post request handler *)
end

let[@warning "-26"] post_contact_handler req =
  let open Base in
  let open Opium in
  let open Lwt.Syntax in
  let+ raw_form_data = Request.to_urlencoded req in
  let parsed_form_data =
    List.map ~f:(fun (k, l) -> k, String.concat ~sep:" " l) raw_form_data
  in
  let map = Map.of_alist_exn (module String) parsed_form_data in
  let name = Map.find_exn map "name" in
  let email = Map.find_exn map "email" in
  let message = Map.find_exn map "message" in
  (* let s_l =
    List.sexp_of_t (fun (k, v) -> Sexp.List [ Sexp.Atom k; Sexp.Atom v ]) parsed_form_data
  in
    Logs.debug (fun m -> m "%s\n" (Sexp.to_string s_l)); *)
  Lwt.async (fun () -> Email.try_send ~from:email ~message);
  Response.redirect_to "/submitted.html"
;;

module SubmitPage : PageSig = struct
  include ContactPage

  let filename = "submitted.html"
  let content = [ h2 [ txt "Sent! Thanks for your email!" ] ]
end