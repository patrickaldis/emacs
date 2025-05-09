;; -*- lexical-binding: t; -*-
(setq auto-mode-alist
      (append '(("\\.tsx\\'"   . jtsx-tsx-mode)
                ("\\.ts\\'"    . typescript-ts-mode)
                ("\\.html"     . html-ts-mode)
                ("\\.json\\'"  . json-ts-mode)
                ("\\.hs\\'"    . haskell-ts-mode)) auto-mode-alist))
