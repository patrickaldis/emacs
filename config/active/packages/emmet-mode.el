;; -*- lexical-binding: t; -*-
(use-package emmet-mode
  :config (add-to-list 'emmet-jsx-major-modes 'tsx-ts-mode)
  :hook (tsx-ts-mode . emmet-mode))
