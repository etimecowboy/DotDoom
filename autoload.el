;;; $DOOMDIR/autoload.el -*- lexical-binding: t; -*-

;; Utilities migrated from my Spacemacs config.

;; REF: https://emacs.stackexchange.com/questions/38008/adding-many-items-to-a-list
;;;###autoload
(defun add-list-to-list (dst src)
  "Similar to `add-to-list', but accepts a list as 2nd argument"
  (set dst
       (append (eval dst) src)))

;; REF: https://github.com/doomemacs/doomemacs/issues/88
;; (add-hook! 'use-package--PACKAGE--pre-init-hook ...)
;; (add-hook! 'use-package--PACKAGE--post-init-hook ...)
;; (add-hook! 'use-package--PACKAGE--pre-config-hook ...)
;; (add-hook! 'use-package--PACKAGE--post-config-hook ...)
(setq use-package-inject-hooks t)
;;;###autoload
(defmacro configure! (package when &rest body)
  "Configure a package using use-package hooks (see `use-package-inject-hooks').

PACKAGE is the package name.
WHEN should be one of the following: :pre-init :post-init :pre-config :post-config"
  (declare (indent defun))
  `(add-hook!
    ',(intern (format "use-package--%s--%s-hook"
                      package
                      (substring (symbol-name when) 1)))
    ,@body))

;; Timestamp on babel-execute results block
;; REF: https://emacs.stackexchange.com/questions/16850/timestamp-on-babel-execute-results-block
;;;###autoload
(defadvice org-babel-execute-src-block (after org-babel-record-execute-timestamp)
  "Add a timestamp to the RESULTS of a SRC block."
  (let ((code-block-params (nth 2 (org-babel-get-src-block-info)))
        (code-block-name (nth 4 (org-babel-get-src-block-info))))
    (let ((timestamp (cdr (assoc :timestamp code-block-params)))
          (result-params (assoc :result-params code-block-params)))
      (if (and (equal timestamp "t") (> (length code-block-name) 0))
          (save-excursion
            (search-forward-regexp (concat "#\\+RESULTS\\(\\[.*\\]\\)?: "
                                           code-block-name))
            (beginning-of-line)
            (search-forward "RESULTS")
            (kill-line)
            (insert (concat (format-time-string "[%F %r]: ") code-block-name)))
        (if (equal timestamp "t")
            (message (concat "Result timestamping requires a #+NAME: "
                             "and a ':results output' argument.")))))))

;; org-roam
(defun xy/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun xy/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (xy/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

;;;###autoload
(defun xy/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files
	(delete-dups (xy/org-roam-list-notes-by-tag "PROJECT"))))

(defun xy/org-roam-project-finalize-hook ()
  "Adds the captured project file to `org-agenda-files' if the
capture was not aborted."
  ;; Remove the hook since it was added temporarily
  (remove-hook 'org-capture-after-finalize-hook #'xy/org-roam-project-finalize-hook)

  ;; Add project file to the agenda list if the capture was confirmed
  (unless org-note-abort
    (with-current-buffer (org-capture-get :buffer)
      (add-to-list 'org-agenda-files (buffer-file-name)))))

;;;###autoload
(defun xy/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'xy/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (xy/org-roam-filter-by-tag "PROJECT")
   :templates
   '(("p" "project" plain "** TODO %?"
      :target
      (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                     "#+title: ${title}
#+category: ${title}
#+filetags: PROJECT
* Tasks
:PROPERTIES:
:ROAM_EXCLUDE: t
:END:
" ("Tasks"))))))

;;;###autoload
(defun xy/org-roam-find-hub ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'xy/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (xy/org-roam-filter-by-tag "hub")
   :templates
   '(("d" "default" plain "** TODO %?"
      :target
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                     "#+title: ${title}
#+category: ${title}
#+filetags: hub
")))))

;; REF: https://systemcrafters.net/build-a-second-brain-in-emacs/5-org-roam-hacks/
;;;###autoload
(defun xy/org-roam-node-insert-immediate (arg &rest args)
  "Create a new node and insert a link in the current document without opening the new node's buffer."
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))
