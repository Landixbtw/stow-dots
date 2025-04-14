   ;; latexmk
(use-package auctex-latexmk)
;; company
(use-package company-math)
(use-package company-auctex)
(use-package company-reftex)
;;  use cdlatex
(use-package cdlatex)
;; https://gist.github.com/saevarb/367d3266b3f302ecc896
;; https://piotr.is/2010/emacs-as-the-ultimate-latex-editor/
(use-package latex
  :straight auctex
  :ensure auctex
  :defer t
  :custom
  (olivetti-body-width 100)
  (cdlatex-simplify-sub-super-scripts nil)
  (reftex-default-bibliography
   '("~/ref.bib"))
  (bibtex-dialect 'biblatex)
  :mode
  ("\\.tex\\'" . latex-mode)
  :bind (:map LaTeX-mode-map
              ("C-c C-e" . cdlatex-environment)
              ("C-c C-v" . my-view-tex-file)  ;; Add custom viewing function binding
              )
  :hook
  (LaTeX-mode . olivetti-mode)
  (LaTeX-mode . TeX-PDF-mode)
  (LaTeX-mode . company-mode)
  (LaTeX-mode . flyspell-mode)
  (LaTeX-mode . flycheck-mode)
  (LaTeX-mode . LaTeX-math-mode)
  (LaTeX-mode . turn-on-reftex)
  (LaTeX-mode . TeX-source-correlate-mode)
  (LaTeX-mode . try/latex-mode-setup)
  (LaTeX-mode . turn-on-cdlatex)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq reftex-plug-into-AUCTeX t)
  ;; pdftools
  ;; https://emacs.stackexchange.com/questions/21755/use-pdfview-as-default-auctex-pdf-viewer#21764
  (setq TeX-view-program-selection '((output-pdf "Zathura"))
        TeX-view-program-list '(("Zathura" "cd %s && zathura --synctex-forward %n:0:%b %o"))
        TeX-source-correlate-start-server t)  ;; to have the buffer refresh after compilation,
  ;; very important so that PDFView refesh itself after comilation
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  (setq TeX-output-dir ".")
  ;; latexmk
  (require 'auctex-latexmk)
  (auctex-latexmk-setup)
  (setq auctex-latexmk-inherit-TeX-PDF-mode t)
  
  ;; Custom function to reliably view PDFs in multifile projects
  (defun my-view-tex-file ()
    "View the PDF corresponding to the master file of the current buffer."
    (interactive)
    (let* ((master-file (TeX-master-file))
           (master-dir (file-name-directory master-file))
           (pdf-file (concat (file-name-sans-extension 
                             (file-name-nondirectory master-file)) ".pdf"))
           (pdf-path (expand-file-name pdf-file master-dir)))
      (message "Opening PDF: %s" pdf-path)
      (start-process "zathura" nil "zathura" pdf-path)))
  )

;; Add this to your init file
(with-eval-after-load 'latex
  (require 'tex)
  (require 'tex-buf)
  (require 'tex-style)
  (require 'tex-site)
  (require 'tex-mik)
  (require 'font-latex)
  (require 'preview))

(provide 'auctex)
;;; auctex.el ends here
