open Tyxml.Html

module Generator (P: Pagetypes.PageSig) = struct
  include P
  let html_ = Template.make_html P.page P.content
  let generate_html () =
    let file = open_out ("./static/"^P.filename) in
    let fmt = Format.formatter_of_out_channel file in
    Format.fprintf fmt "%a@." (pp ~indent:true ()) html_ ;
    close_out file
end

module A = Generator(About.AboutPage)
module P = Generator(Projects.ProjectsPage)
module CV = Generator(Cv.CVPage)
module C = Generator(Contact.ContactPage)

let generate_htmls () = 
  A.generate_html ();
  P.generate_html ();
  CV.generate_html ();
  C.generate_html ();