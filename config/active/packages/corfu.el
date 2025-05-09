;; -*- lexical-binding: t; -*-
(use-package corfu :config
  (global-corfu-mode)
  (setq corfu-auto        t
        corfu-auto-delay  0.3  ;; TOO SMALL - NOT RECOMMENDED!
        corfu-auto-prefix 1) ;; TOO SMALL - NOT RECOMMENDED!

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
