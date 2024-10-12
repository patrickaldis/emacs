(use-package lsp-mode
  :commands lsp
  :config
  (add-hook 'haskell-mode-hook #'lsp-deferred)
  (add-hook 'nix-mode-hook #'lsp-deferred)
  (add-hook 'haskell-literate-mode-hook #'lsp-deferred)
  (setq lsp-haskell-server-path "haskell-language-server")
  (setq gc-cons-threshold 1000000000)
  (setq read-process-output-max (* 1024 1024))
    (lsp-register-client
        (make-lsp-client :new-connection (lsp-stdio-connection "nixd")
                        :major-modes '(nix-mode)
                        :priority -1 
                        :server-id 'nixd))
)
(use-package lsp-ui
  :config
  (setq lsp-ui-doc-position 'at-point))
(use-package lsp-ivy)

;;; LANGUAGE PACKAGES
(use-package lsp-haskell)
(use-package nix-mode :config (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))
(use-package fish-mode)
