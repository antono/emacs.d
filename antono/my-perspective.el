(require 'perspective)
(persp-mode 1)
(global-set-key (kbd "C-x P") 'persp-switch)
(global-set-key (kbd "C-x p") 'persp-switch-quick)


;;; TODO: push upstream
(require 'cl)

(defun persp-curr-position (offset)
  (+ offset
     (position (persp-name persp-curr)
               (persp-all-names))))

(defun persp-next ()
  "Switch to next perspective"
  (interactive)
  (persp-switch (nth (persp-curr-position -1) (persp-all-names))))

(defun persp-prev ()
  "Switch to previous perspective"
  (interactive)
  (persp-switch (nth (persp-curr-position +1) (persp-all-names))))

(global-set-key (kbd "C-<tab>") 'persp-next)
(global-set-key (kbd "C-S-<iso-lefttab>") 'persp-prev)

