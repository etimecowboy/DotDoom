;;; tools/popweb/config.el -*- lexical-binding: t; -*-

(use-package! ivy)
(use-package! ox-hugo)
(use-package! org-transclusion)
(use-package! popweb
  :config
  (setq popweb-dir (file-name-directory (locate-library "popweb")))
  (let ((default-directory (concat popweb-dir "extension/")))
    (normal-top-level-add-subdirs-to-load-path))
  ;; (require 'popweb-color-picker) ;;FIXME: cannot load
  (require 'popweb-dict)
  (require 'popweb-latex)
  (require 'popweb-org-roam-link)
  (require 'popweb-url)
  (setq popweb-proxy-type "socks5"
        popweb-proxy-host "127.0.0.1"
        popweb-proxy-port "7890")
  )
