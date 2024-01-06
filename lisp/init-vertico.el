;;; init-vertico.el --- vertico-posframe
;;; Commentary:
;;; Code:

;; 增强minibuffer补全：vertico和Orderless
(use-package vertico
  :init (vertico-mode t)
  :bind (:map vertico-map ;; vertico 下使用jk选择
	 ("C-j" . 'vertico-next)
	 ("C-k" . 'vertico-previous)))


;; (use-package vertico-posframe
;;   :config
;;   ;; (setq vertico-posframe-truncate-lines nil) ;; 显示不下时自动换行
;;   (setq vertico-posframe-border-width 4)
;;   (setq vertico-posframe-parameters '((left-fringe . 0) (right-fringe . 0)))
;;   (setq vertico-multiform-commands
;; 	'((consult-line posframe
;; 			(vertico-posframe-poshandler . posframe-poshandler-window-top-center)
;; 			(vertico-posframe-fallback-mode . vertico-buffer-mode))
;; 	  (consult-imenu-multi posframe
;; 			       (vertico-posframe-poshandler . posframe-poshandler-frame-bottom-center)
;; 			       (vertico-posframe-truncate-lines . t)
;; 			       (vertico-posframe-border-width . 2)
;; 			       (vertico-posframe-fallback-mode . vertico-buffer-mode))
;; 	  (counsel-find-file posframe
;; 			     (vertico-posframe-poshandler . posframe-poshandler-frame-bottom-center)
;; 			     (vertico-posframe-truncate-lines . nil)
;; 			     (vertico-posframe-fallback-mode . vertico-buffer-mode))
;; 	  (t posframe
;; 	     (vertico-posframe-poshandler . posframe-poshandler-frame-center)
;; 	     (vertico-posframe-truncate-lines . t)
;; 	     (vertico-posframe-border-width . 2)
;; 	     (vertico-posframe-fallback-mode . vertico-buffer-mode))))
;;   :init
;;   (vertico-multiform-mode nil)
;;   (vertico-posframe-mode nil))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        orderless-component-separator "[ .&]"))


(provide 'init-vertico)
;;; init-vertico.el ends here
