open Pagetypes
open Tyxml.Html

module AboutPage : PageSig = struct
  let page = About
  let filename = "about.html"
  let content =
    [
      p ~a:[a_class ["about-para"]] [
        img ~a:[a_class ["cover-photo"]] ~src:"cover-photo.jpg" ~alt:"photo of me!" ()
        ; txt "I am currently a third year student at"
        ; a ~a:[a_href "https://www.yale-nus.edu.sg"] [ txt "Yale-NUS" ] 
        ; txt "college pursuing a major in
        computer science to improve my technical skills because I really enjoy building useful software. I hope to
        become an Operating System developer in the future but am also drawn to Applications, Networking, DevOps and
        Cloud developer type roles."
        ];
      p ~a:[a_class ["about-para"]] [
        txt "Having previously worked in various customer facing jobs, I feel that I have developed a
        strong set of interpersonal skills. I hope that this along with my keen interest in software development will make me a
        valuable team player in engineering teams."
      ]
    ]
end