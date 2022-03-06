open Pagetypes
open Tyxml.Html

(* Change this to raw html and provide downloadable pdf *)

module CVPage : PageSig = struct
  let page = CV
  let filename = "cv.html"
  let content = [ embed ~a:[ a_class [ "cv" ]; a_src "Resume.pdf" ] () ]
end