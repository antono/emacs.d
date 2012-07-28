(autoload 'nix-mode "nix-mode" "Nix lang support" t)
(add-to-list 'auto-mode-alist '("\\.nix$"   . nix-mode))
