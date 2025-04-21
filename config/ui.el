;; FONT
(setq default-frame-alist '((font . "JetBrainsMono NF 12")))

;; SCROLLING
(pixel-scroll-precision-mode 0)
(setq scroll-conservatively 101)

;;; HIGHLIGHT LINES
(global-hl-line-mode 1) 
(set-default 'truncate-lines 0) 
(defalias 'yes-or-no-p 'y-or-n-p)

;;; TABS
(setq-default tab-width 4)         ;; Set tab width to 4 spaces
(setq-default indent-tabs-mode nil) ;; Use spaces instead of tabs

;;; WHITESPACE
(add-hook 'prog-mode-hook #'whitespace-mode)
(setq whitespace-style '(face space-mark tab-mark))

(defvar my-space-re "\\( +\\)" "regexp to match space")
(defvar my-tab-re "\\(\11+\\)" "regexp to match tab")

(defun foo ()
  "..."
  (font-lock-add-keywords
   nil
   `((,my-space-re (1 'whitespace-space t))
     (,my-tab-re (1 'whitespace-space t)))               ; indenting spaces
   'APPEND))

(add-hook 'whitespace-mode-hook 'foo)

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

;;; DIRED
(use-package nerd-icons-dired
  :after nerd-icons
  :hook
  (dired-mode . nerd-icons-dired-mode))
(use-package diredfl
  :config (diredfl-global-mode))

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

;;; LIGATURES
;; Enable ligature support
(use-package ligature
  :config
 (when (fboundp 'ligature-set-ligatures)
  (require 'ligature)

  ;; Enable ligatures in all programming modes
  (ligature-set-ligatures 'prog-mode
    '("www" "**" "***" "|||" "-->" "->" "->>" "<-" "<--" "<=>" "=>" "==>" "===" "!=" "==" "===" "++" "+++"
      "::" ":::" "<>" "<<<" ">>>" "<|" "<|>" "|>" "!!" "&&" "||" ">=" "<=" ">>" "<<" "++" "--"))

  ;; You can also enable all supported ligatures by your font:
  (ligature-set-ligatures t '("..."))

  (global-ligature-mode t)) ;; Enable ligatures in all programming modes
 )

