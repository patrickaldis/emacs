;; BACKUPS  -*- lexical-binding: t; -*-
(setq
    backup-directory-alist '(("." . "~/.emacs.d/backup/"))
    auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-saves/" t))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
)
