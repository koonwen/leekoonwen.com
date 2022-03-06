open Pagetypes
open Tyxml.Html

module AboutPage : PageSig = struct
  let page = About
  let filename = "about.html"

  let content =
    [
      img
        ~a:[ a_class [ "cover-photo" ] ]
        ~src:"cover-photo.jpg" ~alt:"photo of me!" ();
      div
        ~a:[ a_class [ "column-right" ] ]
        [
          p
            [
              txt "Currently a third year student at";
              a ~a:[ a_href "https://www.yale-nus.edu.sg" ] [ txt "Yale-NUS" ];
              txt
                "college pursuing a major in\n\
                \        computer science to improve my technical skills \
                 because I really enjoy building useful software. I hope to\n\
                \        become an Operating System developer in the future \
                 but am also drawn to Applications, Networking, DevOps and\n\
                \        Cloud developer type roles.";
            ];
          p
            [
              txt
                "Having previously worked in various customer facing jobs, I \
                 feel that I have developed a\n\
                \        strong set of interpersonal skills. I hope that this \
                 along with my keen interest in software development will make \
                 me a\n\
                \        valuable team player in engineering teams.";
            ];
        ];
    ]
end