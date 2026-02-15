;;; org.el --- Org Mode Configuration -*- lexical-binding: t; -*-

(require 'org)

;; --- 1. General Org Settings ---
(with-eval-after-load 'org
  (setq org-ellipsis " …")
  (setq org-hide-emphasis-markers t)
  (setq org-startup-folded nil)
  (setq org-pretty-entities t)
  (visual-line-mode 1))

;; --- 2. TODO Keywords & Colors ---
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "IN-PROGRESS")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight bold))
        ("NEXT" . (:foreground "blue" :weight bold))
        ("DONE" . (:foreground "forest green" :weight bold))
        ("WAITING" . (:foreground "orange" :weight bold))
        ("HOLD" . (:foreground "magenta" :weight bold))
        ("CANCELLED" . (:foreground "forest green" :weight bold))))

;; --- 3. Appearance (Modern & Fonts) ---

;; Custom Faces Function
(defun my/customize-org-faces ()
  (interactive)
  (set-face-attribute 'org-level-1 nil :height 1.25 :foreground "#BEA4DB")
  (set-face-attribute 'org-level-2 nil :height 1.15 :foreground "#A382FF" :slant 'italic)
  (set-face-attribute 'org-level-3 nil :height 1.1 :foreground "#5E65CC" :slant 'italic)
  (set-face-attribute 'org-document-title nil :foreground "DarkOrange3" :height 1.3)
  ;; Ensure fixed pitch for code blocks and tables
  (set-face-attribute 'fixed-pitch nil :family "Liberation Mono" :height 160)
  (set-face-attribute 'variable-pitch nil :family "Roboto Slab" :height 170))

(add-hook 'org-mode-hook 'my/customize-org-faces)

(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :config
  ;; Replace Superstar bullets (Headline stars)
  ;; You can use any icons here: "◉" "○" "◈" "◇"
  (setq org-modern-star '("◉" "○" "◈" "◇"))
  
  ;; Replace Superstar item bullets (Lists)
  (setq org-modern-list 
        '((?* . "•")
          (?+ . "◦")
          (?- . "–")))

  (setq org-modern-block-name t) 
  
  ;; Styling the Quote block
  (set-face-attribute 'org-modern-symbol nil :family "Liberation Mono")
  (set-face-attribute 'org-quote nil
                      :inherit 'variable-pitch
                      :slant 'italic
                      :foreground "#9ca0a4" 
                      :background "#282c34"
                      :extend t))

;; --- 4. Math & LaTeX ---
(with-eval-after-load 'org
  (setq org-preview-latex-default-process 'dvisvgm)
  
  (when (boundp 'org-format-latex-options)
    (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5)))

  (add-hook 'org-mode-hook #'turn-on-cdlatex)
  (add-hook 'org-mode-hook #'org-fragtog-mode))

(use-package cdlatex :straight t)

;; --- 5. Citations (Citar) ---
(use-package citar
  :after org
  :custom
  (citar-bibliography '("~/ref.bib"))
  (citar-library-paths '("~/papers"))
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup))

;; --- 6. Org Roam (The Brain) ---
(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/org-roam"))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-db-autosync-mode)
  
  ;; Capture Templates
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+TITLE: ${title}\n#+DATE: %U\n#+FILETAGS: \n#+STARTUP: latexpreview inlineimages\n\n")
           :unnarrowed t))))

;; --- 7. Images ---
(use-package org-download
  :hook (dired-mode . org-download-enable)
  :config
  (setq org-download-image-dir "~/org-roam/images"))

(setq-default flycheck-disabled-checkers '(org-lint))

(provide 'org-config)
;;; org.el ends here
