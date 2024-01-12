;;; init-package --- manage packages
;;; Commentary:
;;; Code:

;; Third part packages
;; make use-package default behavior better
;; with `use-package-always-ensure' you won't need ":ensure t" all the time
;; with `use-package-always-defer' you won't need ":defer t" all the time
(setq use-package-always-ensure t
      use-package-enable-imenu-support t
      use-package-expand-minimally t)

;; Settings for exec-path-from-shell
;; fix the PATH environment variable issue
(use-package exec-path-from-shell
  :ensure t
  :when (or (memq window-system '(mac ns x))
	    (unless azi-os-win
	      (daemonp)))
  :init (exec-path-from-shell-initialize))

;; format all, formatter for almost languages
;; great for programmers
(use-package format-all
  :ensure t
  ;; enable format on save with format-all-mode
  ;; :hook ((prog-mode . format-all-mode)
  ;; 	   (format-all-mode . format-all-ensure-formatter))
  ;; and bind a shortcut to manual format
  :bind ("C-c f" . #'format-all-region-or-buffer))

;; move-dup, move/copy line or region
(use-package move-dup
  :ensure t
  :hook (after-init . global-move-dup-mode))

;; Settings for which-key - sugest next key
(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0.7
	which-key-idle-secondary-delay 0)
  :hook (after-init . which-key-mode))

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

                                        ; try
(use-package try)

(use-package counsel)

(use-package restart-emacs)

(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))

(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))


					;语法检查
(use-package flycheck
  :hook (after-init . global-flycheck-mode))





;; 配置Marginalia增强minbuffer的annotation
(use-package marginalia
  :init (marginalia-mode))

;; minibuffer action 和自适应的context menu: Embark
(use-package embark
  :init (setq prefix-help-command 'embark-prefix-help-command)
  :bind (("C-;" . embark-act)))

;; 增强文件内搜索和跳转函数定义：Consult
(use-package consult
  :bind (("C-s" . consult-line)))

(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package avy
  :ensure t)

;;;
(provide 'init-package)
;;; init-package.el ends here
