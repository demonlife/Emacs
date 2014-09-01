(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'nasm-mode)
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))
