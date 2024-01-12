;;; init.el -- emacs init config ;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;;;;;
(add-to-list
 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

					; 其它配置文件加载
(require 'init-startup)
(require 'init-vars)
(require 'init-proxy)
(require 'init-options)
(require 'init-fonts)
(require 'init-package)
(require 'init-ui)
(require 'init-themes)
(require 'init-evil)
(require 'init-keys)
(require 'init-lsp)
(require 'init-company)
(require 'init-sis)
(require 'init-awesome-tab)
(require 'init-vertico)
(require 'init-prog)


;; (use-package treesit-auto
;;   :demand t
;;   :config
;;   (setq treesit-auto-install 'prompt)
;;   (global-treesit-auto-mode t))

;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
