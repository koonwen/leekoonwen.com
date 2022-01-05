open Pagetypes
open Tyxml.Html

module ProjectsPage : PageSig = struct
  let page = Projects
  let filename = "projects.html"
  let proj_template name features description = ()
  let content = [
    div ~a:[a_class ["proj-box"]] [
      h3 [txt "Occupancy Monitor"];
      h3 [txt "C-Programming Language Exercises"]
    ]
  ]


end