;;; init-themes.el --- themes
;;; Commentary:
;;; Code:

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


(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (setq column-number-mode t))

					; 显示按键和执行的命令
;; (use-package keycast
;;   :hook (after-init . keycast-mode))
(unless (package-installed-p 'keycast)
  (package-install 'keycast))
(require 'keycast)
;; (add-to-list 'global-mode-string '("" keycast-mode-line))
(keycast-mode-line-mode t)
;; (keycast-mode-line-mode 0)
;; (add-hook 'post-command-hook 'keycast--update t)


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

;;; 安装icons
(use-package all-the-icons-nerd-fonts
  :demand t
  :init (all-the-icons-nerd-fonts-prefer))

(use-package all-the-icons-ivy-rich
  :ensure t
  :config
  (setq all-the-icons-ivy-rich-icon t
	all-the-icons-ivy-rich-color-icon t
	all-the-icons-ivy-rich-project t)
  :init
  (all-the-icons-ivy-rich-mode t))
  

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1)
  :bind (
	 :map ivy-minibuffer-map
	 ("C-j" . 'ivy-next-line)
	 ("C-k" . 'ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . 'ivy-previous-line)
	 ("C-d" . 'ivy-switch-buffer-kill)))


;;; 使用悬浮窗口
;; (use-package ivy-posframe
;;   :if (display-graphic-p)
;;   :init
;;   (ivy-posframe-mode t))


(provide 'init-themes)
;;; init-themes.el ends here
