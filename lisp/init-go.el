;;; package --- golang
;;; Commentary:
;;; Code:

;; (defvar my-go-packages
;;   '(;;; Go tools
;;     go-mode
;;     go-eldoc
;;     company-go               ;go get -u github.com/nsf/gocode
;;     go-direx                  ;go get -u github.com/jstemmer/gotags
;;     golint                    ;go get -u github.com/golang/lint/golint
;;     go-guru                   ;go get -u golang.org/x/tools/cmd/guru
;;     go-projectile
;;     )
;;   "My packages for go!")

;; (dolist (package my-go-packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))


(require-package 'go-mode)
(require-package 'go-eldoc)
(require-package 'company-go)               ;go get -u github.com/nsf/gocode
(require-package 'go-direx)                  ;go get -u github.com/jstemmer/gotags
(require-package 'golint)                    ;go get -u github.com/golang/lint/golint
(require-package 'go-guru)                   ;go get -u golang.org/x/tools/cmd/guru
(require-package 'go-projectile)

(defun go-mode-setup ()
  "My go setup."
  (setq compile-command "go build -v && go test -v && go vet")
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (setenv "GOPATH" "/Users/wumeng/go")
  (setq tab-width 4)
  )

(add-hook 'go-mode-hook 'go-mode-setup)

;;; guru
(require 'go-guru)
(go-guru-hl-identifier-mode)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

;;; projectile
(require 'go-projectile)

;; ;;; auto-complete
;; (ac-config-default)
;; (require 'auto-complete-config)
;; (require 'go-autocomplete)

;;; company-go
(require 'company-go)

;;(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

;;; tree style viewer
(require 'go-direx)
(define-key go-mode-map (kbd "C-c C-j") 'go-direx-pop-to-buffer)
;; popwin
;; (setq display-buffer-function 'popwin:display-buffer)
;; (push '("^\*go-direx:" :regexp t :position right :width 0.4 :dedicated t :stick t)
;;       popwin:special-display-config)

(provide 'init-go)
;;; init-go.el ends here
