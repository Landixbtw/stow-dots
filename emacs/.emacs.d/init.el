;;; init.el --- main initialization for emacs -*- lexical-binding: t; -*-

;; Bootstrap the package manager straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(add-to-list 'load-path user-emacs-directory)

(require 'packages)
;; (require 'auctex)
;; (require 'modeline)
(require 'org)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(use-package project
  :straight (:type built-in))



;; UI config
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)

(set-face-attribute 'default nil :family "CaskaydiaCove Nerd Font" :height 170)

(electric-pair-mode 1)
(save-place-mode t)
(global-auto-revert-mode t)
(setq make-backup-files nil)

;; indentation
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method nil)
(setq tab-width 4
      c-basic-offset tab-width)

;; LSP performance tuning
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil)


;; compilation buffer setup
;; t scroll constantly , 'first-error' would until first error.
(setq compilation-scroll-output t)
;; compilation window apears at bottom
(add-to-list 'display-buffer-alist
             '("\\*compilation\\*"
               (display-buffer-at-bottom)
               (window-height . 10) ; Set height to 10 lines
               (reusable-frames . t)))

<<<<<<< HEAD
(setq compilation-auto-jump-to-first-error t)

(global-font-lock-mode t)


;; (provide 'init)
=======
;; Disable the annoying bell sound
(setq ring-bell-function 'ignore)

;; Set the prefix for LSP commands to C-c l
;; to mimic nvim K C-c l h h
(setq lsp-keymap-prefix "C-c l")

(provide 'init)
>>>>>>> fa8f0e636b550fbec71864bbd2107e5077c7ee45
;;; init.el ends here
