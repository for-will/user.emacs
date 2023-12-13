;;; init-package --- manage packages
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "elpa-site/awesome-tab" user-emacs-directory))

                                        ; try
(use-package try)



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
        '((left-fringe . 8)
          (right-fringe , 8)))
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


;;; awesome-tab

(require 'awesome-tab)
(awesome-tab-mode t)

(defun awesome-tab-buffer-groups ()
  "`awesome-tab-buffer-groups' control buffers' group rules.

Group awesome-tab with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `awesome-tab-get-group-name' with project name."
  (list
   (cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
         (memq major-mode '(magit-process-mode magit-status-mode magit-diff-mode magit-log-mode magit-file-mode magit-blob-mode magit-blame-mode)))
     "Emacs")
    ((derived-mode-p 'eshell-mode) "EShell")
    ;((derived-mode-p 'emacs-lisp-mode) "Elisp")
    ((derived-mode-p 'dired-mode) "Dired")
    (t (awesome-tab-get-group-name (current-buffer)))
    ;((memq major-mode '(org-mode org-agenda-mode diary-mode)) "OrgMode")
    )))

(defun awesome-tab-hide-tab (x)
  (let ((name (format "%s" x)))
    (or
     ;; Hide tab if current window is not dedicated window.
     (window-dedicated-p (selected-window))

     (string-prefix-p "*which-key*" name)

     ;; Hide sdcv tab.
     (string-prefix-p "*sdcv" name)

     ;; Hide tab if current buffer is helm buffer.
     (string-prefix-p "*helm" name)

     ;; Hide tab if current buffer is flycheck buffer.
     (string-prefix-p "*flycheck" name)
     (string-prefix-p "*Flycheck" name)

     ;; Hide blacklist if emacs version < 27 (use header-line).
     (and (eq awesome-tab-display-line 'header-line)
          (or (string-prefix-p "*Compile-Log*" name)
              (string-prefix-p "*Flycheck" name)))
     )))

(setq awesome-tab-show-tab-index t)

;;;


;;;
(provide 'init-package)
;;; init-package.el ends here

