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

