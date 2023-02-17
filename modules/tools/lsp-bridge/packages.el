;; -*- no-byte-compile: t; -*-
;;; tools/lsp-bridge/packages.el

;; REF: https://emacs-china.org/t/lsp-bridge/20786/2192
(package! lsp-bridge
          :recipe (:host github :repo "manateelazycat/lsp-bridge" :files ("*")))
(package! acm
          :recipe (:host github :repo "manateelazycat/lsp-bridge" :files ("acm")))

;; 如果没有上面这一行，安装 acm-terminal 的时候 doom sync 会报错，提示找不到 acm
;; 这个包，不装 acm-terminal 不需要这奇怪的一行

(package! popon)
(package! acm-terminal
          :recipe (:host github :repo "twlz0ne/acm-terminal"))
