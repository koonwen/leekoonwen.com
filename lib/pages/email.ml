open Letters

let conf =
  Config.make ~username:"myuser" ~password:"mypasswd"
    ~hostname:"smtp.ethereal.email" ~with_starttls:true

let email =
  let sender = "leekoonwen.com" in
  let recipients = [ To "koonwen@gmail.com"; Cc ""; Bcc "" ] in
  let subject = "Contact form: from leekoonwen.com" in
  let body =
    Plain
      {|
Hi there,

This is a test email from https://github.com/oxidizing/letters

Regards,
The Letters team
|}
  in
  build_email ~from:sender ~recipients ~subject ~body
