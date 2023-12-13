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

;; (c-ts-indent-style-safep 'line-comment-p)

(defun my-c-indent-style()
  "Override the built-in linux indentation style with some additional rules."
  `(;; Here are your custom rules
    ;; ((node-is "comment") column-0 0)

    ;; Append here the indent style you want as base.
    ,@(alist-get 'linux (c-ts-mode--indent-styles 'c))
    ))

(use-package c-ts-mode
  :custom
  (c-ts-mode-indent-offset 8)
  (c-ts-mode-indent-style #'my-c-indent-style)
  :init
  ;; Remap the standard C/C++ modes
  (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c-or-c++-mode . c-or-c++-ts-mode)))


;; (dolist (var (alist-get 'linux (c-ts-mode--indent-styles 'c)))
;;   (print var))

;; (setq c-ts-mode-indent-style #'my-c-indent-style)

;; 添加行内注释
(defun my/edit-inline-comment ()
  "Add or goto edit inline comments."
  (interactive)
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c-ts-mode))
    (c-ts-mode-toggle-comment-style -1))
    ;; (c-toggle-comment-style -1)
    (evil-insert-state)
    (indent-for-comment)
    (sis-set-other))

;; 添加多行注释
(defun my/edit-block-comment ()
  "Add or goto edit block comments."
  (interactive)
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c-ts-mode))
    (c-ts-mode-toggle-comment-style 1))
    ;; (c-toggle-comment-style 1)
    (evil-insert-state)
    (indent-for-comment)
    (sis-set-other))

		
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

(add-hook 'c-ts-mode-hook
	  (lambda ()
	    ;; (c-ts-mode-set-global-style 'linux)
	    (setq c-basic-offset tab-width
		  c-ts-mode-indent-offset tab-width
		  comment-fill-column 120
		  comment-column 48
		  )))



;; (with-eval-after-load 'c-mode
;;   (electric-indent-mode -1)
;;   (setq c-basic-offset tab-width
;; 	c-electric-flag t
;; 	c-tab-always-indent nil
;; 	c-syntactic-indentation t))

(require 'eglot)
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode c-ts-mode) "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
;; (add-hook 'js-mode-hook #'eglot-ensure)


;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'my-clang)
;;; my-clang.el ends here
