


;;; Code:

					; Smart Input Source
(use-package sis
  :ensure t
  ;; :hook
  ;; enable the /context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))
  :init
  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)

  (if azi-os-mac
      (sis-ism-lazyman-config
       "com.apple.keylayout.ABC" "com.baidu.inputmethod.BaiduIM.wubi"))
  (if azi-os-linux
      (sis-ism-lazyman-config
       "xkb:us::eng" "table:wubi-haifeng86" 'ibus)))

;; ;; MacOS下设置输入法
;; (if *is-mac*
;;   ;; For MacOS
;;   (sis-ism-lazyman-config
;;    ;; English input source may be: "ABC", "US" or another one.
;;    ;; "com.apple.keylayout.ABC"
;;    "com.apple.keylayout.ABC"
;;    ;; Other language input source: "rime", "sogou" or another one.
;;    ;; "im.rime.inputmethod.Squirrel.Rime"
;;    "com.baidu.inputmethod.BaiduIM.wubi"))

;; ;; Linux设置输入法
;; (if *is-linux*
;;   (sis-ism-lazyman-config "xkb:us::eng" "table:wubi-haifeng86" 'ibus))

(provide 'init-sis)
;;; init-sis.el ends here
