;;; init.el: --- main initialization for emacs -*- lexical-binding: t; -*-

;;; Code:

;; --- 1. Bootstrap Straight.el ---
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(load (expand-file-name "lisp/packages.el" user-emacs-directory))

(require 'org-config)
;; Load other modules (These work via 'require' because we added 'lisp' to load-path)
(require 'mail)
(require 'auctex)

;; --- 3. Global UI & Behavior ---
(setq use-dialog-box nil)
(setq x-gtk-use-system-tooltips nil)
(setq ring-bell-function 'ignore)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(set-face-attribute 'default nil :family "Liberation Mono" :height 170)

(electric-pair-mode 1)
(save-place-mode t)
(global-auto-revert-mode t)
(setq make-backup-files nil)

(setq-default indent-tabs-mode t)
(setq tab-width 4
      c-basic-offset tab-width)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil)

;; --- 4. TRAMP & Compilation ---
(setq compilation-scroll-output t)
(add-to-list 'display-buffer-alist
             '("\\*compilation\\*"
               (display-buffer-at-bottom)
               (window-height . 10)
               (reusable-frames . t)))

(with-eval-after-load 'tramp
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (setq tramp-verbose 1)
  (setq remote-file-name-inhibit-cache nil)
  (setq vc-handled-backends '(Git)))

(setq create-lockfiles nil)

(with-eval-after-load 'projectile
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t))


;; (setq org-fontify-quote-and-verse-blocks t)

;; ;; Add a left margin to quote blocks specifically
;; (add-hook 'org-mode-hook (lambda ()
;;   (set-face-attribute 'org-quote nil :prefix "  ")))

(provide 'init)
;;; init.el ends here
