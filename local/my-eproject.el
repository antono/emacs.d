(require 'eproject)
(require 'eproject-extras)

(autoload 'scss-mode "scss-mode" "SCSS" t)

(add-to-list 'load-path "~/.emacs.d/vendor/eproject/contrib/")
(autoload 'helm-eproject "helm-eproject" "Helm for eproject files" t)
(autoload 'eproject-tags "eproject-tags" "etags for eproject" t)

(add-to-list 'load-path "~/.emacs.d/vendor/eproject/lang/")
(require 'eproject-ruby)
(require 'eproject-ruby-on-rails)


;; Project Types
;; https://github.com/jrockway/eproject/wiki/ProjectTypes
;; https://github.com/jrockway/eproject/wiki/EprojectExamples
;; TODO: move to separate configs
