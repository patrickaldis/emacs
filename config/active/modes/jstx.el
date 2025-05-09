;; -*- lexical-binding: t; -*-
;;; JTSX
(use-package jtsx
  :config
  (setq jtsx-enable-jsx-element-tags-auto-sync t)
  (put 'jtsx-tsx-mode 'eglot-language-id "typescriptreact"))
