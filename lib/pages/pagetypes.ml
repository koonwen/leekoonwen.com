type page =
| About
| Projects
| CV
| Contact

let string_of_page = function
| About -> "About"
| Projects -> "Projects"
| CV -> "CV"
| Contact -> "Contact"

module type PageSig =
sig
  val page : page
  val filename: string
  val content : [> Html_types.flow5 ] Tyxml_html.elt list
  
end