open Pagetypes
open Tyxml.Html

let head_template ~page:page =
  let title_ = "Koonwen -"^(string_of_page page) in
  head (title (txt title_))
  [ meta ~a:[ a_charset "utf-8" ] ()
  ; meta ~a:[ a_name "viewport"; a_content "width=device-width, initial-scale=1" ] ()
  ; meta ~a:[ a_name "theme-color"; a_content "#ffffff" ] ()
  ; link ~rel:[ `Stylesheet ] ~href:"styles.css" ()
  ; link ~rel:[ `Prefetch ] ~href:"https://fonts.googleapis.com" ()
  ; link ~rel:[ `Prefetch ] ~href:"https://fonts.gstatic.com" ~a:[a_crossorigin `Anonymous] ()
  ; link ~rel:[ `Stylesheet ] ~href:"https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" ()]

let navbar (selected:page) =
  let navtext_class page = if page = selected then "navtext-selected" else "navtext" in
  [
    nav ~a:[ a_class [ "navbar" ] ]
      [
        a ~a:[a_class [navtext_class About]; a_href "/about.html" ] [ txt "About" ];
        a ~a:[a_class [navtext_class Projects]; a_href "/projects.html" ] [ txt "Projects" ];
        a ~a:[a_class [navtext_class CV]; a_href "/cv.html" ] [ txt "CV" ];
        a ~a:[a_class [navtext_class Contact]; a_href "/contact.html" ] [ txt "Contact"];
      ];
  ]

let footer =
  [
    footer [
      table [
        tr [
          th ~a:[a_class ["th-name"]] [txt "Github:"];
          th ~a:[a_class ["th-link"]] [a ~a:[a_href "https://github.com/koonwen"] [txt "https://github.com/koonwen"]];
        ];
        tr ~a:[a_class ["th-name"]] [
          th ~a:[a_class ["th-name"]] [txt "Linkedin:"];
          th ~a:[a_class ["th-link"]] [a ~a:[a_href "https://www.linkedin.com/in/koonwen-lee-b349b1175/"] [txt "https://www.linkedin.com/in/koonwen-lee-b349b1175/"]]
        ];
      ]
    ]
  ]

(* Optional arguements cannot be last because OCaml supports partial application
, therefore we need the unit at the end to show that we want to call the function *)
let body_template ?(content = []) page =
  navbar page @
  [
    div ~a:[ a_class [ "container" ]]
    begin
      [ header [ txt @@ string_of_page page ] ] @ content
    end
  ] @ footer

let make_html page content =
  html 
  (head_template ~page)
  (body (body_template ~content page))