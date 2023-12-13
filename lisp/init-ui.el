;;; init-ui --- about ui
;;; Commentary:
;;; Code:

(tool-bar-mode -1)



;;显示行号
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type t) ; relative or visual


;; 设置字体
(set-face-attribute
 'default nil
 :height 160
 :underline nil
 ;family "Monospace"
 :family "Hack Nerd Font")



;; 让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(provide 'init-ui)
;;; init-ui.el ends here
