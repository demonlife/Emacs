(add-to-list 'load-path "~/.emacs.d/plugins/tabbar") ;;设置tabbar
(require 'tabbar)
(tabbar-mode 1)
(load "tabbarsetting.el") ;; 键绑定设置

(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

