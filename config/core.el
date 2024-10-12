;;; COMPANY
(use-package company
  :defines company-idle-delay

  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0))

(use-package company-posframe
  :after company
  :config (company-posframe-mode 1))

;;; FLYCHECK
(use-package flycheck
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
)

;;; PROJECTILE
(use-package projectile)
(use-package counsel-projectile :after projectile)

;;; IVY
(use-package counsel 
  :init
  (counsel-mode)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (setq ivy-initial-inputs-alist
        '((counsel-minor . "")
        (counsel-package . "")
        (counsel-org-capture . "")
        (counsel-M-x . "")
        (counsel-describe-symbol . "")
        (org-refile . "")
        (org-agenda-refile . "")
        (org-capture-refile . "")
        (Man-completion-table . "")
        (woman . ""))
        )
  :bind (:map ivy-minibuffer-map
        ("C-j" . ivy-next-line)
        ("C-k" . ivy-previous-line))
)

(use-package ivy-rich
    :after ivy
    :config
    (ivy-rich-mode 1))

(use-package nerd-icons-ivy-rich
    :after ivy-rich
    :init (nerd-icons-ivy-rich-mode 1))

;;; DIRENV
(use-package direnv
  :config
  (direnv-mode)
)
