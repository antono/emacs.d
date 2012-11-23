;;
;; Coding Common
;;
(dolist (x '(scheme emacs-lisp lisp clojure))
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) 'run-coding-hook))

;; Extensions

(add-to-list 'auto-mode-alist '("\\.s[pl]s$"   . scheme-mode))

;;
;; Paredit
;;
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))


;;
;; Emacs Lisp
;;

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'remove-elc-on-save)

(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))



;;
;; Clojure
;;
(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))
 
(when (not (package-installed-p 'nrepl))
  (package-install 'nrepl))


