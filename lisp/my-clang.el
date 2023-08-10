;;; my-clang.el --- 配置c语言相关
;;; Commentary:

;;; Code:


(add-hook 'c-mode-hook
	  (lambda ()
	    (define-key c-mode-map (kbd "C-<tab>") 'c-indent-line-or-region)
	    ;; (electric-indent-mode -1)
	    (setq c-basic-offset tab-width
		  c-electric-flag t
		  c-tab-always-indent nil
		  c-syntactic-indentation t)))

;; (use-package eglot
;;   :init
;;   (add-hook 'c-mode-hook 'eglot-ensure)
;;   (add-hook 'c++-mode-hook 'eglot-ensure))

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)


;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'my-clang)
;;; my-clang.el ends here
