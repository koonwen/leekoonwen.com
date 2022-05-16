open Shared
open Tyxml.Html

module Generator (P : Pagetypes.PageSig) = struct
  include P

  let html_ = Template.make_html P.page P.content

  let generate_html () =
    let file = open_out ("./static/" ^ P.filename) in
    let fmt = Format.formatter_of_out_channel file in
    Format.fprintf fmt "%a@." (pp ~indent:true ()) html_;
    close_out file
  ;;
end

module AboutPage = Generator (About.AboutPage)
module ProjectPage = Generator (Projects.ProjectsPage)
module CV = Generator (Cv.CvPage)
module Contact = Generator (Contact.ContactPage)

let generate_htmls () =
  AboutPage.generate_html ();
  ProjectPage.generate_html ();
  CV.generate_html ();
  Contact.generate_html ()
;;
