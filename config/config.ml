module Email_cfg = struct
  type email_cfg =
    { username : string
    ; password : string
    ; hostname : string
    }

  let json =
    let pwd = Sys.getenv "PWD" in
    let path = pwd ^ "/config/secret.json" in
    Yojson.Basic.from_file path
  ;;

  let email_cfg =
    let open Yojson.Basic.Util in
    { username = json |> member "username" |> to_string
    ; password = json |> member "password" |> to_string
    ; hostname = json |> member "hostname" |> to_string
    }
  ;;
end

let%test "test secret env config" =
  let open Email_cfg in
  email_cfg.hostname != "" && email_cfg.username != "" && email_cfg.password != ""
;;