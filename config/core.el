;;; COMPANY
(use-package company
  :defines company-idle-delay

  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0))

(use-package company-posframe
  :after company
  :config (company-posframe-mode 1))

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
