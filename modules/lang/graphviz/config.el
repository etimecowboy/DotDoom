;;; lang/graphviz/config.el -*- lexical-binding: t; -*-

(use-package! graphviz-dot-mode
  :mode
  (("\\.diag\\'"      . graphviz-dot-mode)
   ("\\.blockdiag\\'" . graphviz-dot-mode)
   ("\\.nwdiag\\'"    . graphviz-dot-mode)
   ("\\.rackdiag\\'"  . graphviz-dot-mode)
   ("\\.dot\\'"       . graphviz-dot-mode)
   ("\\.gv\\'"        . graphviz-dot-mode))
  :init
  (setq graphviz-dot-indent-width tab-width))

  ;; TODO: add babel dot support
  ;; Maybe I have to use use-package-hook! in my private init.el,
  ;; because it overrides the org module config,
  ;; Check https://github.com/doomemacs/doomemacs/blob/develop/docs/getting_started.org#configuring-packages
  ;; :config
  ;; (when (modulep! +lang org)
  ;;   (add-to-list 'org-babel-load-languages '(dot . t))
  ;;   ;; replace fundamental mode by graphiz one
  ;;   (setq org-src-lang-modes
  ;;         (append '(("dot" . graphviz-dot))
  ;;                 (delete '("dot" . fundamental) org-src-lang-modes))))
  ;; TODO:
  ;; May be I can use (after! ob-dot) just like plantuml module config.el
