;;
;; We'll try to emulate Vim UI and behavior as close as possible
;;

;; As advanced user You don't need this
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ;; it's ok in unity
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; window history etc
(winner-mode 1)

;; Desktop
;; (desktop-save-mode 1)

;; NO TABS
(set-default 'indent-tabs-mode nil)
(set-default 'inhibit-startup-screen t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Encodings
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Ansi in eshell
(ansi-color-for-comint-mode-on)

;; Moving cursor down at bottom scrolls
;; only a single line, not half page
(setq scroll-step 1)
(setq scroll-conservatively 5)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(setq scroll-margin 0)


(fringe-mode '(0 . 8)) ;; Right fringe only

;; Title and cursor
(when window-system
  (setq frame-title-format '(buffer-file-name "Emacs: %f" ("%b")))
  (tooltip-mode t)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  ;; (set-face-attribute 'default nil :font "Terminus-10")
  ;; (set-face-attribute 'default nil :font "Inconsolata" :height 150)
  ;; (set-face-attribute 'default nil :font "Ubuntu Mono" :height 140)
  ;; (set-face-attribute 'default nil :font "Liberation Mono" :height 110)
  ;; (set-face-attribute 'default nil :font "Liberation Mono" :height 134)
  (set-face-attribute 'default nil :font "Liberation Mono" :height 120) 

  ;; (set-face-attribute 'default nil :font "Liberation Mono" :height 140)
  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/twilight-theme")
  )

(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))


;; Set this to whatever browser you use
;; (setq browse-url-browser-function 'browse-url-firefox)
;; (setq browse-url-browser-function 'browse-default-macosx-browser)
;; (setq browse-url-browser-function 'browse-default-windows-browser)
;; (setq browse-url-browser-function 'browse-default-kde)
;; (setq browse-url-browser-function 'browse-default-epiphany)
;; (setq browse-url-browser-function 'browse-default-w3m)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/xdg-open")

;; Transparently open compressed files
(auto-compression-mode t)

;; Type less: y instead yes
(defalias 'yes-or-no-p 'y-or-n-p)

;;
;; Clipboard 
;;
(transient-mark-mode 1)    ; Now on by default: makes the region act quite like the text "highlight" in many apps.
(setq shift-select-mode t) ; Now on by default: allows shifted cursor-keys to control the region.
(setq mouse-drag-copy-region nil)   ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection
;; these will probably be already set to these values, leave them that way if so!
(setf interprogram-cut-function 'x-select-text)
(setf interprogram-paste-function 'x-cut-buffer-or-selection-value)
; You need an emacs with bug #902 fixed for this to work properly. It has now been fixed in CVS HEAD.
; it makes "highlight/middlebutton" style (X11 primary selection based) copy-paste work as expected
; if you're used to other modern apps (that is to say, the mere act of highlighting doesn't
; overwrite the clipboard or alter the kill ring, but you can paste in merely highlighted
; text with the mouse if you want to)
;  active region sets primary X11 selection
(setq select-active-regions t)
; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.
(global-set-key [mouse-2] 'mouse-yank-primary)
;; with this, doing an M-y will also affect the X11 clipboard, making emacs act as a sort of clipboard history, at
;; least of text you've pasted into it in the first place.
;; (setq yank-pop-change-selection t)  ; makes rotating the kill ring change the X11 clipboard.

;; Save a list of recent files visited.
(recentf-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(setq initial-scratch-message ";; Scratch elisp buffer")

(setq linum-format
      (lambda (line)
        (propertize
         (format
          (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
            (concat " %" (number-to-string w) "d "))
          line)
         'face
         'linum)))



(load-theme 'wombat)

;; function defined only in my patched emacs. see patch:
;; http://lists.gnu.org/archive/html/bug-gnu-emacs/2012-05/msg00862.html
(if (fboundp 'application-prefer-dark-theme)
    (application-prefer-dark-theme 1))

;; Draw line feed ^L as line!
(require 'pp-c-l)

;; Powerline
(require 'powerline)
(powerline-default-theme)

;;
;; Mouse pointer tweaks
;;
;; (mouse-avoidance-mode 'none)    ;; turn it off
;; (mouse-avoidance-mode 'jump)    ;; jump away randomly when approached
;; (mouse-avoidance-mode 'banish)  ;; jump to corner when typing
;; (mouse-avoidance-mode 'exile)   ;; jump to corner when approached
;; (mouse-avoidance-mode 'animate)
