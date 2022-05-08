open Pagetypes
open Tyxml.Html

let python_sym =
  img ~src:"https://img.icons8.com/color/48/000000/python--v1.png" ~alt:"Python"
    ()

let tensor_flow_sym =
  img ~src:"https://img.icons8.com/color/48/000000/tensorflow.png"
    ~alt:"Tensor-flow" ()

let raspberry_pi_sym =
  img ~src:"https://img.icons8.com/color/48/000000/raspberry-pi.png" ~alt:"RPI"
    ()

let digital_ocean_sym =
  img
    ~src:
      "https://img.icons8.com/external-tal-revivo-color-tal-revivo/48/000000/external-digital-ocean-a-cloud-infrastructure-with-data-centers-worldwide-logo-color-tal-revivo.png"
    ~alt:"Digital Ocean" ()

let flask_sym =
  img ~src:"https://img.icons8.com/fluency/48/000000/flask.png" ~alt:"Flask" ()

let c_sym =
  img ~src:"https://img.icons8.com/color/48/000000/c-programming.png" ~alt:"C"
    ()

let java_sym =
  img ~src:"https://img.icons8.com/color/48/000000/java-coffee-cup-logo--v1.png"
    ~alt:"Java" ()

let linux_sym =
  img ~src:"https://img.icons8.com/color/48/000000/linux--v1.png" ~alt:"Linux"
    ()

let bash_sym =
  img ~src:"https://img.icons8.com/plasticine/48/000000/bash.png" ~alt:"BASH" ()

let ocaml_sym =
  img
    ~a:[ a_style "height: 48px" ]
    ~src:"symbols/OCaml_Logo.png" ~alt:"OCaml" ()

let html_sym =
  img ~src:"https://img.icons8.com/color/48/000000/html-5--v1.png" ~alt:"HTML"
    ()

let css_sym =
  img ~src:"https://img.icons8.com/color/48/000000/css3.png" ~alt:"CSS" ()

module ProjectsPage : PageSig = struct
  let page = Projects
  let filename = "projects.html"

  let proj_template ?(image = "?") ~name ~features ~description () =
    div
      ~a:[ a_class [ "proj-box" ] ]
      [
        div
          ~a:[ a_class [ "flexbox-item"; "flexbox-item-left" ] ]
          [ img ~a:[ a_class [ "proj-img" ] ] ~src:image ~alt:name () ];
        div
          ~a:[ a_class [ "flexbox-item"; "flexbox-item-right" ] ]
          ([
             h2 ~a:[ a_class [ "proj-name" ] ] [ txt name ];
             h3 [ txt "Features" ];
           ]
          @ features
          @ [ h3 [ txt "Description" ]; txt description ]);
      ]

  (*TODO Add blog post page and github links *)
  let content =
    [
      proj_template ~image:"/projects/leekoonwen.com.png" ~name:"leekoonwen.me"
        ~features:[ ocaml_sym; html_sym; css_sym ]
        ~description:
          "This website! I wrote and am currently developing it in pure OCaml \
           (my favourite language!) using the Tyxml and the Opium web \
           framework. Hence also the cheeky recusive photo."
        ();
      proj_template ~image:"/projects/YNC-Gym-Counter.png"
        ~name:"Occupancy Monitor"
        ~features:
          [
            python_sym;
            flask_sym;
            tensor_flow_sym;
            raspberry_pi_sym;
            digital_ocean_sym;
          ]
        ~description:
          "A real-time capacity monitoring system for my university's fitness \
           center. Person detection powered by tensor-flow's computer vision \
           algorithms running on a Raspberry Pi4. Data pushed to the cloud and \
           publically available on flask webpage or via telegram-bot"
        ();
      proj_template ~image:"/projects/LFS.png"
        ~name:"LinuxFromScratch on RaspberryPi4"
        ~features:[ linux_sym; bash_sym; raspberry_pi_sym ]
        ~description:
          "Building a custom minimal Linux operating system for my Raspberry \
           Pi4. Involved building packages from source, cross-compilation, \
           command-line wizardry, long nights and frustration..."
        ();
      proj_template ~image:"/projects/C-Programming-Language.jpg"
        ~name:"C-Programming Exercises" ~features:[ c_sym ]
        ~description:
          "A Comprehemsive Repo containing my exercise solutions for The C \
           Programming Language (by Brian Kernighan and Dennis Ritchie). In \
           addition it contains my notes pertaining to each chapter that I \
           find useful"
        ();
      proj_template ~image:"/projects/SpaceFoosball.png" ~name:"Space Foosball"
        ~features:[ java_sym ]
        ~description:
          "A multiplayer game over wifi written in Java. Built as part of a \
           software engineering class project with 3 other team members."
        ();
    ]
end
