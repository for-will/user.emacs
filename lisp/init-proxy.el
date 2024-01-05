;;; init-proxy --- setup http proxy
;;; Commentary:
;;; Code:
					; 设置代理
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "172.16.0.159:7890")
     ("https" . "172.16.0.159:7890")))

(provide 'init-proxy)
;;; init-proxy.el ends here
