open Tyxml

let descr_f text =
  Html.(
    p
      ~a:
        [
          a_class
            [
              "mb-4 text-base";
              "font-normal";
              "text-gray-500";
              "dark:text-gbray-400";
            ];
        ]
      [ txt text ])

let title_f text =
  Html.(
    h3
      ~a:
        [
          a_class
            [ "text-lg"; "font-semibold"; "text-gray-900"; "dark:text-white" ];
        ]
      [ txt text ])

let date_f date =
  Html.(
    time
      ~a:
        [
          a_class
            [
              "mb-1";
              "text-sm font-normal";
              "leading-none";
              "text-gray-400";
              "dark:text-gray-500";
            ];
        ]
      [ txt date ])

let box title_s descr_s date_s =
  Html.(
    div
      ~a:
        [
          a_class
            [
              "absolute";
              "w-3";
              "h-3";
              "bg-gray-200";
              "rounded-full";
              "mt-1.5";
              "-left-1.5";
              "border";
              "border-white";
              "dark:border-gray-900";
              "dark:bg-gray-700";
            ];
        ]
      [ title_f title_s; descr_f descr_s; date_f date_s ])

let item title_s descr_s date_s =
  Html.(li ~a:[ a_class [] ] [ box title_s descr_s date_s ])

let place_holder = item "Some title" "Some descr" "Some date"

let elem =
  Html.(
    ol
      ~a:
        [
          a_class
            [
              "relative"; "border-l"; "border-gray-200"; "dark:border-gray-700";
            ];
        ]
      [ place_holder; place_holder; place_holder ])
