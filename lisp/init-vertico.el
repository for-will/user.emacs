;;; init-vertico.el --- vertico-posframe
;;; Commentary:
;;; Code:

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

                                        ; vertico 设置
(setq vertico-multiform-commands
 '((consult-line posframe
    (vertico-posframe-poshandler . posframe-poshandler-window-top-center)
    (vertico-posframe-fallback-mode . vertico-buffer-mode))
   (consult-imenu-multi posframe
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
 vertico-posframe-border-width 20)


(vertico-multiform-mode t)

;; vertico 下使用jk选择
(define-key vertico-map (kbd "C-j") 'vertico-next)
(define-key vertico-map (kbd "C-k") 'vertico-previous)

;; (custom-set-faces
 ;; '(vertico-posframe-border
   ;; ((t (:background "#75715E" :weight bold)))))


(provide 'init-vertico)
;;; init-vertico.el ends here
