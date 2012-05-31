(require 'minimap)

(setq minimap-window-location 'right)

;; Minimap toggling
(defun minimap-toggle ()
  "Show minimap if hidden, hide if present."
  (interactive)
  (if (and minimap-bufname
           (get-buffer minimap-bufname)
           (get-buffer-window (get-buffer minimap-bufname)))
      (minimap-kill)
    (minimap-create)))
