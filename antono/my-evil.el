;;
;; Emacs is a nice OS - but it lacks a good text editor.
;; That's why I am using Vim. --Anonymous
;;
(setq evil-mode-line-format 'before)
(setq evil-want-C-u-scroll t)

(setq evil-emacs-state-cursor  '("red" box))
(setq evil-normal-state-cursor '("gray" box))
(setq evil-visual-state-cursor '("gray" box))
(setq evil-insert-state-cursor '("gray" bar))
(setq evil-motion-state-cursor '("gray" box))

(require 'evil)
(evil-mode 1)

(require 'evil-rails)

(require 'surround)
(global-surround-mode 1)

;; Commands

(evil-ex-define-cmd "W"     'evil-write-all)
(evil-ex-define-cmd "Tree"  'speedbar-get-focus)
(evil-ex-define-cmd "linum" 'linum-mode)
(evil-ex-define-cmd "align" 'align-regexp)

;; Its useful
(defun evil-scroll-down-other-window ()
  (interactive)
  (scroll-other-window))

(defun evil-scroll-up-other-window ()
  (interactive)
  (scroll-other-window '-))

(define-key evil-normal-state-map 
  (kbd "C-S-d") 'evil-scroll-down-other-window)

(define-key evil-normal-state-map 
  (kbd "C-S-u") 'evil-scroll-up-other-window)

;; Incr decr
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-A")
  'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-S-A")
  'evil-numbers/dec-at-pt)

;; Ibuffer integration
;; TODO: push upstream

;;; mu4e

(eval-after-load 'mu4e
  '(progn
     ;; use the standard bindings as a base
     (evil-make-overriding-map mu4e-view-mode-map 'normal t)
     (evil-make-overriding-map mu4e-main-mode-map 'normal t)
     (evil-make-overriding-map mu4e-headers-mode-map 'normal t)
     
     (evil-add-hjkl-bindings mu4e-view-mode-map 'normal
       "J" 'mu4e~headers-jump-to-maildir
       "j" 'evil-next-line
       "C" 'mu4e-compose-new
       "o" 'mu4e-view-message
       "Q" 'mu4e-raw-view-quit-buffer)
     
     ;; (evil-add-hjkl-bindings mu4e-view-raw-mode-map 'normal
     ;;   "J" 'mu4e-jump-to-maildir
     ;;   "j" 'evil-next-line
     ;;   "C" 'mu4e-compose-new
     ;;   "q" 'mu4e-raw-view-quit-buffer)
     
     (evil-add-hjkl-bindings mu4e-headers-mode-map 'normal
       "J" 'mu4e~headers-jump-to-maildir
       "j" 'evil-next-line
       "C" 'mu4e-compose-new
       "o" 'mu4e-view-message
       )
     
     (evil-add-hjkl-bindings mu4e-main-mode-map 'normal
       "J" 'mu4e~headers-jump-to-maildir
       "j" 'evil-next-line
       "RET" 'mu4e-view-message)
     ))

