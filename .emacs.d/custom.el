;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(package-selected-packages
   '(company dap-mode dash-functional evil flycheck gruber-darker-theme
	     helm-lsp helm-xref helpful magit marginalia projectile
	     vertico yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; make the modeline zoom with C-x-+ ...
(defadvice text-scale-increase (after update-modeline activate)
  "Also scale the mode line when text is scaled."
  (let ((height (expt text-scale-mode-step text-scale-mode-amount)))
    (set-face-attribute 'mode-line nil :height (* height (face-attribute 'default :height)))))

(defun try/TeX-command-save-buffer-and-run-all ()
    "Save the buffer and run TeX-command-run-all"
    (interactive)
    (let (TeX-save-query) (TeX-save-document (TeX-master-file)))
    (TeX-command-run-all nil))

;; copied ivy-bibtex and modified it to cite action
(defun try/ivy-bibtex-cite (&optional arg local-bib)
  "Search BibTeX entries using ivy.

With a prefix ARG the cache is invalidated and the bibliography
reread.

If LOCAL-BIB is non-nil, display that the BibTeX entries are read
from the local bibliography.  This is set internally by
`ivy-bibtex-with-local-bibliography'."
  (interactive "P")
  (when arg
    (bibtex-completion-clear-cache))
  (bibtex-completion-init)
  (let* ((candidates (bibtex-completion-candidates))
          (key (bibtex-completion-key-at-point))
          (preselect (and key
                          (cl-position-if (lambda (cand)
                                            (member (cons "=key=" key)
                                                    (cdr cand)))
                                          candidates))))
    (ivy-read (format "Insert citation %s: " (if local-bib " (local)" ""))
              candidates
              :preselect preselect
              :caller 'ivy-bibtex
              :history 'ivy-bibtex-history
              :action 'ivy-bibtex-insert-citation)))

(defun try/latex-mode-setup ()
  (require 'company-reftex)
        (turn-on-reftex)
        (require 'company-auctex)
        (require 'company-math)
(setq-local company-backends
      
    (append '(
                              (company-reftex-labels
                                company-reftex-citations)
              (company-math-symbols-unicode company-math-symbols-latex company-latex-commands)
              (company-auctex-macros company-auctex-symbols company-auctex-environments)
              company-ispell
              )
            company-backends)))


(defun try/counsel-insert-file-path ()
  "Insert relative file path using counsel minibuffer"
  (interactive)
  (unless (featurep 'counsel) (require 'counsel))
  (ivy-read "Insert filename: " 'read-file-name-internal
            :matcher #'counsel--find-file-matcher
            :action
            (lambda (x)
              (insert (file-relative-name x)))))

(provide 'custom)
;; custom.el ends here
