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
              (python-mode . lsp-bridge-mode)
              ;; :init
              ;;(setq acm-enable-citre t)
              ;; :config
              ;; (global-lsp-bridge-mode)
              )

(unless (display-graphic-p)
  (after! acm
          (use-package! acm-terminal)))