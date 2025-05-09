;; -*- lexical-binding: t; -*-
;;; ENABLE NERD ICONS
(use-package nerd-icons
  :config
  (setq nerd-icons-color-icons t)
  (setq nerd-icons-font-family "JetBrainsMono NF"))

;;; DIRED
(use-package nerd-icons-dired
  :after nerd-icons
  :hook
  (dired-mode . nerd-icons-dired-mode))
(use-package diredfl
  :config (diredfl-global-mode))
