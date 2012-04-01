(global-set-key (kbd "M-x")     'smex)
(global-set-key (kbd "M-X")     'smex-major-mode-commands)

(global-set-key (kbd "s-l")     'helm-mini)
(global-set-key (kbd "C-S-s-l") 'helm-locate)
(global-set-key (kbd "s-i")     'helm-imenu)
(global-set-key (kbd "s-B")     'helm-bookmarks)

(global-set-key (kbd "C-<f10>") 'menu-bar-mode)
(global-set-key (kbd "s-e")     'speedbar-get-focus)
;; (global-set-key (kbd "s-e")     'sr-speedbar-toggle)
(global-set-key (kbd "s-b")     'eproject-ibuffer)
(global-set-key (kbd "s-d")     'dictionary-search)
(global-set-key (kbd "s-L")     'anything-eproject-files)
(global-set-key (kbd "s-g")     'rgrep)
(global-set-key (kbd "s-M")     'minimap-toggle)
(global-set-key (kbd "<f7>")    'whitespace-mode)
(global-set-key (kbd "<f8>")    'compile)
(global-set-key (kbd "C-x V g") 'mo-git-blame-current)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Kinda Ctrl+^ in Vim
(define-key global-map "\C-^"
  (lambda ()
    (interactive)
    (switch-to-buffer (other-buffer))))

;; Use regex searches by default.
;; (global-set-key (kbd "C-s")   'isearch-forward-regexp)
;; (global-set-key (kbd "\C-r")  'isearch-backward-regexp)
;; (global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)

;; Font Size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Expansions
(global-set-key (kbd "M-/") 'hippie-expand)

;; Start shell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'shell)

