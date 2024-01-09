;;; init-lsp --- setup LSP
;;; Commentary:

;;; Code:

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details

;; (helm-mode)
;; (require 'helm-xref)
;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)

;; (which-key-mode)
;; (add-hook 'c-mode-hook 'lsp-deferred)
;; (add-hook 'c++-mode-hook 'lsp-deferred)
(add-hook 'js-mode-hook 'lsp-deferred)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      ;; treemacs-space-between-root-nodes nil
      ;; company-idle-delay 0.0
      ;; company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

;; (add-hook 'c-mode-hook
;; 	  (lambda ()
;; 	    (setq c-basic-offset 8
;; 		  c-electric-flag nil
;; 		  c-tab-always-indent nil
;; 		  c-syntactic-indentation nil)))

(provide 'init-lsp)

;;; init-lsp.el ends here
