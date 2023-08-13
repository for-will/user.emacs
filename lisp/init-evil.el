;;; init-evil.el --- 配置Evi
;;; Commentary:
;;; Code:
					; 安装Evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (with-eval-after-load 'evil-maps (define-key evil-motion-state-map (kbd "RET") nil))  ;; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode
  (evil-mode)
  ;; :config
  ;; (evil-set-undo-system 'undo-tree)
  )

;; Install Undo Tree

;; (use-package undo-tree
;;   :ensure t
;;   :init
;;   (global-undo-tree-mode t)
;;   (undo-tree-mode t)
;;   (setq undo-tree-auto-save-history nil))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode t)
  :config
  (setq undo-tree-visualizer-diff t
	undo-tree-auto-save-history nil
	undo-tree-enable-undo-in-region t
	undo-limit 800000           ; 800kb (default is 160kb)
	undo-strong-limit 12000000  ; 12mb
	undo-outer-limit 128000000) ; 128mb
  (evil-set-undo-system 'undo-tree))

;; 快捷键设置
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)


  (define-key evil-normal-state-map (kbd "[ SPC") (lambda () (interactive) (evil-insert-newline-above) (forward-line)))

  (define-key evil-normal-state-map (kbd "] SPC") (lambda () (interactive) (evil-insert-newline-below) (forward-line -1)))



  (define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "] b") 'next-buffer)
  (define-key evil-motion-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-motion-state-map (kbd "] b") 'next-buffer)

(evil-define-key 'normal dired-mode-map
  (kbd "<ret>") 'dired-find-alternate-file
  (kbd "c-k") 'dired-up-directory
  "`" 'dired-open-term
  "o" 'dired-find-file-other-window
  "s" 'hydra-dired-quick-sort/body
  "z" 'dired-get-size
  "!" 'zilongshanren/do-shell-and-copy-to-kill-ring
  ")" 'dired-omit-mode)

					; spaceemacs like 快捷键定义
;; (use-package general
;;   :init
;;   (with-eval-after-load 'evil
;;     (general-add-hook 'after-init-hook
;; 		      (lambda (&rest _)
;; 			(when-let ((messages-buffer (get-buffer "*Messages*")))
;; 			  (with-current-buffer messages-buffer
;; 			    (evil-normalize-keymaps))))
;; 		      nil
;; 		      nil
;; 		      t))


;;   (general-create-definer global-definer
;;     :keymaps 'override
;;     :states '(insert emacs normal hybrid motion visual operator)
;;     :prefix "SPC"
;;     :non-normal-prefix "C-SPC")

;;   (defmacro +general-global-menu! (name infix-key &rest body)
;;     "Create a definer named +general-global-NAME wrapping global-definer.
;; Create prefix map: +general-global-NAME. Prefix bindings in BODY with INFIX-KEY."
;;     (declare (indent 2))
;;     `(progn
;;        (general-create-definer ,(intern (concat "+general-global-" name))
;; 	 :wrapping global-definer
;; 	 :prefix-map ',(intern (concat "+general-global-" name "-map"))
;; 	 :infix ,infix-key
;; 	 :wk-full-keys nil
;; 	 "" '(:ignore t :which-key ,name))
;;        (,(intern (concat "+general-global-" name))
;; 	,@body)))

;;   (general-create-definer global-leader
;;     :keymaps 'override
;;     :states '(emacs normal hybrid motion visual operator)
;;     :prefix ","
;;     "" '(:ignore t :which-key (lambda (arg) `(,(cadr (split-string (car arg) " ")) . ,(replace-regexp-in-string "-mode$" "" (symbol-name major-mode)))))))

;; (use-package general
;;   :init
;;   (global-definer
;;     "!" 'shell-command
;;     "SPC" 'execute-extended-command
;;     "'" 'vertico-repeat
;;     "+" 'text-scale-increase
;;     "-" 'text-scale-decrease
;;     "u" 'universal-argument
;;     "hdf" 'describe-function
;;     "hdv" 'describe-variable
;;     "hdk" 'describe-key
;;     )

;;   (+general-global-menu! "buffer" "b"
;;     "d" 'kill-current-buffer
;;     "b" '(consult-buffer :whch-key "consult buffer")
;;     "B" 'switch-to-buffer
;;     "p" 'previous-buffer
;;     "R" 'rename-buffer
;;     "M" '((lambda () (interactive) (switch-to-buffer "*Messages*"))
;; 	  :which-key "messages-buffer")
;;     "n" 'next-buffer
;;     "i" 'ibuffer
;;     "f" 'my-open-current-directory
;;     "k" 'kill-buffer
;;     "y" 'copy-buffer-name
;;     "K" 'kill-other-buffers)

					; evil-anzu
(use-package evil-anzu
  :ensure t
  :after evil
  :init
  (global-anzu-mode t))

					; 多光标操作
(use-package iedit
  :ensure t
  :init
  (setq iedit-toggle-key-default nil)
  :config
  (define-key iedit-mode-keymap (kbd "M-h") 'iedit-restrict-function)
  (define-key iedit-mode-keymap (kbd "M-i") 'iedit-restrict-current-line))

(use-package evil-multiedit
  :ensure t
  :commands (evil-multiedit-default-keybinds)
  :init
  (evil-multiedit-default-keybinds))


;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-evil)
;;; init-evil.el ends here
