;;; init-starup --- base config
;;; Commentary:
;;; Code:

;; add linux brew bin path to exec-path
(setq exec-path (append '("/home/linuxbrew/.linuxbrew/bin") exec-path))

;; packages
(use-package package
  :hook after-init-hook
  :config
  ;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (setq package-archives
	'(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	  ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
  :init
  (unless (bound-and-true-p package--initialized)
    (package-initialize)))

(provide 'init-startup)
;;; init-startup.el ends here
