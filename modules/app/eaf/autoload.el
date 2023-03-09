;;; app/eaf/autoload.el -*- lexical-binding: t; -*-

;;
;; Library

;;;###autoload
(defun +eaf-set-eaf-browser-as-default ()
  "Set the default web browser as eaf-browser"
  (setq ;; browse-url-default-browser 'eaf-open-browser
        browse-url-browser-function 'eaf-open-browser
        engine/browser-function 'eaf-open-browser)
  (message "The default web browser is set to eaf-browser."))

;;;###autoload
(defun +eaf-set-google-chrome-as-default ()
  "Set the default web browser to be google-chrome"
  (setq  ;; browse-url-default-browser 'browse-url-generic
         browse-url-browser-function 'browse-url-generic
         engine/browser-function 'browse-url-generic
         browse-url-generic-program "google-chrome")
  (message "The default web browser is set to google-chrome."))

;;
;; Commands

;;;###autoload
(defun +eaf/toggle-eaf-browser ()
  "Toggle the default web browser between eaf-browser and google-chrome"
  (interactive)
  (if (eq browse-url-browser-function 'eaf-open-browser)
      (xy/set-google-chrome-as-default)
    (xy/set-eaf-browser-as-default)))

;;;###autoload
(defun +eaf/open-current-webpage-in-chrome ()
  "Open current webpage in Chrome browser, in case when you need a advanced web browser."
  (interactive)
  (browse-url-chrome eaf--buffer-url))
