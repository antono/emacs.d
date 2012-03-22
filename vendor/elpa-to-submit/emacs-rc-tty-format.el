;;; emacs-rc-tty-format.el --- tty-format.el customization.

;; Copyright (C) 2009  Aleksei Gusev

;; Author: Aleksei Gusev <aleksei.gusev@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'tty-format)

(defun tty-format-guess ()
  "Decode text files containing ANSI SGR or backspace sequences.
This is designed for use from `find-file-hook' (or
`find-file-hooks').

If the buffer filename is \".txt\" or \"README\" and there's any
ANSI SGR escapes or backspace overstriking then call
`format-decode-buffer' to decode with `ansi-colors' and/or
`backspace-overstrike' formats respectively.

It'd be too dangerous to look at every file for escape and
backspace sequences, they could too easily occur in binary data
like an image file.  The idea of this function is to check just
text files, presuming you're confident all \".txt\" files should
indeed be ordinary text."

  (let ((filename (buffer-file-name)))
    (when filename
      (when (and (featurep 'jka-compr)
                 (jka-compr-installed-p))
        (setq filename (jka-compr-byte-compiler-base-file-name filename)))

      (when (let ((case-fold-search t))
              (or (string-match "\\.txt\\'"  filename)
                  (string-match "\\(cucumber\\|development\\|test\\|delayed_job\\)\\.log\\'"  filename)
                  (string-match ".babushka/logs" filename)
                  (string-match "/README\\'" filename)))

        (if (save-excursion
              (goto-char (point-min))
              (re-search-forward "[^\b]\b[^\b]" nil t))
            (format-decode-buffer 'backspace-overstrike))

        (if (save-excursion
              (goto-char (point-min))
              (re-search-forward ansi-color-regexp nil t))
            (format-decode-buffer 'ansi-colors))))))

(add-hook 'find-file-hook 'tty-format-guess)
(add-hook 'after-revert-hook 'tty-format-guess)

(provide 'emacs-rc-tty-format)
;;; emacs-rc-tty-format.el ends here
