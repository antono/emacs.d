(setq rsense-home (concat dotfiles-dir "vendor/rsense/"))

(setenv "RSENSE_HOME" rsense-home) 
(add-to-list 'load-path (concat rsense-home "/etc"))

(require 'rsense)

;; Complete by C-c .
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'rsense-complete)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
