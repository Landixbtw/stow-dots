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
		TeX-view-program-list '(("Zathura" "zathura --synctex-forward %n:0:%b %o"))
		TeX-source-correlate-start-server t)          ;; to have the buffer refresh after compilation,
          ;; very important so that PDFView refesh itself after comilation
          (add-hook 'TeX-after-compilation-finished-functions
                      #'TeX-revert-document-buffer)

          ;; latexmk
          (require 'auctex-latexmk)
          (auctex-latexmk-setup)
          (setq auctex-latexmk-inherit-TeX-PDF-mode t)
	  )
(provide 'auctex)
;;; auctex.el ends here
