;;; tools/lsp-bridge/config.el -*- lexical-binding: t; -*-

;; (use-package! lsp-bridge
;;               :config
;;               (map! :map acm-mode-map
;;                     [tab]           #'acm-select-next
;;                     [backtab]       #'acm-select-prev)
;;               (map! :map doom-leader-code-map
;;                     :desc "LSP Rename"
;;                     "r"             #'lsp-bridge-rename
;;                     :desc "LSP Find declaration"
;;                     "j"             #'lsp-bridge-find-def)
;;               (require 'yasnippet)
;;               (yas-global-mode 1)
;;               (global-lsp-bridge-mode))

;; (customize-set-variable 'company-global-modes
;;                         (append company-global-modes '(python-mode)))

(use-package! lsp-bridge
              :hook
              (sh-mode . lsp-bridge-mode)
              (python-mode . lsp-bridge-mode)
              (emacs-lisp-mode . lsp-bridge-mode)
              (lisp-interaction-mode . lsp-bridge-mode)
              (c-mode . lsp-bridge-mode)
              (c++-mode . lsp-bridge-mode)
              ;; :init
              ;;(setq acm-enable-citre t)
              :config
              (setq lsp-bridge-c-lsp-server "ccls"
                    lsp-bridge-python-lsp-server "pyright"
                    lsp-bridge-tex-lsp-server "texlab")
              ;; (global-lsp-bridge-mode)
              )

(unless (display-graphic-p)
  (after! acm
          (use-package! acm-terminal)))
