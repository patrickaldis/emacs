(use-package lsp-mode
  :commands lsp
  :config
  (add-hook 'nix-mode-hook #'lsp-deferred)
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
(use-package nix-mode :config (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))
(use-package fish-mode)
;; (use-package web-mode
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))
(use-package haskell-ts-mode
  :config
   (add-to-list 'auto-mode-alist '("\.hs" . haskell-ts-mode))
  )
(add-to-list 'auto-mode-alist '("\.rs" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\.html" . html-ts-mode))
(straight-use-package '(evil-ts :type git :host github :repo "foxfriday/evil-ts"))
