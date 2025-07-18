;;; init.el --- Main initialization file for Emacs -*- lexical-binding: t; -*-

;; Bootstrap straight.el properly
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

;; UI Configuration
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(set-face-attribute 'default nil :family "JetBrainsMono Nerd Font Mono" :height 180)

;; General Settings
(electric-pair-mode 1)
(save-place-mode t)
(global-auto-revert-mode t)
(setq make-backup-files nil)

;; Indentation
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method nil)
(setq tab-width 4
      c-basic-offset tab-width)

;; Here should be dired


;; LSP performance tuning
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil)

;; Load external config files after everything is set up
(dolist (file '("auctex.el" "packages.el" "custom.el" "modeline.el" "org.el"))
  (let ((path (expand-file-name file user-emacs-directory)))
    (if (file-exists-p path)
        (condition-case err
            (load path)
          (error
           (message "⚠️ Error loading %s: %s" file err)))
      (message "⚠️ File not found: %s" file))))

(setq enable-local-eval t)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
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
