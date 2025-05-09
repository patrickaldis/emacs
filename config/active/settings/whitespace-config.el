;; -*- lexical-binding: t; -*-
;;; WHITESPACE
(add-hook 'prog-mode-hook #'whitespace-mode)
(setq whitespace-style '(face space-mark tab-mark))

(defvar my-space-re "\\( +\\)" "regexp to match space")
(defvar my-tab-re "\\(\11+\\)" "regexp to match tab")

(defun my/whitespace-render ()
  "..."
  (font-lock-add-keywords
   nil
   `((,my-space-re (1 'whitespace-space t))
     (,my-tab-re (1 'whitespace-space t)))               ; indenting spaces
   'APPEND))

(add-hook 'whitespace-mode-hook 'my/whitespace-render)
