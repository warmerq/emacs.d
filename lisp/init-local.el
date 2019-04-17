;;; init-local.el --- My own Configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; my own packages

;;; $PATH
(setenv "PATH" (concat (getenv "PATH") ":/Users/wumeng/bin:/Users/wumeng/go/bin"))



;;; osx keys
(when *is-a-mac*
  (setq mac-command-modifier 'control)
  (setq mac-right-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq mac-right-option-modifier 'alt)
  )

(global-set-key (kbd "M-h") 'mark-paragraph)


;;; fonts
(set-default-font "Monaco-13")
(require 'init-cnfonts)


;;; wechat miniprogram
(add-auto-mode 'nxml-web-mode "\\.wxml\\'")


;;; es6 js, missing semicolons would not be reported as lint errors
(setq js2-strict-missing-semi-warning nil)



;;; golang
(require 'init-go)


;;; editing the textarea in Chrome
(require 'atomic-chrome)
(setq atomic-chrome-url-major-mode-alist
      '(("github\\.com" . gfm-mode)
        ("redmine" . textile-mode)
        ("tapd\\.cn" . markdown-mode)))
(atomic-chrome-start-server)

(provide 'init-local)
;;; init-local.el ends here
