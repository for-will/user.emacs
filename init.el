;;; init.el -- emacs init config ;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list
 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq-default tab-width 8)

(setq-default indent-tabs-mode t)

;;; 高亮当前行
(global-hl-line-mode t)

;;; 括号自动配对
(electric-pair-mode t)

;;; 关闭生成备份文件
(setq make-backup-files nil)

;;; 最近打开的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 20)

					; 其它配置文件加载
(require 'init-const)
(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)

(require 'init-company)
(require 'init-themes)
(require 'init-evil)
(require 'init-keys)
;; (require 'init-lsp)


					; 窗口居中
(modify-frame-parameters
 nil '((top . 0.5) (left . 0.5)))

(org-babel-load-file
 (expand-file-name "myinit.org" user-emacs-directory))

;; (electric-indent-mode -1)

					; C语言开发环境
(require 'my-clang)


					; Smart Input Source
(use-package sis
  ;; :hook
  ;; enable the /context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))

  :config
  ;; For MacOS
  (sis-ism-lazyman-config

   ;; English input source may be: "ABC", "US" or another one.
   ;; "com.apple.keylayout.ABC"
   "com.apple.keylayout.ABC"
   ;; Other language input source: "rime", "sogou" or another one.
   ;; "im.rime.inputmethod.Squirrel.Rime"
   "com.baidu.inputmethod.BaiduIM.wubi")
  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )

					; 保存历史，记住上个命令
(use-package savehist
  :ensure nil
  :hook
  (after-init . savehist-mode)
  :init
  (setq enable-recursive-minibuffers t ; Allow command in minibuffers
	history-length 1000
	savehist-additional-variables
	'(mark-ring global-mrk-ring search-ring
		    regrexp-search-ring extended-command-history)
	savehist-autosave-interval 300))

(use-package saveplace
  :ensure nil
  :hook
  (after-init . save-place-mode))
					; 语法
;; (use-package treesit-auto
;;   :demand t
;;   :config
;;   (setq treesit-auto-install 'prompt
;; 	treesit-font-lock-level 4)
;;   (global-treesit-auto-mode t))

;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here