open Shared.Pagetypes
open Tyxml.Html

module AboutPage : PageSig = struct
  let page = About
  let filename = "about.html"

  let content =
    [ img ~a:[ a_class [ "cover-photo" ] ] ~src:"cover-photo.jpg" ~alt:"photo of me!" ()
    ; div
        ~a:[ a_class [ "column-right" ] ]
        [ p [ txt "Hi there, welcome to my Page!" ]
        ; p
            [ txt
                "My name is Koonwen and I live in Singapore! I am a fourth year student \
                 at "
            ; a ~a:[ a_href "https://www.yale-nus.edu.sg" ] [ txt "Yale-NUS" ]
            ; txt "college pursuing a major in\n        computer science."
            ]
        ; p
            [ txt
                "I am passionate about programming and really enjoy building software. \
                 My favourite language is OCaml and try my best to contribute to open \
                 source. My interests are in Operating Systems, compilers and language \
                 design."
            ]
        ]
    ]
  ;;
end

let experimental_description =
  "let about =  in\n\
  \    let name = in\n\
  \    let nationality = in\n\
  \    let description = in\n\
  \    let work_experience = in\n\
  \    let aspirations =  in\n\
  \    let interests = in\n\
  \    foldleft f [about ; name; nationality; description; work_experience; aspirations; \
   interestes]\n\
  \    "
;;
