;;; $DOOMDIR/config-basic.el -*- lexical-binding: t; -*-

;; NOTE: moved from `config.el'

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Xin Yang"
      user-mail-address "alan_xyang@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 14 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "Adobe Fangsong Std" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; set time locale to standard format, avoid chinese time stamps in org mode.
;; another solution is (setenv "LC_ALL" "C")
(setq-default system-time-locale "C") ;; TODO test it whether works or I have to put it to init.el

;; Automatically update timestamp of files
(setq time-stamp-start "Time-stamp:"  ;; my time-stamp prompt
      time-stamp-end "\n"
      time-stamp-format " <%Y-%02m-%02d %3a %02H:%02M by %u on %s>"
      time-stamp-time-zone t)

(add-hook! 'write-file-functions #'time-stamp)

;; Maximize or fullscreen Emacs on startup for fixing eaf-video-player bug.
;; REF: https://discourse.doomemacs.org/t/maximize-or-fullscreen-emacs-on-startup/135
;;(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;;(add-hook 'window-setup-hook #'toggle-frame-maximized)
;;(add-hook 'window-setup-hook #'toggle-frame-fullscreen)
(toggle-frame-fullscreen)
