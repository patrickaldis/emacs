;; -*- lexical-binding: t; -*-
;;; DASHBOARD
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))

  (setq dashboard-items '((projects . 5) (recents . 5)))
  (setq dashboard-projects-backend 'project-el)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-file-icons t)
)
