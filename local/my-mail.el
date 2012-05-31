;; mu4e

(add-to-list 'load-path "~/Code/mu/emacs")

(require 'mu4e)
(require 'mu4e-speedbar)

(setq user-full-name "Antono Vasiljev"
      user-mail-address "self@antono.info"
      mail-reply-to user-mail-address 
      message-signature "http://shelr.tv - plain text screencasts for unix ninjas"
      mu4e-user-mail-address-regexp "self@antono\.info"
      mu4e-mu-binary     "~/.local/homemade/mu/master/bin/mu"
      mu4e-maildir       "~/Maildir"
      mu4e-sent-folder   "/sent"
      mu4e-drafts-folder "/drafts"
      mu4e-trash-folder  "/trash"
      mu4e-html2text-command "html2text -utf8 -width 72"
      mu4e-maildir-shortcuts '(("/Archive"     . ?a)
                               ("/INBOX"       . ?i)
                               ("/sent"        . ?s))
      mu4e-get-mail-command "offlineimap"
      mu4e-headers-fields '((:date          .  25)
                            (:flags         .   6)
                            (:from          .  22)
                            (:subject       .  nil)))

;; Sending Mail
(require 'smtpmail)

(setq send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("mail.antono.info" 587 "antono" nil))
      smtpmail-default-smtp-server "mail.antono.info"
      smtpmail-local-domain "antono.info"
      user-full-name "Antono Vasiljev")
