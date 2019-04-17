;;; init-cnfonts.el --- Chinese Font setup  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(require-package 'cnfonts)

(cnfonts-enable)

(global-set-key (kbd "C-M-=") 'cnfonts-increase-fontsize)
(global-set-key (kbd "C-M--") 'cnfonts-decrease-fontsize)

(provide 'init-cnfonts)
;;; init-cnfonts.el ends here
