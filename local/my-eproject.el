(require 'eproject)
(require 'eproject-extras)

(add-to-list 'load-path "~/.emacs.d/vendor/eproject/contrib/")
(require 'helm-eproject)
;; (require 'eproject-tags)
(require 'eproject-tasks)

(add-to-list 'load-path "~/.emacs.d/vendor/eproject/lang/")
(require 'eproject-ruby)
(require 'eproject-ruby-on-rails)
(require 'eproject-android)
(require 'eproject-arduino)

;; Project Types
;; https://github.com/jrockway/eproject/wiki/ProjectTypes
;; https://github.com/jrockway/eproject/wiki/EprojectExamples
;; TODO: move to separate configs
