open Shared.Pagetypes
open Tyxml.Html
open Symbols

module ProjectsPage : PageSig = struct
  let page = Projects
  let filename = "projects.html"

  let proj_template ?(image = "?") ~name ~features ~description () =
    div
      ~a:[ a_class [ "proj-box" ] ]
      [ div
          ~a:[ a_class [ "flexbox-item"; "flexbox-item-left" ] ]
          [ img ~a:[ a_class [ "proj-img" ] ] ~src:image ~alt:name () ]
      ; div
          ~a:[ a_class [ "flexbox-item"; "flexbox-item-right" ] ]
          ([ h2 ~a:[ a_class [ "proj-name" ] ] [ txt name ]; h3 [ txt "Features" ] ]
          @ features
          @ [ h3 [ txt "Description" ]; txt description ])
      ]
  ;;

  (*TODO Add blog post page and github links *)
  let content =
    [ proj_template
        ~image:"/projects/mirage-riot.png"
        ~name:"Mirage-RIOT TCPIP Stack"
        ~features:[ ocaml_sym; mirage_sym; riot_sym; c_sym ]
        ~description:
          "A hybrid TCPIP stack assembled by interfacing Mirage and RIOT-OS libraries. \
           To experiment if it's possible to use OCaml to write programs for memory \
           contstained IoT devices."
        ()
    ; proj_template
        ~image:"/projects/leekoonwen.com.png"
        ~name:"leekoonwen.me"
        ~features:[ ocaml_sym; html_sym; css_sym ]
        ~description:
          "This website! I wrote and am currently developing it in pure OCaml (my \
           favourite language!) using the Tyxml and the Opium web framework. Hence also \
           the cheeky recusive photo."
        ()
    ; proj_template
        ~image:"/projects/YNC-Gym-Counter.png"
        ~name:"Occupancy Monitor"
        ~features:
          [ python_sym; flask_sym; tensor_flow_sym; raspberry_pi_sym; digital_ocean_sym ]
        ~description:
          "A real-time capacity monitoring system for my university's fitness center. \
           Person detection powered by tensor-flow's computer vision algorithms running \
           on a Raspberry Pi4. Data pushed to the cloud and publically available on \
           flask webpage or via telegram-bot"
        ()
    ; proj_template
        ~image:"/projects/LFS.png"
        ~name:"LinuxFromScratch on RaspberryPi4"
        ~features:[ linux_sym; bash_sym; raspberry_pi_sym ]
        ~description:
          "Building a custom minimal Linux operating system for my Raspberry Pi4. \
           Involved building packages from source, cross-compilation, command-line \
           wizardry, long nights and frustration..."
        ()
    ; proj_template
        ~image:"/projects/C-Programming-Language.jpg"
        ~name:"C-Programming Exercises"
        ~features:[ c_sym ]
        ~description:
          "A Comprehemsive Repo containing my exercise solutions for The C Programming \
           Language (by Brian Kernighan and Dennis Ritchie). In addition it contains my \
           notes pertaining to each chapter that I find useful"
        ()
    ; proj_template
        ~image:"/projects/SpaceFoosball.png"
        ~name:"Space Foosball"
        ~features:[ java_sym ]
        ~description:
          "A multiplayer game over wifi written in Java. Built as part of a software \
           engineering class project with 3 other team members."
        ()
    ]
  ;;
end
