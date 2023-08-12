open Tyxml

let list_item url_s item_s =
  Html.(
    li
      [
        a
          ~a:
            [
              a_href url_s;
              a_class
                [
                  "block"; "py-2"; "pl-3"; "pr-4"; "text-gray-900";
                  "rounded hover:bg-gray-100"; "md:hover:bg-transparent";
                  "md:hover:text-blue-700"; "md:p-0";
                  "md:dark:hover:text-blue-500"; "dark:text-white";
                  "dark:hover:bg-gray-700"; "dark:hover:text-white";
                  "md:dark:hover:bg-transparent"; "dark:border-gray-700";
                ];
            ]
          [ txt item_s ];
      ])

let sections list_items =
  Html.(
    div
      ~a:
        [
          a_class
            [
              "m-8"; "items-center"; "justify-between"; "hidden"; "w-full";
              "md:flex"; "md:w-auto"; "md:order-1";
            ];
        ]
      [
        ul
          ~a:
            [
              a_class
                [
                  "flex"; "flex-col"; "p-4"; "md:p-0"; "mt-4"; "font-medium";
                  "border"; "border-gray-100"; "rounded-lg"; "bg-gray-50";
                  "md:flex-row"; "md:space-x-8"; "md:mt-0"; "md:border-0";
                  "md:bg-white"; "dark:bg-gray-800"; "md:dark:bg-gray-900";
                  "dark:border-gray-700";
                ];
            ]
          list_items;
      ])

let menu_burger =
  Html.(
    div
      ~a:
        [
          a_class
            [
              "max-w-screen-xl"; "flex"; "flex-wrap"; "items-center";
              "justify-center"; "mx-auto"; "p-4";
            ];
        ]
      [
        div
          ~a:[ a_class [ "flex"; "md:order-2" ] ]
          [
            button
              ~a:
                [
                  a_class
                    [
                      "inline-flex"; "items-center"; "p-2"; "text-sm";
                      "text-gray-500"; "rounded-lg"; "md:hidden";
                      "hover:bg-gray-100"; "focus:outline-none"; "focus:ring-2";
                      "focus:ring-gray-200"; "dark:text-gray-400";
                      "dark:hover:bg-gray-700"; "dark:focus:ring-gray-600";
                    ];
                ]
              [ span ~a:[ a_class [ "sr_only" ] ] [ txt "Open main menu" ] ];
          ];
      ])

let elem =
  Html.(
    nav
      ~a:
        [
          a_class
            [
              "bg-white"; "dark:bg-gray-900"; "sticky"; "w-full"; "z-20";
              "top-0"; "left-0"; "border-b"; "border-gray-200";
              "dark:border-gray-600";
            ];
        ]
      [ sections [ list_item "About" "#"; list_item "Resume" "#" ] ])
