(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(global-set-key (kbd "S-<delete>") 'ibus-toggle)
(global-set-key (kbd "S-<return>") 'ibus-toggle)
