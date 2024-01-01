;;; init-starup --- base config
;;; Commentary:
;;; Code:

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf8)
(unless *is-windows*
  (set-selection-coding-system 'utf-8))

(setq gc-cons-threshold most-positive-fixnum)

(setq inhibit-startup-screen t)

(provide 'init-startup)

;;; init-startup.el ends here
