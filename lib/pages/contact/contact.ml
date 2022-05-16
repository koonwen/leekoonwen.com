open Shared.Pagetypes
open Tyxml.Html

module ContactPage : PageSig = struct
  let page = Contact
  let filename = "contact.html"

  (* let form =
     [
       p [ txt "Any questions? Get in touch!" ];
       form
         ~a:[ a_action "/contact"; a_method `Post ]
         [
           ul
             [
               li
                 [
                   label [ txt "Name:" ];
                   input ~a:[ a_input_type `Text; a_id "name"; a_name "name" ] ();
                 ];
               li
                 [
                   label [ txt "Email:" ];
                   input
                     ~a:[ a_input_type `Email; a_id "email"; a_name "email" ]
                     ();
                 ];
               li
                 [
                   label [ txt "Message:" ];
                   textarea ~a:[ a_id "message"; a_name "message" ] (txt "");
                 ];
             ];
           input ~a:[ a_input_type `Submit; a_value "Submit" ] ();
         ];
     ] *)

  let form =
    [ p
        [ txt "Any questions? Get in touch!"
        ; br ()
        ; txt "Email me at: "
        ; b [ txt "koonwen@gmail.com" ]
        ]
    ]
  ;;

  let content = form

  (* Add post request handler *)
end

(* open Base

   let pop_list lst =
     match lst with
     | [] -> failwith "Empty List"
     | (_, s_lst) :: tl -> (String.concat ~sep:" " s_lst, tl)

   let post_contact_handler req =
     let open Opium in
     let open Lwt in
     Request.to_urlencoded req >>= fun ls ->
     Logs.debug (fun m ->
         List.iter
           ~f:(fun (key, value) -> m "%s : %s" key (String.concat ~sep:" " value))
           ls);
     let name, t1 = pop_list ls in
     let email, t2 = pop_list t1 in
     let message, _ = pop_list t2 in
     return
     @@ Response.of_json
          (`Assoc
            [
              ("name", `String name);
              ("email", `String email);
              ("message", `String message);
            ]) *)
