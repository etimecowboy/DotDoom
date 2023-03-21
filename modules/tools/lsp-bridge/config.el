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
              (rust-mode . lsp-bridge-mode)
              :config
              (setq lsp-bridge-dir (file-name-directory (locate-library "lsp-bridge")))
              (add-to-list 'load-path (concat lsp-bridge-dir "core/"))
              (add-to-list 'load-path (concat lsp-bridge-dir "acm/"))
              (setq lsp-bridge-c-lsp-server "ccls"
                    lsp-bridge-python-lsp-server "pyright"
                    lsp-bridge-tex-lsp-server "texlab"
                    lsp-bridge-use-ds-pinyin-in-org-mode t)
              (setq acm-enable-quick-access t
                    acm-quick-access-modifier 'control)
              ;; (global-lsp-bridge-mode)
              )

(unless (display-graphic-p)
  (after! lsp-bridge
          (use-package! acm-terminal)))

(after! company
  ;; disable company in more modes ... migrating to acm ...
  (setq company-global-modes
        '(not erc-mode circe-mode message-mode help-mode
          gud-mode vterm-mode ;; NOTE: modes above are defined in company module config.el
          emacs-lisp-mode lisp-interaction-mode
          python-mode c-mode c++-mode rust-mode sh-mode
          ))
  )
