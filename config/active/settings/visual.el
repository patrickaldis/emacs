;; -*- lexical-binding: t; -*-
;; HIDE UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; SCROLLING
(pixel-scroll-precision-mode 0)
(setq scroll-conservatively 101)

;;; HIGHLIGHT LINES
(global-hl-line-mode 1) 
(set-default 'truncate-lines 0)

;;; DISPLAY LINE NUMBERS EVERYWHERE
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;; USE Y or N
(defalias 'yes-or-no-p 'y-or-n-p)

