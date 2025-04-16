(use-package general
  :init
  (setq general-override-states '(insert
                                  emacs
                                  hybrid
                                  normal
                                  visual
                                  motion
                                  operator
                                  replace))
  :config
  (general-create-definer global-definer
    :keymaps 'override
    :states '(insert emacs normal hybrid motion visual operator)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (global-definer
    "k" 'eldoc-box-help-at-point
    ":" 'execute-extended-command
    "e" 'consult-flymake
    "s" 'consult-eglot-symbols
    "r" 'consult-ripgrep
   )
    (defmacro general-global-menu-definer (def infix-key &rest body)
    "Create a definer named general-global-DEF wrapping global-definer.
    The prefix map is named 'my-DEF-map'."
    `(progn
        (general-create-definer ,(intern (concat "general-global-" def))
        :wrapping global-definer
        :prefix-map (quote ,(intern (concat "my-" def "-map")))
        :infix ,infix-key
        :wk-full-keys nil
        "" '(:ignore t :which-key ,def))
        (,(intern (concat "general-global-" def))
        ,@body)))


    (general-global-menu-definer
     "git" "g"
        "g" 'magit-status
     )

    (general-global-menu-definer
     "buffer" "b"
        "b" 'switch-to-buffer
        "e" 'eval-buffer
     )

    (general-global-menu-definer
     "window" "w"
        "h" 'evil-window-left
        "j" 'evil-window-down
        "k" 'evil-window-up
        "l" 'evil-window-right

        "H" 'evil-window-move-far-left
        "J" 'evil-window-move-very-bottom
        "K" 'evil-window-move-very-top
        "L" 'evil-window-move-far-right

        "v" 'evil-window-vsplit
        "s" 'evil-window-split
        "q" 'evil-window-delete
      )

    (general-global-menu-definer
     "help" "h"
        "v" 'describe-variable
        "s" 'describe-symbol
        "f" 'describe-function
        "k" 'describe-key
        "e" 'info-emacs-manual
        "m" 'info-emacs-manual
     )

    (general-global-menu-definer
     "file" "f"
        "r" 'recentf
        "f" 'find-file
     )

    (general-global-menu-definer
     "project" "p"
        "p" 'project-switch-project
        "f" 'project-find-file
     )

  (general-define-key
   :states 'normal
   :keymaps 'Info-mode-map
   "n" 'Info-search-next
   "p" 'Info-search-backward)

)
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-global-set-key 'visual "gc" 'comment-or-uncomment-region)
  (evil-global-set-key 'normal "gcc" 'comment-line)
)

(use-package evil-collection
  :config (evil-collection-init)
  :init 
  :after evil
  :custom
  (evil-collection-setup-minibuffer t)
)
