(server-start)

;; Quick UI cleanup
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;;
;; Setup base path relative to this file
;;
(defconst dotfiles-dir
  (file-name-directory (or (buffer-file-name) load-file-name))
  "A place where Emacs dotfiles placed.")

(setq user-emacs-directory
  (concat dotfiles-dir (file-name-as-directory "var")))

(add-to-list 'load-path dotfiles-dir)


;;
;; Place for my configs
;;
(defconst user-specific-dir
  (concat dotfiles-dir user-login-name)
  "You can keep Your customizations here, all will be autoloaded.")

(add-to-list 'load-path user-specific-dir)

;;
;; Add all dirs from 'vendor' to load-path
;;
(defun reload-vendor ()
  "Adds all paths from ~/.emacs.d/vendor to load-path"
  (interactive)
  (let ((vendor-path (concat (file-name-as-directory dotfiles-dir) "vendor")))
    (dolist (dir (directory-files vendor-path t))
      (if (file-directory-p dir)
          (add-to-list 'load-path dir)))))

(reload-vendor)

;;
;; Package.el
;;
(setq package-archives '(("ELPA"      . "http://tromey.com/elpa/")
                         ("GNU"       . "http://elpa.gnu.org/packages/")
                         ("Marmalade" . "http://marmalade-repo.org/packages/")))


(defconst package-user-dir
  (concat user-emacs-directory "elpa"))
(defconst autoload-file
  (concat user-emacs-directory "loaddefs.el"))
(defconst custom-file
  (concat user-emacs-directory "custom.el"))

(package-initialize)

;;
;; Loading all local customizations
;;
(load custom-file 'noerror)

(if (file-exists-p user-specific-dir)
    (mapc #'load (directory-files user-specific-dir t ".*el$")))

;;; init.el ends here
