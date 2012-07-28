(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` `pkg-config gtk+-3.0 --cflags`-I./ -I../ ")
(load "c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
