;;; my-clang.el --- 配置c语言相关
;;; Commentary:

;;; Code:


(defun just-insert-tab ()
  "Just insert tab."
  (interactive)
  (insert-tab))
		
(add-hook 'c-mode-hook
	  (lambda ()
	    ;; (c-toggle-electric-state -1)
	    ;; (electric-indent-mode -1)
	    (setq c-basic-offset tab-width
		  ;; c-electric-flag t
		  ;; c-tab-always-indent nil
		  ;; c-syntactic-indentation t
		  )))

;; (with-eval-after-load 'c-mode
;;   (electric-indent-mode -1)
;;   (setq c-basic-offset tab-width
;; 	c-electric-flag t
;; 	c-tab-always-indent nil
;; 	c-syntactic-indentation t))

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
;; (add-hook 'js-mode-hook #'eglot-ensure)


;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'my-clang)
;;; my-clang.el ends here
