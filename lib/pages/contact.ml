open Pagetypes
open Tyxml.Html

module ContactPage : PageSig = struct 
  let page = Contact
  let filename = "contact.html"
  let form = 
    [
      p [
        txt "Any questions? Get in touch!"
      ];

      form ~a:[ a_action "/my-handling-form-page"; a_method `Post] [
        ul [
          li [
            label [txt "Name:" ];
            input ~a:[a_input_type `Text; a_id "name"; a_name "name"] ()
          ];
          li [
            label [txt "Email:" ];
            input ~a:[a_input_type `Email; a_id "email"; a_name "email"] ()
          ];
          li [
            label [txt "Message:" ];
            textarea ~a:[a_id "message"; a_name "message"] (txt "")
          ]
        ]
      ]
    ]
  let content = form
end