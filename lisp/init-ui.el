;;; init-ui --- about ui
;;; Commentary:
;;; Code:

;; ;; 图形化界面不显示滚动条和工具栏
;; (when (display-graphic-p)
;;   (scroll-bar-mode -1)
;;   (tool-bar-mode -1))

;; ;; 不显示菜单栏
;; (menu-bar-mode -1)

;; ;; 图标
;; (use-package all-the-icons)

;;显示行号
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type t) ; relative or visual
(global-display-line-numbers-mode t)





;; 让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(provide 'init-ui)
;;; init-ui.el ends here
