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

let flask_sym =
  img ~src:"https://img.icons8.com/fluency/48/000000/flask.png" ~alt:"Flask" ()

let c_sym =
  img ~src:"https://img.icons8.com/color/48/000000/c-programming.png" ~alt:"C"
    ()

let digital_ocean_sym =
  img
    ~src:
      "https://img.icons8.com/external-tal-revivo-color-tal-revivo/48/000000/external-digital-ocean-a-cloud-infrastructure-with-data-centers-worldwide-logo-color-tal-revivo.png"
    ~alt:"Digital Ocean" ()

module ProjectsPage : PageSig = struct
  let page = Projects
  let filename = "projects.html"

  let proj_template ?(image = "?") ~name ~features ~description () =
    [
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
        ];
    ]

  (* Make features just symbols *)

  let content =
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
      ()
    @ proj_template ~image:"/projects/C-Programming-Language.png"
        ~name:"C-Programming Exercises" ~features:[ c_sym ]
        ~description:
          "A Comprehemsive Repo containing my exercise solutions for The C \
           Programming Language (by Brian Kernighan and Dennis Ritchie). In \
           addition it contains my notes pertaining to each chapter that I \
           find useful"
        ()
end