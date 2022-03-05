open Pagetypes
open Tyxml.Html

module ProjectsPage : PageSig = struct
  let page = Projects
  let filename = "projects.html"
  let proj_template name features description = 
    [
      div ~a:[a_class ["proj-box"]] [
        span ~a:[a_class ["proj-header"]] [txt name];
        ul [
          li [ b [txt "Features: "]; txt features ];
          li [ b [txt "Description: "]; txt description ];
        ]
        (* span ~a:[a_class ["proj-header"]] [txt name];
           b [txt "Features: "]; p [txt features];
           b [txt "Description: "]; p [txt description]; *)
      ]
    ]

  let content = 
    proj_template "Occupancy Monitor" "Blah blah" "blah blah" @
    proj_template "C-Programming Exercises" "lsoafie" "fiewnf"

end