(require 'perspective)
(persp-mode 1)
(global-set-key (kbd "C-x P") 'persp-switch)
(global-set-key (kbd "C-x p") 'persp-switch-quick)


;;; TODO: push upstream
(require 'cl)

(global-set-key (kbd "C-<tab>") 'persp-next)
(global-set-key (kbd "C-S-<iso-lefttab>") 'persp-prev)

