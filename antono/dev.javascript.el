;;
;; JS itself
;;
;; (require 'js3-mode)		     

;; (add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js3-mode))

;; (setq js3-indent-level 2)
;; (setq js3-expr-indent-offset 2)
;; (setq js3-paren-indent-offset 2)
;; (setq js3-square-indent-offset 2)
;; (setq js3-curly-indent-offset 2)
;; (setq js3-lazy-commas t)
;; (setq js3-lazy-operators t)
;; (setq js3-lazy-dots t)

;; (add-hook 'js3-mode-hook
;;           '(lambda () (coding-hook)))

;;
;; Coffe Script
;;
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2)
  (coding-hook))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))


;;
;; Jade and Stylus
;;
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(setq js-indent-level 2)
