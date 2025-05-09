;; -*- lexical-binding: t; -*-
(use-package eglot
  :config
  (setq my-server-programs
        '((haskell-ts-mode . ("haskell-language-server" "--lsp"))
          (nix-mode        . ("nixd"))
          (jtsx-tsx-mode   . ("~/lspx" "--lsp" "yarn exec typescript-language-server --stdio" "--lsp" "yarn exec tailwindcss-language-server --stdio"))))
  (setq eglot-server-programs
        (append my-server-programs eglot-server-programs))
  (dolist (progs my-server-programs)
    (add-hook (intern (concat (symbol-name (car progs)) "-hook")) #'eglot-ensure))
  :bind (:map eglot-mode-map
              ([mouse-1] . #'my/eldoc-box-show-doc-at-point))
  ;; (define-key eglot-mode-map [mouse-1] #'my/eldoc-box-show-doc-at-point)
)

(defun my/eldoc-box-show-doc-at-point (event)
  "Show eldoc-box help at point after a short delay to give Eldoc time to update."
  (interactive "e")
  (mouse-set-point event)
  (eldoc-box-reset-frame)
  (run-with-timer
   0.2 nil
   (lambda ()
     (eldoc-box-help-at-point))))

(use-package eldoc-box
  :custom
  (eldoc-idle-delay 0.2))

