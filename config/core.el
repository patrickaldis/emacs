;; ;;; COMPANY
;; (use-package company
;;   :defines company-idle-delay

;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   (setq company-idle-delay 0.2))

;; (use-package company-posframe
;;   :after company
;;   :config (company-posframe-mode 1))
(use-package corfu :config
  (global-corfu-mode)
  (setq corfu-auto        t
        corfu-auto-delay  0  ;; TOO SMALL - NOT RECOMMENDED!
        corfu-auto-prefix 0) ;; TOO SMALL - NOT RECOMMENDED!

  (add-hook 'corfu-mode-hook
            (lambda ()
                ;; Settings only for Corfu
                (setq-local completion-styles '(basic)
                            completion-category-overrides nil
                            completion-category-defaults nil)))
  (use-package nerd-icons-corfu)
    (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

    ;; Optionally:
    (setq nerd-icons-corfu-mapping
        '((array :style "cod" :icon "symbol_array" :face font-lock-type-face)
            (boolean :style "cod" :icon "symbol_boolean" :face font-lock-builtin-face)
            ;; You can alternatively specify a function to perform the mapping,
            ;; use this when knowing the exact completion candidate is important.
            (file :fn nerd-icons-icon-for-file :face font-lock-string-face)
            ;; ...
            (t :style "cod" :icon "code" :face font-lock-warning-face)))
            ;; Remember to add an entry for `t', the library uses that as default.

    ;; The Custom interface is also supported for tuning the variable above.
  )

(use-package atomic-chrome
  :config
  (atomic-chrome-start-server)
  (setq atomic-chrome-buffer-open-style 'frame))

;; ;;; IVY
;; (use-package counsel 
;;   :init
;;   (counsel-mode)
;;   (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
;;   (setq ivy-initial-inputs-alist
;;         '((counsel-minor . "")
;;         (counsel-package . "")
;;         (counsel-org-capture . "")
;;         (counsel-M-x . "")
;;         (counsel-describe-symbol . "")
;;         (org-refile . "")
;;         (org-agenda-refile . "")
;;         (org-capture-refile . "")
;;         (Man-completion-table . "")
;;         (woman . ""))
;;         )
;;   :bind (:map ivy-minibuffer-map
;;         ("C-j" . ivy-next-line)
;;         ("C-k" . ivy-previous-line))
;; )

;; Terminal
(setq term-default-shell "/run/current-system/sw/bin/fish") 

;; (use-package ivy-rich
;;     :after ivy
;;     :config
;;     (ivy-rich-mode 1))

;; (use-package nerd-icons-ivy-rich
;;     :after ivy-rich
;;     :init (nerd-icons-ivy-rich-mode 1))
(use-package vertico :config (vertico-mode))
(use-package marginalia :config (marginalia-mode))
(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))
(use-package orderless
  :custom
  (completion-styles '(orderless))      ; Use orderless
  (completion-category-defaults nil)    ; I want to be in control!
  (completion-category-overrides
   '((file (styles basic ; For `tramp' hostname completion with `vertico'
                   orderless)))))

(use-package consult)
(use-package consult-project-extra :after consult)
(use-package consult-eglot :after consult eglot)
(use-package consult-hoogle :after consult)


;;; DIRENV
(use-package direnv
  :config
  (direnv-mode)
)
