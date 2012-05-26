(require 'eproject)
(require 'eproject-extras)

(add-to-list 'load-path "~/.emacs.d/vendor/eproject/contrib/")
(require 'helm-eproject)
(require 'etags)
(require 'eproject-tags)

(add-to-list 'load-path "~/.emacs.d/vendor/eproject/lang/")
(require 'eproject-perl)
(require 'eproject-ruby)
(require 'eproject-ruby-on-rails)


;; Project Types
;; https://github.com/jrockway/eproject/wiki/ProjectTypes
;; https://github.com/jrockway/eproject/wiki/EprojectExamples
;; TODO: move to separate configs
