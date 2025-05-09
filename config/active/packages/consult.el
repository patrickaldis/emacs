;; -*- lexical-binding: t; -*-
(use-package consult)
(setq project-switch-commands #'project-find-file)
(use-package consult-project-extra :after consult)
(use-package consult-eglot :after consult eglot)
(use-package consult-hoogle :after consult)
