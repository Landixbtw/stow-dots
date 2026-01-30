;;; init.el: --- main initialization for emacs -*- lexical-binding: t; -*-

;; --- Bootstrap Straight.el ---
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

;; --- Load Paths & Packages ---
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'packages)
(require 'auctex)
;; (require 'modeline)
;; (require 'org)
(require 'mail)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; --- UI Config ---
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; FIX: Explicitly pass 1 to ensure this enables (do not leave empty)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(set-face-attribute 'default nil :family "CaskaydiaMono Nerd Font" :height 170)

;; --- Editor Behavior ---
(electric-pair-mode 1)
(save-place-mode t)
(global-auto-revert-mode t)
(setq make-backup-files nil)

;; Indentation
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method nil)
(setq tab-width 4
      c-basic-offset tab-width)

;; Performance Tuning (GC & Process)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil)

;; --- Compilation Buffer ---
(setq compilation-scroll-output t)
(add-to-list 'display-buffer-alist
             '("\\*compilation\\*"
               (display-buffer-at-bottom)
               (window-height . 10)
               (reusable-frames . t)))
(setq compilation-auto-jump-to-first-error t) 

;; Disable bell
(setq ring-bell-function 'ignore)


;; --- TRAMP & Remote (Cleaned for Eglot) ---

;; Enable TRAMP to find the environment
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;; Optimize TRAMP for heavy usage
(setq tramp-verbose 1)                        ; Keep logs quiet for speed
(setq remote-file-name-inhibit-cache nil)     ; Cache file properties
(setq vc-handled-backends '(Git))             ; Only check Git

;; Prevent Emacs from trying to use fancy lock files over Docker/Remote
(setq create-lockfiles nil)

;; Note: The specific `lsp-register-client` block was removed here.
;; Eglot generally handles remote connections automatically via TRAMP 
;; without needing manual client registration.

;; --- Projectile (Optional legacy support) ---
(with-eval-after-load 'projectile
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t))

(provide 'init)
;;; init.el ends here
