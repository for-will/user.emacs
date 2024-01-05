;;; init-package --- manage packages
;;; Commentary:
;;; Code:

                                        ; try
(use-package try)

(use-package counsel)


(use-package restart-emacs)

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))

(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))


					;语法检查
(use-package flycheck
  :hook (after-init . global-flycheck-mode))

(use-package which-key
  :defer nil
  :init
  (setq which-key-idle-delay 0.7
	which-key-idle-secondary-delay 0)
  :config
  (which-key-mode t))



;; 增强minibuffer补全：vertico和Orderless
(use-package vertico
  :init
  :hook (after-init . vertico-mode))

(use-package vertico-posframe
  :init
  (setq vertico-posframe-parameters
        '((left-fringe . 0)
          (right-fringe . 0)))
  :hook (after-init . vertico-posframe-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        orderless-component-separator "[ .&]"))

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

;;;
(provide 'init-package)
;;; init-package.el ends here

