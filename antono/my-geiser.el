(load-file "~/.emacs.d/vendor/geiser/elisp/geiser.el")
(setq geiser-active-implementations '(guile))
(setq geiser-guile-binary "/usr/bin/guile")
(setq geiser-guile-load-init-file-p t)
