(defun emacs-uri-handler (uri)
  "Handles emacs URIs in the form: emacs:///path/to/file/LINENUM"
  (save-match-data
    (if (string-match "emacs://\\(.*\\)/\\([0-9]+\\)$" uri)
        (let ((filename (match-string 1 uri))
              (linenum (match-string 2 uri)))
          (while (string-match "\\(%20\\)" filename)
            (setq filename (replace-match " " nil t filename 1)))
          (with-current-buffer (find-file filename)
            (goto-line (string-to-number linenum))))
      (beep)
      (message "Unable to parse the URI <%s>"  uri))))
