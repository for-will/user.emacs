;;; init-vars --- const defines
;;; Commentary:
;;; Code:


(defvar azi-os-win (memq system-type '(ms-dos windows-nt cygwin)))
(defvar azi-os-mac (eq system-type 'darwin))
(defvar azi-os-linux (eq system-type 'gnu/linux))

(provide 'init-vars)

;;; init-vars.el ends here
