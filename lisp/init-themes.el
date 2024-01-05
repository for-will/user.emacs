;;; init-theme.el --- 配色
;;; Commentary:
;;; Code:

;; (use-package solarized-theme
;;   :init
;;   (load-theme 'solarized-light t))

;; (use-package dracula-theme
  ;; :init
  ;; (load-theme 'dracula t))

(use-package doom-themes
  :ensure t
  :init
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

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
   (project-find-file (:not posframe))
   (t (:not posframe))))
   ;; (t posframe
    ;; (vertico-posframe-poshandler . posframe-poshandler-frame-center)
    ;; (vertico-posframe-truncate-lines . t)
    ;; (vertico-posframe-border-width . 2)
    ;; (vertico-posframe-fallback-mode . vertico-buffer-mode))))

;; 显示不下时自动换行
(setq
 ;vertico-posframe-truncate-lines nil
 vertico-posframe-border-width 2)


(vertico-multiform-mode t)

;; vertico 下使用jk选择
(define-key vertico-map (kbd "C-j") 'vertico-next)
(define-key vertico-map (kbd "C-k") 'vertico-previous)


                                        ; ALL THE ICONS
(use-package all-the-icons)
;; (use-package all-the-icons
;;   :if (display-graphic-p))

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
;;   :init
;;   (setq sml/no-confirm-load-theme t
;; 	sml/theme 'respectful)
;;   (sml/setup))

(use-package counsel-projectile
  :ensure t
  :init (counsel-projectile-mode t))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init
  (all-the-icons-ivy-rich-mode t)
  :config
  (setq all-the-icons-ivy-rich-icon t
	all-the-icons-ivy-rich-color-icon t
	all-the-icons-ivy-rich-project t)
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-d") 'ivy-switch-buffer-kill))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))


;;; 使用悬浮窗口
;; (use-package ivy-posframe
;;   :if (display-graphic-p)
;;   :init
;;   (ivy-posframe-mode t))


(provide 'init-themes)
;;; init-themes.el ends here
