;;; auctex-config.el --- Complete AUCTeX configuration for Emacs

;;; Commentary:
;; This configuration sets up AUCTeX with SyncTeX support,
;; company completion, reftex, cdlatex, and Zathura as PDF viewer
;; with both forward and inverse search functionality.

;;; Code:

;; Basic packages
(use-package auctex-latexmk)
(use-package company-math)
(use-package company-auctex)
(use-package company-reftex)
(use-package cdlatex)

;; Start Emacs server for synctex inverse search
(server-start)

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
              ("C-c C-v" . my-view-tex-file)
              ("C-c C-g" . TeX-view) ;; Standard forward search
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
  ;; Basic AUCTeX configuration
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-output-dir ".")
  
  ;; SyncTeX configuration
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  
  ;; PDF viewer configuration (Zathura with SyncTeX support)
  (setq TeX-view-program-selection '((output-pdf "Zathura")))
  (setq TeX-view-program-list
        '(("Zathura" "zathura --synctex-editor-command 'emacsclient +%%{line} %%{input}' --synctex-forward %n:0:%b %o")))
  
  ;; Refresh buffer after compilation
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  
  ;; latexmk setup
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
      (start-process "zathura" nil "zathura" 
                    "--synctex-editor-command" "emacsclient +%{line} %{input}"
                    pdf-path)))
)

;; Load required TeX modules
(with-eval-after-load 'latex
  (require 'tex)
  (require 'tex-buf)
  (require 'tex-style)
  (require 'tex-site)
  (require 'tex-mik)
  (require 'font-latex)
  (require 'preview))

;; Custom function to set up LaTeX mode (define this if not already defined)
(defun try/latex-mode-setup ()
  "Custom setup for LaTeX mode."
  (setq-local company-backends
              (append '((company-math-symbols-latex
                         company-latex-commands
                         company-auctex-macros
                         company-auctex-environments
                         company-auctex-symbols
                         company-reftex-citations
                         company-reftex-labels))
                      company-backends)))

;; Make sure zathurarc is properly configured
;; Add this comment as a reminder to create ~/.config/zathura/zathurarc with:
;; set synctex true
;; set synctex-editor-command "emacsclient +%{line} %{input}"

(provide 'auctex)
;;; auctex-config.el ends here
