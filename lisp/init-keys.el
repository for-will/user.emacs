;;; init-keys --- key bindings
;;; Commentary:
;;; Code:

(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

(global-set-key (kbd "C-\\") 'sis-set-other)

;(setq tab-always-indent 'complete)
(setq tab-always-indent 'complete)


;; 查找函数/变量
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)

;; 打开配置文件 init.el
(defun open-init-file ()
  "Open init file."
  (interactive)
  (find-file "~/.config/emacs/init.el"))

;; "cmd-o" - 切换窗口
(global-set-key (kbd "s-o") 'other-window)

;; "cmd-n" - 切换tab
(global-set-key (kbd "s-n") 'awesome-tab-forward)
(global-set-key (kbd "s-N") 'awesome-tab-backward)
(global-set-key (kbd "M-n") 'awesome-tab-backward-group)


;; cmd-, 打开配置文件
(global-set-key (kbd "s-,") 'open-init-file)

;;; "cmd-w" - 关闭当前窗口
(global-set-key (kbd "s-w") 'delete-window)

;; f1 关闭其它窗口
(global-set-key (kbd "<f1>") 'delete-other-windows)

;; f2 跳转到下一个error
(global-set-key (kbd "<f2>") 'flycheck-next-error)

;; f5运行上一行
(global-set-key (kbd "<f5>") 'eval-last-sexp)

;; win-r map to eval-buffer
(define-key global-map (kbd "s-r") 'eval-buffer)

;;; Install expand-region
(use-package expand-region)

					; general

(use-package general)


(general-create-definer my-leader-def
  :prefix "C-SPC"
  :states '(emacs motion normal insert))

(my-leader-def
 "x" 'execute-extended-command ; 
 "f" 'counsel-find-file
 "l" 'helm-buffers-list
 "i" 'consult-imenu-multi
 "s" 'consult-ripgrep
 "b" 'consult-buffer
 "u" 'xref-find-references
 "g" 'xref-find-definitions
 "v" 'er/expand-region)

(general-evil-setup)
(general-nmap
 :prefix "SPC"
 "x" 'execute-extended-command
 "f" 'counsel-find-file
 "r" 'counsel-buffer-or-recentf
 "l" 'ivy-switch-buffer-other-window
 "i" 'consult-imenu-multi
 "s" 'consult-ripgrep
 "b" 'consult-buffer
 "p" 'project-find-file
 "gu" 'xref-find-references
 "gg" 'xref-find-definitions
 "gc" 'avy-goto-char
 "gl" 'avy-goto-line
 "gw" 'avy-goto-word-0
 "ef" 'eglot-code-action-quickfix
 "v" 'er/expand-region)
 
;; 'C-j' 'C-k' 进行上下选择

(add-hook 'helm-major-mode-hook
	  (lambda ()
	    (define-key helm-map (kbd "C-j") 'helm-next-line)
	    (define-key helm-map (kbd "C-d") 'helm-next-page)
	    (define-key helm-map (kbd "C-k") 'helm-previous-line)
	    (define-key helm-map (kbd "C-u") 'helm-previous-page)))

 
;; 注释快捷键
;; (define-key evil-insert-state-map (kbd "s-/") 'comment-line)
(global-set-key (kbd "s-/") 'comment-line)


;;; 调整窗口大小

(defun add-window-width ()
  "Add window widht col."
  (interactive)
  (adjust-window-trailing-edge nil 1 t))

(defun sub-window-width ()
  "Sub window widht col."
  (interactive)
  (adjust-window-trailing-edge nil -1 t))

(defun add-window-height ()
  "Add window height 1 line."
  (interactive)
  (adjust-window-trailing-edge nil 1 nil))

(defun sub-window-height ()
  "Sub window height 1 line."
  (interactive)
  (adjust-window-trailing-edge nil -1 nil))


(global-set-key (kbd "s-<right>") 'add-window-width)
(global-set-key (kbd "s-<left>") 'sub-window-width)
(global-set-key (kbd "s-<up>") 'sub-window-height)
(global-set-key (kbd "s-<down>") 'add-window-height)

;;; 调整窗口宽度为百分之六十
(defun adjust-window-width ()
  "Adjust window width to 60 percent of frame width."
  (interactive)
  (evil-window-set-width
    (floor (* (frame-text-cols) 0.6))))


;; "cmd--" - 调整窗口宽度
(global-set-key (kbd "s--") 'adjust-window-width)


;;; 调整窗口高度为百分之六十
(defun adjust-window-height ()
  "Adjust window height to 60 percent frame height."
  (interactive)
  (set-window-text-height
    (car (window-list))
    (floor (* (frame-text-lines) 0.6))))

;; "cmd-=" - 调整窗口高度
(global-set-key (kbd "s-=") 'adjust-window-height)


;;; 调换窗口位置

(global-set-key (kbd "M-s-<right>") 'windmove-swap-states-right)
(global-set-key (kbd "M-s-<left>") 'windmove-swap-states-left)
(global-set-key (kbd "M-s-<up>") 'windmove-swap-states-up)
(global-set-key (kbd "M-s-<down>") 'windmove-swap-states-down)
(global-set-key (kbd "M-s-o") 'window-swap-states)


					; c mode 下 tab 输入

(general-define-key
 :keymaps 'c-mode-map
 "C-<tab>" 'just-insert-tab
 "C-<return>" (lambda ()
		(interactive)
		(goto-char (line-end-position))
		(c-indent-new-comment-line)))



;;aaaabb
;;(define-key c-mode-map (kbd "<tab>") (lambda () (interactive)  (insert "\t")))

;; (define-key c-mode-map (kbd "<tab>") 'self-insert-command)

(provide 'init-keys)

;;; init-keys.el ends here
