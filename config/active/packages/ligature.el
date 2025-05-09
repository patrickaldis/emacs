;; -*- lexical-binding: t; -*-
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
