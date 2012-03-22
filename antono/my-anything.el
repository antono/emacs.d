(require 'anything)
(require 'anything-match-plugin)
(require 'anything-ack)

(defvar anything-c-source-imenu
  '((name . "Imenu")
    (init . (lambda ()
              (setq anything-c-imenu-current-buffer
                    (current-buffer))))
    (candidates
     . (lambda ()
         (condition-case nil
             (with-current-buffer anything-c-imenu-current-buffer
               (mapcan
                (lambda (entry)
                  (if (listp (cdr entry))
                      (mapcar (lambda (sub)
                                (concat (car entry) anything-c-imenu-delimiter (car sub)))
                              (cdr entry))
                    (list (car entry))))
                (setq anything-c-imenu-alist (imenu--make-index-alist))))
           (error nil))))
    (volatile)
    (action
     . (lambda (entry)
         (let* ((pair (split-string entry anything-c-imenu-delimiter))
                (first (car pair))
                (second (cadr pair)))
           (imenu
            (if second
                (assoc second (cdr (assoc first anything-c-imenu-alist)))
              entry))
           )))))
