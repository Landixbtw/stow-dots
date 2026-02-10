;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("mathptmx" "") ("courier" "") ("inputenc" "utf8") ("fontenc" "T1") ("babel" "ngerman") ("lmodern" "") ("textcomp" "") ("csquotes" "babel" "german=quotes") ("geometry" "") ("fancyhdr" "") ("parskip" "") ("listings" "") ("xcolor" "") ("amsmath" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "babel"
    "lmodern"
    "textcomp"
    "csquotes"
    "geometry"
    "fancyhdr"
    "parskip"
    "listings"
    "xcolor"
    "amsmath"))
 :latex)

