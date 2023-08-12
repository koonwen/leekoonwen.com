let page req =
  let open Dream_html in
  let open HTML in
  html
    [ lang "en" ]
    [
      head
        [ charset "UTF-8" ]
        [
          link [ href "/assets/output.css"; rel "stylesheet" ];
          link [ href "https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css"; rel "stylesheet" ];
          script [ src "https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.js" ] ""; title [] "Dream-html";
        ];
      body []
        [
          h1 [] [ txt "Dream-html" ]; p [] [ txt "Is cool!" ];
          form
            [ method_ `POST; action "/feedback" ]
            [
              (* Integrated with Dream's CSRF token generation *) csrf_tag req;
              label [ for_ "what-you-think" ] [ txt "Tell us what you think!" ];
              input [ name "what-you-think"; id "what-you-think" ]; input [ type_ "submit"; value "Send" ];
            ];
        ];
    ]

(* Integrated with Dream response *)
let handler req = Dream_html.respond (page req)
