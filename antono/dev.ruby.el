(require 'slim-mode)
(require 'yaml-mode)
(require 'feature-mode)
(require 'haml-mode)
(require 'yari)
(require 'rspec-mode)
(require 'hideshow)

(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))

(mapcar (lambda (pattern)
          (add-to-list 'auto-mode-alist `(,pattern . ruby-mode)))
        '("Gemfile$" "config.ru$" "Rakefile$" "Guardfile$" "Capfile$" "*\.rb" "\\.rake$" "\\.gemspec$"))

(add-to-list 'auto-mode-alist '("\\.ya?ml$"   . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md$"      . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

(eval-after-load 'ruby-mode
  '(progn
     (ignore-errors (require 'ruby-compilation))
     (setq ruby-use-encoding-map nil)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (add-to-list 'completion-ignored-extensions ".rbc")
     (define-key ruby-mode-map (kbd "C-h r") 'yari)))

(add-hook 'ruby-mode-hook 'run-coding-hook)
(add-hook 'ruby-mode-hook 'setup-ruby-mode)
;; (add-hook 'rinari-minor-mode-hook 'rvm-activate-corresponding-ruby)

(defun setup-ruby-mode ()
  "TODO: check buffer name"
  (rspec-mode 1)
  (ruby-electric-mode 1))

;;
;; Rinari (Minor Mode for Ruby On Rails)
;;
(require 'rinari)

(setq rinari-major-modes
      (list 'dired-mode-hook
            'ruby-mode-hook
            'yaml-mode-hook
            'javascript-mode-hook
            'css-mode-hook
            'scss-mode-hook
            'sass-mode-hook
            'coffee-mode-hook))

(setq rinari-tags-file-name "TAGS")

;;
;; FFAP
;;
(defvar ruby-program-name "ruby")
(defun ruby-module-path (module)
  (shell-command-to-string
   (concat
    ruby-program-name " -e "
    "\"ret='()';\\$:.each{|p| "
    "x=p+'/'+ARGV[0].gsub('.rb', '')+'.rb';"
    "ret=File.expand_path(x)"
    "if(File.exist?(x))}; printf ret\" "
    module)))

(eval-after-load "ffap"
  '(push '(ruby-mode . ruby-module-path) ffap-alist))
