(require 'imenu)

(setq Info-imenu-generic-expression
      '(("Topic: " ".*")))

(add-hook 'Info-mode-hook
          (lambda ()
            (message "Imenu for info inited")
            (setq imenu-generic-expression Info-imenu-generic-expression)))

(setq emacs-lisp-generic-expression
      )

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq emacs-lisp-generic-expression
                  '((nil "^\\s-*(def\\(un\\|subst\\|macro\\|advice\\)\\s-+\\([-A-Za-z0-9+]+\\)" 2)
                   ("*Vars*" "^\\s-*(def\\(var\\|const\\)\\s-+\\([-A-Za-z0-9+]+\\)" 2)
                   ("*Types*" "^\\s-*(def\\(type\\|struct\\|class\\|ine-condition\\)\\s-+\\([-A-Za-z0-9+]+\\)" 2)))))

;; TODO: push upstream
(setq markdown-imenu-generic-expression
      '(("H1"  "^# \\(.*\\)" 1)
        ("H2"  "^## \\(.*\\)" 1)
        ("H3"  "^### \\(.*\\)" 1)
        ("H4"  "^#### \\(.*\\)" 1)
        ("H5"  "^##### \\(.*\\)" 1)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (setq imenu-generic-expression markdown-imenu-generic-expression)))
