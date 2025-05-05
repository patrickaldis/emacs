;; (use-package lsp-mode  -*- lexical-binding: t; -*-
;;   :commands lsp
;;   :config
;;   (add-hook 'nix-mode-hook #'lsp-deferred)
;;   (setq gc-cons-threshold 1000000000)
;;   (setq read-process-output-max (* 1024 1024))
;;     (lsp-register-client
;;         (make-lsp-client :new-connection (lsp-stdio-connection "nixd")
;;                         :major-modes '(nix-mode)
;;                         :priority -1 
;;                         :server-id 'nixd))
;; )
;; (use-package lsp-ui
;;   :config
;;   (setq lsp-ui-doc-position 'at-point))
;; (use-package lsp-ivy)
;; (use-package lsp-haskell
;;   :config (setq lsp-haskell-server-path "haskell-language-server"))
(defun my/eldoc-box-show-doc-at-point (event)
  "Show eldoc-box help at point after a short delay to give Eldoc time to update."
  (interactive "e")
  (mouse-set-point event)
  (eldoc-box-reset-frame)
  (run-with-timer
   0.2 nil
   (lambda ()
     (eldoc-box-help-at-point))))


(defun my/eldoc-box-refresh (event)
  "Always refresh eldoc box popup at point on mouse click."
  (interactive "e")
  (mouse-set-point event)
  (eldoc-box-reset-frame) ;; remove any existing popup
  (eldoc-box-help-at-point)) ;; show new popup

;; eglot
(with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		'(haskell-ts-mode . ("haskell-language-server" "--lsp"))))
(with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		'(nix-mode . ("nixd"))))
(with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		'(tsx-ts-mode . ("yarn" "exec" "typescript-language-server" "--stdio"))))
(with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		'(jtsx-tsx-mode . ("yarn" "exec" "typescript-language-server" "--stdio"))))
(with-eval-after-load 'eglot
  (define-key eglot-mode-map [mouse-1] #'my/eldoc-box-show-doc-at-point))

;;; JTSX
(use-package jtsx
  :config
  (setq jtsx-enable-jsx-element-tags-auto-sync t))


(use-package eldoc-box
  :custom
  (eldoc-idle-delay 0.2))
;; (add-hook 'haskell-mode-hook 'eglot-ensure)
;; (add-hook 'haskell-ts-mode 'eglot-ensure)
(add-hook 'nix-mode-hook 'eglot-ensure)
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)
(add-hook 'jtsx-tsx-mode-hook 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)

;;; FLYSPELL
(use-package flyspell-correct
  :general
  (:keymaps 'markdown-mode-map
   :states 'normal
	   "SPC a" 'flyspell-correct-at-point))

;;; LANGUAGE PACKAGES
(use-package nix-mode :config (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))
(use-package fish-mode)
(use-package markdown-mode
  :hook (markdown-mode . flyspell-mode))
;; (use-package web-mode
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))
;; (use-package websocket)
(use-package emmet-mode
  :config (add-to-list 'emmet-jsx-major-modes 'tsx-ts-mode)
  :hook (tsx-ts-mode . emmet-mode))

;; (use-package deno-bridge
;;   :straight (:type git :host github :repo "manateelazycat/deno-bridge")
;;   :init
;;   (use-package websocket))

;; (use-package emmet2-mode
;;   :straight (:type git :host github :repo "p233/emmet2-mode" :files (:defaults "*.ts" "src" "data"))
;;   :after deno-bridge
;;   :hook ((html-ts-mode jsx-ts-mode css-mode) . emmet2-mode)                     ;; Enable emmet2-mode for web-mode and css-mode and other major modes based on them, such as the build-in scss-mode
;;   :config                                                       ;; OPTIONAL
;;   (unbind-key "C-j" emmet2-mode-map)                            ;; Unbind the default expand key
;;   (define-key emmet2-mode-map (kbd "C-c C-.") 'emmet2-expand))  ;; Bind custom expand key

;; 
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . jtsx-tsx-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.html" . html-ts-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-ts-mode))
(add-hook 'haskell-ts-mode-hook 'eglot-ensure)

;;; TREESITTER MODES
(use-package haskell-ts-mode)
  ;; :straight (:host github :repo "https://codeberg.org/pranshu/haskell-ts-mode" :commit "cc6d458a3e67b04d30d0d1f2c8d105c1a66e2f01"))
;;   :config
;;    (add-to-list 'auto-mode-alist '("\.hs" . haskell-ts-mode))
;;   )
;; (add-to-list 'auto-mode-alist '("\.rs" . rust-ts-mode))
;; (add-to-list 'auto-mode-alist '("\.html" . html-ts-mode))
;; (straight-use-package '(evil-ts :type git :host github :repo "foxfriday/evil-ts"))
(use-package smartparens
  :config (smartparens-global-mode))
