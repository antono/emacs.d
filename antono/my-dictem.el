;; Loading dictem functions
(require 'dictem)

; Setting the dictionary server hostname.
; This part is optional, if dictem-server is nil (the default value)
; "dict" command line utility will use its ows config file
; ~/.dictrc or PREFIX/etc/dict.conf.
; Keeping dictem-server variable unset is recomended because
; this allows to try _list of_ servers until connection is made,
; see dict(1) for details.
(setq dictem-server "localhost")
;(setq dictem-server "dict.org")


; Setting the dictionary server port.
; Setting dictem-port is usually not necessary because
; most DICT servers use the default port 2628.
;(setq dictem-port   "2628")

; Code necessary to obtain database and strategy list from DICT
; server. As of version 0.90, dictem runs this function from
; dictem-select-database and dictem-select-strategy if an
; initialization was not completed or failed previously, that is
; running dictem-initialize is optional
(dictem-initialize)

; Assigning hot keys for accessing DICT server

; SEARCH = MATCH + DEFINE
; Ask for word, database and search strategy
; and show definitions found
(global-set-key "\C-cs" 'dictem-run-search)

; MATCH
; Ask for word, database and search strategy
; and show matches found
(global-set-key "\C-cm" 'dictem-run-match)

; DEFINE
; Ask for word and database name
; and show definitions found
(global-set-key "\C-cd" 'dictem-run-define)

; SHOW SERVER
; Show information about DICT server
(global-set-key "\C-c\M-r" 'dictem-run-show-server)

; SHOW INFO
; Show information about the database
(global-set-key "\C-c\M-i" 'dictem-run-show-info)

; SHOW DB
; Show a list of databases provided by DICT server
(global-set-key "\C-c\M-b" 'dictem-run-show-databases)
