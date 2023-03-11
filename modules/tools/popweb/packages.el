;; -*- no-byte-compile: t; -*-
;;; tools/popweb/packages.el

(package! ivy)
(package! ox-hugo)
(package! org-transclusion)
(package! popweb
          :recipe (:host github
                   :repo "manateelazycat/popweb"
                   :files ("*")))

