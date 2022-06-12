open Config
open Letters

let config =
  let open Email_cfg in
  Config.make
    ~username:email_cfg.username
    ~password:email_cfg.password
    ~hostname:email_cfg.hostname
    ~with_starttls:true
;;

let subject_template from = Printf.sprintf "[leekoonwen.me] Contacted by: %s" from
let body_template message = Plain message
let recipients = [ To "koonwen@gmail.com" ]

let try_send ~from ~message =
  let subject = subject_template from in
  let body = body_template message in
  match build_email ~from ~recipients ~subject ~body with
  | Ok message -> send ~config ~sender:"koonwen@gmail.com" ~recipients ~message
  | Error e -> failwith e
;;

(* let%test "test_email" =
  Lwt_main.run @@ try_send ~from:"test@gmail.com" ~message:"Hello world";
  true
;; *)
