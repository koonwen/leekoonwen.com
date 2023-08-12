open Tyxml

let github url = Html.(a ~a:[ a_href url ] [ txt "link" ])
let pic path = Html.(a ~a:[ a_href path ] [ txt "photo" ])
let description text = Html.(p [ txt text ])

let elem () =
  Html.(
    div
      ~a:
        [
          a_class
            [
              "grid";
              "grid-cols";
              "place-items-center";
              "gap-12";
              "place-content-between";
              "bg-blue-500";
            ];
        ]
      [ pic "some_path"; description "Loren ipsum"; github "url" ])
