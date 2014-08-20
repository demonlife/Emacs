;; 设置session, 菜单上会多两项：最近访问过的文件和最近 修改过的文件
(add-to-list 'load-path "~/.emacs.d/plugins/session") ;;设置session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; 把 C-x C-b 那个普通的 buffer menu 换成非常方便的 ibuffer
;; ibuffer下载地址: http://docs.huihoo.coom/homepage/shredderyin/src/emacs-lisp/ibuffer.el
;; 使用%标记某个buffer,
;; 选择某个buffer后，可以使用o打开，或者RET安装
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; 保存上次打开的文件记录，那么可以使用 desktop
;; M-x desktop-save: 保存记录, desktop-clear:删除记住的内容
(load "desktop")
(desktop-load-default)
(desktop-read)

