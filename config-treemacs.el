;;; $DOOMDIR/config-treemacs.el -*- lexical-binding: t; -*-

(after! treemacs
  ;; opens/closes files using ace
  (treemacs-define-RET-action 'file-node-closed #'treemacs-visit-node-ace)
  (treemacs-define-RET-action 'file-node-open #'treemacs-visit-node-ace))

(add-hook! 'treemacs-node-hook
           #'(lambda ()
                ;; (message "treemacs-mode-hook `%s'" (current-buffer))
                ;; NOTE: Treemacs buffer in terminal mode cannot display
                ;; scaled text.
                (when window-system
                  (text-scale-decrease 2))))

(map! "M-0" #'treemacs-select-window)
