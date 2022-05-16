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
            [ txt "I am Koonwen from Singapore! I am currently a third year student at "
            ; a ~a:[ a_href "https://www.yale-nus.edu.sg" ] [ txt "Yale-NUS" ]
            ; txt
                "college pursuing a major in\n\
                \        computer science. I am passionate about programming and really \
                 enjoy building software. I am also an OCaml enthusiast and love open \
                 source. I'm on a quest to uncover the intricacies and complexities of \
                 computer systems. At the moment, I am deeply interested in Operating \
                 Systems because it is as low level as software gets (broadly speaking). \
                 I believe that a strong understanding of it is imperative to be good \
                 developer. I also I find the idea of software governing other software \
                 quite mindblowing. I am also taken by compilers and language design and \
                 hope to build tools that benefit other developers. In general, I like \
                 diving into the guts of systems to extract the secrets that they hold"
            ]
        ; p
            [ txt
                "Besides spending all day debugging, I enjoy Skiing and a \n\
                \                 competitive game of tennis. However, nothing comes \
                 close to beating a good conversation with a friend (Well... except of \
                 course successful compilation)."
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
