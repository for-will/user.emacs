;;; init-theme.el --- 配色
;;; Commentary:
;;; Code:

;; (use-package solarized-theme
;;   :init
;;   (load-theme 'solarized-light t))

(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft t))

;; (use-package monokai-theme
;;  :init (load-theme 'monokai t))

;; (use-package dracula-theme
  ;; :init
  ;; (load-theme 'dracula t))

(use-package posframe)


                                        ; vertico 设置
(setq vertico-multiform-commands
 '((consult-line posframe
    (vertico-posframe-poshandler . posframe-poshandler-window-top-center)
    (vertico-posframe-fallback-mode . vertico-buffer-mode))
   (consult-imenu-multi vertico-buffer-mode
    (vertico-posframe-poshandler . posframe-poshandler-frame-bottom-center)
    (vertico-posframe-truncate-lines . t)
    (vertico-posframe-border-width . 2)
    (vertico-posframe-fallback-mode . vertico-buffer-mode))
   (counsel-find-file posframe
    (vertico-posframe-poshandler . posframe-poshandler-frame-bottom-center)
    (vertico-posframe-truncate-lines . nil)
    (vertico-posframe-fallback-mode . vertico-buffer-mode))
   (t posframe
    (vertico-posframe-poshandler . posframe-poshandler-frame-center)
    (vertico-posframe-truncate-lines . t)
    (vertico-posframe-border-width . 2)
    (vertico-posframe-fallback-mode . vertico-buffer-mode))))

;; 显示不下时自动换行
(setq
 ;vertico-posframe-truncate-lines nil
 vertico-posframe-border-width 2)


(vertico-multiform-mode t)

;; vertico 下使用jk选择
(define-key vertico-map (kbd "C-j") 'vertico-next)
(define-key vertico-map (kbd "C-k") 'vertico-previous)

(custom-set-faces
 '(vertico-posframe-border
   ((t (:background "#75715E" :weight bold)))))

                                        ; ALL THE ICONS
(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-ivy-rich
  :if (display-graphic-p)
  :init
  (all-the-icons-ivy-rich-mode t))

(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (setq column-number-mode t))

;; 显示按键和执行的命令
;; (use-package keycast
;;   :hook (after-init . keycast-mode))
(unless (package-installed-p 'keycast)
  (package-install 'keycast))
(require 'keycast)
;; (add-to-list 'global-mode-string '("" keycast-mode-line))
(keycast-mode-line-mode t)
;; (keycast-mode-line-mode 0)
;; (add-hook 'post-command-hook 'keycast--update t)

;; (default-value keycast-mode-line)
;; (list 'keycast-mode-line)

;; (funcall keycast-mode-line-window-predicate)

;;      (keycast--format keycast-mode-line-format)


					; doom mode line
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode t))

;; (use-package smart-mode-line
  ;; :init
  ;; (setq sml/no-confirm-load-theme t
	;; sml/theme 'respectful)
  ;; (sml/setup))
 

(use-package all-the-icons-ivy-rich
  :init
  (all-the-icons-ivy-rich-mode t)
  (ivy-rich-mode t)
  (ivy-mode t)
  :config
  (ivy-mode nil)
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-d") 'ivy-switch-buffer-kill))

(ivy-mode -1)

(use-package ivy-posframe
  :init
  (ivy-posframe-mode t))

;; (ivy-set-display-transformer 'ivy-switch-buffer 'all-the-icons-ivy-buffer-transformer)
;; (ivy-set-display-transformer 'counsel-find-file 'all-the-icons-ivy-file-transformer)
;; (ivy-set-display-transformer 'counsel-find-file nil)
;; (all-the-icons-ivy-setup)
;; (ivy-set-display-transformer 'counsel-find-file 'all.the.icons.transfo x)


(provide 'init-themes)
;;; init-themes.el ends here
