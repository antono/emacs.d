(require 'yari)
(require 'hideshow)

(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))

(mapcar (lambda (pattern)
          (add-to-list 'auto-mode-alist `(,pattern . ruby-mode)))
        '("Gemfile$" "Cheffile$" "Berksfile$" "config.ru$" "Rakefile$" "Guardfile$" "Capfile$" "*\.rb" "\\.rake$" "\\.gemspec$"))

(autoload 'rhtml-mode   "rhtml-mode"   "RHTML" t)
(autoload 'slim-mode    "slim-mode"    "Slim Templates" t)
(autoload 'yaml-mode    "yaml-mode"    "YAML Support" t)
(autoload 'haml-mode    "haml-mode"    "HAML Support" t)
(autoload 'rspec-mode   "rspec-mode"   "Rspec Support" t)
(autoload 'feature-mode "feature-mode" "Cucumber Support" t)

(add-to-list 'auto-mode-alist '("\\.ya?ml$"     . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md$"        . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.feature$"   . feature-mode))
(add-to-list 'auto-mode-alist '("\\.hamstache$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$"     . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$"      . ruby-mode))

(eval-after-load 'ruby-mode
  '(progn
     (ignore-errors (require 'ruby-compilation))
     (setq ruby-use-encoding-map nil)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (add-to-list 'completion-ignored-extensions ".rbc")
     (define-key ruby-mode-map (kbd "C-h r") 'yari)))

(add-hook 'ruby-mode-hook 'run-coding-hook)


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

;; http://stackoverflow.com/questions/5454054/how-can-i-add-intelligent-alignment-of-assignments-and-hashes-to-indent-region-i
(require 'align)

(add-to-list 'align-rules-list
             '(ruby-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-hash-literal
               (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-assignment-literal
               (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list          ;TODO add to rcodetools.el
             '(ruby-xmpfilter-mark
               (regexp . "\\(\\s-*\\)# => [^#\t\n]")
               (repeat . nil)
               (modes  . '(ruby-mode))))
