;; Simplified mode line format
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                mode-line-mule-info
                mode-line-client
                mode-line-modified
                mode-line-remote
                mode-line-frame-identification
                mode-line-buffer-identification
                "   "
                mode-line-position
                (vc-mode vc-mode)
                "  "
                mode-line-modes
                mode-line-misc-info
                mode-line-end-spaces))

;; Hide all minor modes
(setq mode-line-modes
      (mapcar (lambda (elem)
                (pcase elem
                  (`(:propertize ("" minor-mode-alist . ,_) . ,_)
                   "")
                  (x x)))
              mode-line-modes))

;; Abbreviate major mode names
(setq mode-name-abbrev-alist
      '(("Fundamental" . "Fund")
        ("Emacs-Lisp" . "EL")
        ("JavaScript" . "JS")
        ("Python" . "Py")))

(add-hook 'after-change-major-mode-hook
          (lambda ()
            (when-let ((abbrev (cdr (assoc mode-name mode-name-abbrev-alist))))
              (setq mode-name abbrev))))

;; Compact position format
(setq mode-line-position 
      '((line-number-mode ("%l" (column-number-mode ":%c")))
        " " 
        (-3 "%p")))

;; Make the mode line thinner
(set-face-attribute 'mode-line nil :height 0.9 :box nil)
(set-face-attribute 'mode-line-inactive nil :height 0.9 :box nil)

(provide 'modeline)
;; modeline.el ends here
