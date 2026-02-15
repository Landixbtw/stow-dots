;;; early-init.el --- Early Initialization -*- lexical-binding: t; -*-

;; Prevent package.el from loading before straight.el
(setq package-enable-at-startup nil)

;; Optional: Speed up startup by inhibiting some UI resizing
(setq frame-inhibit-implied-resize t)

(provide 'early-init)
