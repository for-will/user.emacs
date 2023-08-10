;; [[file:myinit.org::*interface tweaks][interface tweaks:1]]
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
;; (global-set-key (kbd "<f5>") 'revert-buffer)
;; interface tweaks:1 ends here

;; [[file:myinit.org::*try][try:1]]
(use-package try
  :ensure t)
;; try:1 ends here

;; [[file:myinit.org::*Org mode][Org mode:1]]
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  :ensure t)


(custom-set-variables
 '(org-directory "~/Sync/orgfiles") 
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-dolded 'overview)
 '(org-startup-indented t)
 '(org-confirm-babel-evaluate nil)
 '(org-src-fontify-natively t))
;; Org mode:1 ends here
