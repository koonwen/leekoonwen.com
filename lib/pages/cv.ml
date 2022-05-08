open Pagetypes
open Tyxml.Html

(* Change this to raw html and provide downloadable pdf *)

module CVPage : PageSig = struct
  let page = CV
  let filename = "cv.html"

  let content =
    [
      iframe
        ~a:
          [
            a_class [ "cv" ];
            a_src
              "https://docs.google.com/document/d/e/2PACX-1vS9v-SZcME_d649e_1rbIesO1OGwfIv8TPfPJqPwRDV53XB1CgODZjLwSj32t9d3dtlaxL0KJtd8x0m/pub?embedded=true";
          ]
        [];
    ]
end