;;80 character hilight

(require 'highlight-80+)
;;当某个扩展名的文件打开时,自动调用highlight-80+-mode
(add-hook 'c-mode-common-hook   (lambda () (highlight-80+-mode t) ) )
(add-hook 'text-mode-hook       (lambda () (highlight-80+-mode t) ) )
(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-80+-mode t) ) )
(add-hook 'python-mode-hook     (lambda () (highlight-80+-mode t) ) )
(add-hook 'javascript-mode-hook (lambda () (highlight-80+-mode t) ) )
(add-hook 'html-mode-hook       (lambda () (highlight-80+-mode t) ) )
(add-hook 'conf-mode-hook       (lambda () (highlight-80+-mode t) ) )
(add-hook 'php-mode-hook        (lambda () (highlight-80+-mode t) ) )

(require 'fill-column-indicator)        
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
