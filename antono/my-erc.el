;; ERC Setup
(defun start-irc ()
  "Connect to IRC."
  (interactive)
  (setq erc-autojoin-channels-alist
        '(("freenode.net"
           "#emacs"
           "#clojure"
           "#shelr"
           "#guile"
           "#beam.js"
           "#hurd"
           "##esperanto"
           "#node.js"
           "#synapse"
           "#zappajs"
           "#ubuntu-by"
           "#rubyonrails")
          ("irc.gnome.org"
           "#gtk"
           "#gnome-hackers"
           "#vala"
           "#introspection"
           "#gnome-ru"
           "#gnome-eo"
           "#gnucash")))
  ;; (erc-tls :server "irc.oftc.net" :port 6697
  ;;          :nick "antono" :full-name "antono")
  (erc :server "irc.freenode.net" :port 6667
       :nick "antono" :full-name "antono")
  (erc :server "irc.gnome.org" :port 6667
       :nick "antono" :full-name "antono"))

(eval-after-load 'erc
  '(progn
     (require 'erc-services)
     (require 'erc-autoaway)
     (require 'erc-spelling)
     (require 'erc-truncate)
     (require 'erc-match)
     (require 'erc-log)
     (require 'erc-spelling)
     (require 'erc-speedbar)
     
     
     (setq erc-log-channels-directory "~/.emacs.d/var/log")
     (erc-log-enable)
     
     (setq erc-prompt "IRC>"
           erc-fill-column 60
           erc-max-buffer-size 100000
           erc-hide-list '("JOIN" "PART" "QUIT" "NICK")
           erc-track-exclude-types (append
                                    '("324" "329" "332" "333" "353" "477" "MODE")
                                    erc-hide-list)
           erc-nick '("antono" "ant0no")
           erc-email-userid "self@antono.info"
           erc-autojoin-timing :ident
           erc-flood-protect nil
           erc-frame-dedicated-flag 1
           erc-join-buffer 'bury
           erc-prompt-for-nickserv-password nil)

     (erc-services-mode 1)
     (add-to-list 'erc-modules 'highlight-nicknames)
     (add-to-list 'erc-modules 'spelling)
     (add-to-list 'erc-modules 'autoaway)
     (add-to-list 'erc-modules 'match)
     (add-to-list 'erc-modules 'log)
     (add-to-list 'erc-modules 'menu)
     (add-to-list 'erc-modules 'spelling)
     
     (add-hook 'erc-connect-pre-hook (lambda (x) (erc-update-modules)))
     (add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
     (set-face-foreground 'erc-input-face "dim gray")
     (set-face-foreground 'erc-my-nick-face "blue")))

(setq pcomplete-cycle-completions nil)

(defun clean-message (s)
  (setq s (replace-regexp-in-string "'" "&apos;" 
  (replace-regexp-in-string "\"" "&quot;"
  (replace-regexp-in-string "&" "&amp;" 
  (replace-regexp-in-string "<" "&lt;"
  (replace-regexp-in-string ">" "&gt;" s)))))))

(require 'notifications)
(defun erc-global-notify (match-type nick message)
  "Notify when a message is recieved."
  (notifications-notify
   :title nick
   :body message
   :app-icon "/usr/share/notify-osd/icons/gnome/scalable/status/notification-message-im.svg"
   :urgency 'low))

(add-hook 'erc-text-matched-hook 'erc-global-notify)
