;; -*- lexical-binding: t; -*-
(use-package git-gutter
  :defines git-gutter:update-interval

  :config
  (add-hook 'prog-mode-hook 'git-gutter-mode)
  (setq git-gutter:update-interval 0.02)
  (use-package git-gutter-fringe
    :config
    (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
    (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
    (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom)))
