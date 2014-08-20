(add-to-list 'load-path "~/.emacs.d/plugins/rainbow-mode")
(require 'rainbow-mode)
(dolist (hook '(css-mode-hook
        html-mode-hook))
        (add-hook hook (lambda () (rainbow-mode t))))
