;;; init-awesome-tab --- awesome tab config
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "pkg/awesome-tab" user-emacs-directory))

					; awesome-tab

(require 'awesome-tab)
(awesome-tab-mode t)

(defun awesome-tab-buffer-groups ()
  "`awesome-tab-buffer-groups' control buffers' group rules.

Group awesome-tab with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `awesome-tab-get-group-name' with project name."
  (list
   (cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
         (memq major-mode '(magit-process-mode magit-status-mode magit-diff-mode magit-log-mode magit-file-mode magit-blob-mode magit-blame-mode)))
     "Emacs")
    ((derived-mode-p 'eshell-mode) "EShell")
    ;((derived-mode-p 'emacs-lisp-mode) "Elisp")
    ((derived-mode-p 'dired-mode) "Dired")
    (t (awesome-tab-get-group-name (current-buffer)))
    ;((memq major-mode '(org-mode org-agenda-mode diary-mode)) "OrgMode")
    )))

(defun awesome-tab-hide-tab (x)
  (let ((name (format "%s" x)))
    (or
     ;; Hide tab if current window is not dedicated window.
     (window-dedicated-p (selected-window))

     (string-prefix-p "*which-key*" name)

     ;; Hide sdcv tab.
     (string-prefix-p "*sdcv" name)

     ;; Hide tab if current buffer is helm buffer.
     (string-prefix-p "*helm" name)

     ;; Hide tab if current buffer is flycheck buffer.
     (string-prefix-p "*flycheck" name)
     (string-prefix-p "*Flycheck" name)

     ;; Hide blacklist if emacs version < 27 (use header-line).
     (and (eq awesome-tab-display-line 'header-line)
          (or (string-prefix-p "*Compile-Log*" name)
              (string-prefix-p "*Flycheck" name)))
     )))

(setq awesome-tab-show-tab-index nil)

;;;
(provide 'init-awesome-tab)
;;; init-awesome-tab.el ends here

