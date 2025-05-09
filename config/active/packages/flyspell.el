;; -*- lexical-binding: t; -*-
;;; FLYSPELL
(use-package flyspell-correct :after general evil evil-collection)

;; will fix this once we fix order of loads

  ;; :general
  ;; (:keymaps 'markdown-mode-map
  ;;  :states 'normal
	;;    "SPC a" 'flyspell-correct-at-point))
