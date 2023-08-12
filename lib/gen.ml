open Tyxml

let head =
  Html.(
    head
      (title (txt "About"))
      [
        meta ~a:[ a_charset "UTF-8" ] ();
        meta
          ~a:
            [
              a_name "viewport";
              a_content "width=device-width, initial=scale=1.0";
            ]
          ();
        link ~href:"../assets/output.css" ~rel:[ `Stylesheet ] ();
        link
          ~href:
            "https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css"
          ~rel:[ `Stylesheet ] ();
        script
          ~a:
            [
              a_src
                "https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.js";
            ]
          (txt "");
      ])

let body = Html.(body [Header.elem; Timeline.elem;])
let doc = Html.html head body
let () =
  let file_handle = open_out "index.html" in
  let fmt = Format.formatter_of_out_channel file_handle in
  Html.(pp () fmt doc)
