(dolist (r `((?i (file . ,(concat dotfiles-dir "init.el")))
             (?c (file . ,(concat dotfiles-dir "antono/")))
             (?v (file . ,(concat dotfiles-dir "vendor/")))
             (?b (file . ,(concat user-specific-dir "/my-bindings.el")))
             (?s (file . ,"/ssh:antono.info:~/.dovecot.sieve"))
             (?p (file . ,"~/Code"))
             (?r (file . ,(concat user-specific-dir "/my-registers.el")))))
  (set-register (car r) (cadr r)))

