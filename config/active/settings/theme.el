;; -*- lexical-binding: t; -*-
;; FONT
(setq default-frame-alist '((font . "JetBrainsMono NF 12")))

;;; THEME
;; (use-package nano-theme)
(use-package catppuccin-theme
  :init
  (load-theme 'catppuccin :noconfirm)
  (setq catppuccin-flavor 'frappe)
  (catppuccin-reload)
  )
