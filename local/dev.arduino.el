(autoload 'arduino-mode "arduino-mode" "Arduino Mode" t)
(add-to-list 'auto-mode-alist '("\\.pde\\'" . arduino-mode))
(add-to-list 'auto-mode-alist '("\\.ino\\'" . arduino-mode))
