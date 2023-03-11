;;; app/eaf/config.el -*- lexical-binding: t; -*-

(use-package! eaf
              :config
              ;; (setq eaf-dir (file-name-directory (locate-library "eaf")))
              ;; (add-to-list 'load-path (concat eaf-dir "core/"))
              ;; (let ((default-directory (concat eaf-dir "app/")))
              ;;   (normal-top-level-add-subdirs-to-load-path))
              (setq eaf-apps-to-install
                    '(browser
                      pdf-viewer
                      music-player
                      video-player
                      image-viewer
                      system-monitor
                      terminal
                      git
                      map
                      rss-reader
                      mindmap
                      markmap
                      markdown-previewer
                      org-previewer
                      ;;file-manager
                      ;;file-browser
                      ))
              (require 'eaf-browser)
              (require 'eaf-pdf-viewer)
              (require 'eaf-music-player)
              (require 'eaf-video-player)
              (require 'eaf-image-viewer)
              (require 'eaf-system-monitor)
              (require 'eaf-terminal)
              (require 'eaf-git)
              (require 'eaf-map)
              (require 'eaf-rss-reader)
              (require 'eaf-mindmap)
              (require 'eaf-markmap)
              (require 'eaf-markdown-previewer)
              (require 'eaf-org-previewer)
              (require 'eaf-org-previewer)
              ;; (require 'eaf-file-manager)
              (require 'eaf-org)

              ;; eaf-terminal
              ;; override function eaf-ipython-command to use ipython3
              (defun eaf-ipython-command ()
                (if (eaf--called-from-wsl-on-windows-p)
                    "ipython.exe"
                  "ipython3"))
              (setq eaf-terminal-font-family "Cascadia Code"
                    eaf-terminal-font-size 14)
              (add-to-list 'eaf-terminal-keybinding
                           '("M-z" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding
               '("C-\\" . "eaf-send-key-sequence"))
              ;; zellij
              (add-to-list 'eaf-terminal-keybinding '("C-g" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("C-t" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("C-s" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("C-h" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("C-q" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("M-n" . "eaf-send-key-sequence"))
              ;; (add-to-list 'eaf-terminal-keybinding '("M-<up>" . "eaf-send-key-sequence"))
              ;; (add-to-list 'eaf-terminal-keybinding '("M-<down>" . "eaf-send-key-sequence"))
              ;; (add-to-list 'eaf-terminal-keybinding '("M-<left>" . "eaf-send-key-sequence"))
              ;; (add-to-list 'eaf-terminal-keybinding '("M-<right>" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("M-h" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("M-j" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("M-k" . "eaf-send-key-sequence"))
              (add-to-list 'eaf-terminal-keybinding '("M-l" . "eaf-send-key-sequence"))
              ;; (add-to-list 'eaf-terminal-keybinding '("M-+" . "eaf-send-key-sequence"))
              ;; (add-to-list 'eaf-terminal-keybinding '("M--" . "eaf-send-key-sequence"))

              ;; eaf-browser
              (setq eaf-browser-default-search-engine "google" ;; 设定eaf默认搜索引擎
                    eaf-browser-enable-adblocker t   ;; 设定eaf开启广告屏蔽器
                    eaf-browser-default-zoom 1.2 ;; 设定eaf浏览器的缩放
                    eaf-webengine-download-path "~/下载/eaf-browser"
                    eaf-proxy-type "socks5"
                    eaf-proxy-host "127.0.0.1"
                    eaf-proxy-port "7890")
              (add-to-list 'eaf-browser-keybinding '("C" . "+eaf/open-current-webpage-in-chrome"))
              (add-to-list 'eaf-browser-keybinding '("w" . "eaf-get-path-or-url"))
              (add-to-list 'eaf-browser-keybinding '("C-c C-l" . "eaf-org-store-link"))
              (+eaf-set-eaf-browser-as-default)
              )
