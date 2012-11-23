;;; Setup backups for Emacs
;;
;; Meditate: http://www.emacswiki.org/emacs/BackupDirectory

(setq
 create-lockfiles nil
 backup-by-copying t                   ; don't clobber symlinks
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)                    ; use versioned backups

(auto-revert-mode)

;; VC plugin: you keep fs clean
(setq vc-make-backup-files nil)

;; save autosave and backup files centrally instead of clutering projects
(defvar dotfiles-tmp-dir (concat dotfiles-dir "var/tmp/"))

(setq savehist-file (concat dotfiles-tmp-dir "/history.el")
      backup-directory-alist `(("." . ,(concat dotfiles-tmp-dir "backups")))
      auto-save-list-file-prefix (concat dotfiles-tmp-dir "auto-save-sessions/")
      auto-save-file-name-transforms `((".*" ,(concat dotfiles-tmp-dir "auto-save-files/") t)))
