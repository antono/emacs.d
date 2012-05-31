;; (require 'multiple-cursors)
;; (global-set-key (kbd "C-s-c C-s-c") 'mc/add-multiple-cursors-to-region-lines)
;; (global-set-key (kbd "C-s-c C-e") 'mc/edit-ends-of-lines)
;; (global-set-key (kbd "C-s-c C-a") 'mc/edit-beginnings-of-lines)
                 
;; (require 'inline-string-rectangle)
;; (global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-M-m") 'mark-more-like-this)
