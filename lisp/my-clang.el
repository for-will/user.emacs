;;; my-clang.el --- 配置c语言相关
;;; Commentary:

;;; Code:


;; 插入'\t'
(defun just-insert-tab ()
  "Just insert tab."
  (interactive)
  (insert-tab))


(setq-default c-indent-comment-alist
	      '((other align . nil)
		(anchored-comment align . nil)
		(empty-line column . 0)))

;; 添加行内注释
(defun my/edit-inline-comment ()
  "Add or goto edit inline comments."
  (interactive)
  (when (eq major-mode 'c-mode)
    (c-toggle-comment-style -1)
    (evil-insert-state)
    (indent-for-comment)
    (sis-set-other)))

;; 添加多行注释
(defun my/edit-block-comment ()
  "Add or goto edit block comments."
  (interactive)
  (when (eq major-mode 'c-mode)
    (c-toggle-comment-style 1)
    (evil-insert-state)
    (indent-for-comment)
    (sis-set-other)))

		
(add-hook 'c-mode-hook
	  (lambda ()
	    ;; (c-toggle-electric-state -1)
	    ;; (electric-indent-mode -1)
	    (setq c-basic-offset tab-width
		  comment-fill-column 120
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
(add-to-list 'eglot-server-programs '((c++-mode c-mode c-ts-mode) "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
;; (add-hook 'js-mode-hook #'eglot-ensure)


;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'my-clang)
;;; my-clang.el ends here
