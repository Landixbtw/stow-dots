 ;;; mail.el --- everything to do with mail -*- lexical-binding: t; -*-

;; this is only setup for one context
(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type  'ssl)

(setq message-send-mail-function 'smtpmail-send-it)

(provide 'mail) ;; mail.el ends here
