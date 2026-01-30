;;; mail.el --- Mail configuration -*- lexical-binding: t; -*-

;; 1. Identity
(setq user-mail-address "owmlea@gmail.com"
      user-full-name  "Ole Wortmann")

;; 2. SMTP Settings
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type  'ssl)

(use-package mu4e
  :ensure nil
  :load-path "/usr/local/share/emacs/site-lisp/mu4e/"
  :config
  ;; -- Basics --
  (setq mu4e-change-filenames-when-moving t
        mu4e-update-interval (* 10 60)
        mu4e-get-mail-command "mbsync -a"
        mu4e-maildir "~/Mail")
  
  ;; -- Folders --
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
          (:maildir "/[Gmail]/All Mail"  :key ?a))))

(provide 'mail)

;;; mail.el ends here
