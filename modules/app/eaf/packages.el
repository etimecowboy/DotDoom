;; -*- no-byte-compile: t; -*-
;;; app/eaf/packages.el

(package! eaf
          :recipe
          (:host github
           :repo "emacs-eaf/emacs-application-framework"
           :files ("*" "core/*.el" "extension/*.el")))
