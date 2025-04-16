;; FONT
(setq default-frame-alist '((font . "JetBrainsMono NF 12")))

;; SCROLLING
(pixel-scroll-precision-mode 0)
(setq scroll-conservatively 101)

;;; HIGHLIGHT LINES
(global-hl-line-mode 1) 
(set-default 'truncate-lines 0) 
(defalias 'yes-or-no-p 'y-or-n-p)

;; HIDE UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;;; THEME
(use-package catppuccin-theme
  :init
  (load-theme 'catppuccin :noconfirm)
  (setq catppuccin-flavor 'frappe)
  (catppuccin-reload)
  )

;;; ENABLE NERD ICONS
(use-package nerd-icons
  :config
  (setq nerd-icons-color-icons t)
  (setq nerd-icons-font-family "JetBrainsMono NF"))

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

;;; MODELINE
(use-package doom-modeline
  :init
  (setq doom-modeline-height 40)
  (setq doom-modeline-major-mode-color-icon t)
  :config
  (doom-modeline-mode 1)
)


