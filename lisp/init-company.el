;;; init-company --- 设置自动补全
;;; Commentary:
;;; Code:

					;自动补全
(use-package company
  :init
  (setq
   company-minimum-prefix-length 1
   company-global-modes
   '(not erc-mode message-mode eshell-mode shell-mode)
   company-idle-delay
   (lambda()
     (cond ((eq major-mode 'js-json-mode) 0)
	   ((company-in-string-or-comment) nil)
	   (t 0))
     ;; (if (and (company-in-string-or-comment) (not (eq major-mode 'js-json-mode))) nil 0))
     ))
  :bind
  (:map
   company-active-map
   ("<tab>" . company-complete-common)
   ("<escape>" . company-abort)
   ("C-j" . company-select-next)
   ("C-k" . company-select-previous))
  :hook (after-init . global-company-mode))

(setq company-tooltip-idle-delay 0
      company-require-match nil
      company-tooltip-margin 2
      company-tooltip-minimum 4
      company-tooltip-width-grow-only t
      company-tooltip-align-annotations t
      company-tooltip-annotation-padding 1
      company-tooltip-flip-when-above t
      company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
        ;company-preview-frontend
        company-preview-common-frontend
        company-echo-metadata-frontend)
      ;; company-backends '(company-files company-capf)
      company-format-margin-function 'company-text-icons-margin
      company-text-face-extra-attributes '(:weight bold :slant italic)
      company-text-icons-add-background t
      company-show-quick-access 'right
      company-tooltip-offset-display 'lines
      )


;; company in org-mode
(defun add-pcomplete-to-capf ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(add-hook 'org-mode-hook #'add-pcomplete-to-capf)

;; 快速选择标签
(custom-set-variables
 '(company-quick-access-keys '("h" "j" "k" "l" "u" "i" "o" "p"))
 '(company-quick-access-modifier 'super))

;; 设置快速选择标签字体颜色
(custom-set-faces
 '(company-tooltip-quick-access ((t (:foreground "pink1"))))
 '(company-tooltip-quick-access-selection
   ((t (:foreground "pink1" :slant italic)))))

;; 路径补全时忽略文件
(setq company-files-exclusions '(".git/" ".DS_Store"))

;; (custom-set-faces
;;  '(company-tooltip
;;    ((t (:background "ivory" :foreground "MistyRose3"))))
;;  '(company-tooltip-selection
;;    ((t (:background "LemonChiffon1" :foreground "MistyRose4"))))
;;  '(company-tooltip-common ((t (:weight bold :foreground "pink1"))))
;;  '(company-scrollbar-fg ((t (:background "ivory3"))))
;;  '(company-scrollbar-bg ((t (:background "ivory2"))))
;;  '(company-tooltip-annotation ((t (:foreground "MistyRose2")))))

(provide 'init-company)

;;; init-company.el ends here
