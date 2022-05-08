(lang dune 2.9)

(name website)

(generate_opam_files true)

(source
 (github koonwen/leekoonwen.com))

(license ISC)

(authors "Lee Koon Wen")

(maintainers "Lee Koon Wen")

(package
 (name website)
 (synopsis "My personal website/blog unneccesarilly written in pure OCaml")
 (depends
  (ocaml
   (>= 4.13.0))
  core
  opium
  (utop :dev)
  (merlin :dev)
  (ocamlformat :dev)
  (ocp-indent :dev)))
