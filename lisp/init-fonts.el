;;; init-fonts --- const defines
;;; Commentary:
;;; Code:

(defvar azi-fonts-default '("Hack Nerd Font" "Cascadia Code PL" "Courier Prime" "Jetbrains Mono" "Roboto Mono" "Menlo" "Consolas"))
(defvar azi-fonts-unicode '("Hack Nerd Font" "Segoe UI Symbol" "Symbola" "Symbol"))
(defvar azi-fonts-emoji '("Hack Nerd Font" "Apple Color Emoji" "Segoe UI Emoji" "Noto Color Emoji" "Noto Emoji"))
(defvar azi-fonts-cjk '("WeRead Font" "KaiTi" "STKaiTi" "WenQuanYi Micro Hei" "Noto Sans Mono CJK HK"))

;;;###autoload
(defun azi-find-font (custom-fonts default-fonts)
  "Get the first installed font from CUSTOM-FONTS and DEFAULT-FONTS."

  (catch 'font
    (dolist (f (append custom-fonts default-fonts))
      (when (find-font (font-spec :family f))
	(throw 'font f)))))

;;;###autoload
(defun azi-font-setup (&rest args)
  "Setup fonts from ARGS, The accepted args are :default :unicode :emoji :cjk."

  (interactive)
  (when (display-graphic-p)
    (let ((f-def (azi-find-font (plist-get args :default) azi-fonts-default))
	  (f-uni (azi-find-font (plist-get args :unicode) azi-fonts-unicode))
	  (f-emo (azi-find-font (plist-get args :emoji) azi-fonts-emoji))
	  (f-cjk (azi-find-font (plist-get args :cjk) azi-fonts-cjk)))
      (set-face-attribute 'default nil :family f-def :height 140)
      (setq face-font-rescale-alist `((,f-cjk . 1.0)))
      (dolist (pair `((unicode  . ,f-uni)
		      (emoji    . ,f-emo)
		      (kana     . ,f-cjk)
		      (han      . ,f-cjk)
		      (bopomofo . ,f-cjk)
		      (cjk-misc . ,f-cjk)))
	(set-fontset-font t (car pair) (font-spec :family (cdr pair)) nil 'prepend)))))

(add-hook 'after-init-hook #'azi-font-setup)
(when (daemonp)
  (add-hook 'after-make-frame-functions
	    (lambda (frame)
	      (with-selected-frame frame (azi-font-setup)))))

;; ;;--------------
;; (defun available-font (font-list)
;;   "Get the first available font from FONT-LIST."

;;   (catch 'font
;;     (dolist (font font-list)
;;       (if (member font (font-family-list))
;; 	  (throw 'font font)))))

;; ;;;###-autoload
;; (defun azi/rest-font-setup ()
;;   "Font setup."

;;   (interactive)
;;   (let* ((efl '("Hack Nerd Font" "Cascadia Code" "Source Code Pro" "JetBrains Mono" "Courier New" "Monaco" "Ubuntu Mono"))
;; 	 (cfl '("STHeiti" "黑体" "楷体" "STKaiti" "微软雅黑" "文泉译微米黑"))
;; 	 (eml '("Hack Nerd Font Propo" "all-the-icons" "file-icons" "Apple Color Emoji" "Segoe UI Emoji" "Noto Color Emoji" "Symbola" "Symbol"))
;; 	 (cf (available-font cfl))
;; 	 (ef (available-font efl))
;; 	 (em (available-font eml)))
;;     (when ef
;;       (dolist (face '(default fixed-pitch fixed-pitch-serif variable-pitch))
;; 	(set-face-attribute face nil :family ef :height 160)))
;;     (when em
;;       (dolist (charset '(unicode unicode-bmp symbol emoji))
;; 	(set-fontset-font t charset em nil 'prepend)))
;;     (when cf
;;       (dolist (charset '(kana han cjk-misc bopomofo))
;; 	(set-fontset-font t charset cf))
;;       ;; (setq face-font-rescale-alist
;;       ;; 	    (mapcar (lambda (item) (cons item 1.2)) '(cf em)))
;;       )))


;; (azi/rest-font-setup)

;; ;; 设置字体
;; (set-face-attribute
;;  'default nil
;;  :height 160
;;  :underline nil
;;  ;family "Monospace"
;;  :family "Hack Nerd Font Propo")

(provide 'init-fonts)

;;; init-fonts.el ends here
