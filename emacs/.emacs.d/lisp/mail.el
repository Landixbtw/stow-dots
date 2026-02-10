;;; mail.el --- Mail configuration -*- lexical-binding: t; -*-

(use-package mu4e
  :ensure nil
  ;; specific load-path only needed if installed via homebrew/source
  :load-path "/usr/local/share/emacs/site-lisp/mu4e/"
  :config
  ;; -- Basics --
  (setq mu4e-root-maildir "~/Mail"
        mu4e-get-mail-command "mbsync -a"
        mu4e-update-interval (* 10 60)
        mu4e-change-filenames-when-moving t)

  ;; -- Folders --
  ;; Verify these match your file system! Check `ls ~/Mail`
  (setq mu4e-drafts-folder "/[Gmail]/Drafts"
        mu4e-sent-folder   "/[Gmail]/Sent Mail"
        mu4e-refile-folder "/[Gmail]/All Mail"
        mu4e-trash-folder  "/[Gmail]/Trash")

  ;; -- Shortcuts --
  (setq mu4e-maildir-shortcuts
        '((:maildir "/Inbox"             :key ?i)
          (:maildir "/[Gmail]/Sent Mail" :key ?s)
          (:maildir "/[Gmail]/Trash"     :key ?t)
          (:maildir "/[Gmail]/Drafts"    :key ?d)
          (:maildir "/[Gmail]/All Mail"  :key ?a)))

  ;; -- Mailing List Standards --
  (setq message-cite-reply-above nil     ;; <--- CRITICAL: Bottom-posting
        mu4e-compose-format-flowed t     ;; Format=Flowed (Soft wrapping)
        message-signature nil))          ;; No signature is safer than a bad one

;; -- Identity --
(setq user-mail-address "owmlea@gmail.com"
      user-full-name    "Ole Wortmann")

;; -- Sending Mail (SMTP) --
(use-package smtpmail
  :ensure nil
  :config
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        smtpmail-stream-type 'starttls))
        ;; Note: Emacs will automatically look in ~/.authinfo for the password

(setq message-kill-buffer-on-exit t)

(setq mu4e-index-update-in-background t)
(setq mu4e-modeline-mode t)


(provide 'mail)

;;; mail.el ends here
