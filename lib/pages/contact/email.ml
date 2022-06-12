open Letters

module Email_cfg = struct
  type email_cfg =
    { username : string
    ; password : string
    ; hostname : string
    }

  let json = Yojson.Basic.from_file ~fname:"../../../err.log" "../../../secret.json"

  let email_cfg =
    let open Yojson.Basic.Util in
    { username = json |> member "username" |> to_string
    ; password = json |> member "password" |> to_string
    ; hostname = json |> member "hostname" |> to_string
    }
  ;;
end

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

let try_send from message =
  let subject = subject_template from in
  let body = body_template message in
  match build_email ~from ~recipients ~subject ~body with
  | Ok message -> send ~config ~sender:"koonwen@gmail.com" ~recipients ~message
  | Error e -> failwith e
;;

let%test "test secret env config" =
  let open Email_cfg in
  email_cfg.hostname != "" && email_cfg.username != "" && email_cfg.password != ""
;;

let%test "test_email" =
  Lwt_main.run @@ try_send "test@gmail.com" "Hello world";
  true
;;
