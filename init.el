(server-start)

;; 
;; Setup base path
;; 

(defconst dotfiles-dir
  (file-name-directory (or (buffer-file-name) load-file-name))
  "A place where Emacs dotfiles placed.")

(add-to-list 'load-path dotfiles-dir)

(defconst user-specific-dir
  (concat dotfiles-dir user-login-name)
  "You can keep Your customizations here, all will be autoloaded.")

(add-to-list 'load-path user-specific-dir)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/twilight-theme")

;; Add all dirs from 'vendor' to load-path
(defun reload-vendor ()
  "Adds all paths from ~/.emacs.d/vendor to load-path"
  (interactive)
  (let ((vendor-path (concat (file-name-as-directory dotfiles-dir) "vendor")))
    (dolist (dir (directory-files vendor-path t))
      (if (file-directory-p dir) 
          (add-to-list 'load-path dir)))))

(reload-vendor)

;; Package.el
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("GNU" . "http://elpa.gnu.org/packages/")
                         ("Marmalade" . "http://marmalade-repo.org/packages/")))

(defconst package-user-dir
  (concat dotfiles-dir (file-name-as-directory "var") "elpa"))
(defconst autoload-file
  (concat dotfiles-dir (file-name-as-directory "var") "loaddefs.el"))
(defconst custom-file
  (concat dotfiles-dir (file-name-as-directory "var") "custom.el"))
(setq user-emacs-directory
  (concat dotfiles-dir (file-name-as-directory "var")))

(package-initialize)

;;
;; Loading all local customizations
;;
(load custom-file 'noerror)

(if (file-exists-p user-specific-dir)
    (mapc #'load (directory-files user-specific-dir t ".*el$")))

;;; init.el ends here
