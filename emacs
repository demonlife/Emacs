(require 'package)
(add-to-list 'package-archives 
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(package-initialize)
(add-to-list 'package-archives '("elpa". "http://tromey.com/elpa/"))

;; use evil
(add-to-list 'load-path "~/.emacs.d/init_config")
(load "base.el")
(load "evil.el")
(load "markdown.el")
(load "pythonplugs.el")
(load "tabbar.el")
(load "highlight80.el")
(load "rainbow.el")

;; 每次安装需要修改的地方
(add-to-list 'load-path "/home/demon/.emacs.d/auto-complete-make")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/demon/.emacs.d/auto-complete-make/ac-dict")
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;;
