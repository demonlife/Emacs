(add-to-list 'load-path "~/.emacs.d/plugins/rope")
(add-to-list 'load-path "~/.emacs.d/plugins/Pymacs")
(add-to-list 'load-path "~/.emacs.d/plugins/ropemacs-0.7")
(add-to-list 'load-path "~/.emacs.d/init_config")

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist(cons '("python" . python-mode)
                           interpreter-mode-alist))

; 检查python的语法错误
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

; 加载出错时，不显示错误提示信息
(setq flymake-gui-warnings-enabled nil)
; 记录错误日志
(setq flymake-log-level 0)

; 显示python的语法错误信息
(when (load "flymake" ) 
  (defun flymake-pyflakes-init () 
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                       'flymake-create-temp-inplace)) 
           (local-file (file-relative-name 
                        temp-file 
                        (file-name-directory buffer-file-name)))) 
      (list "/usr/local/bin/pyflakes" (list local-file)))) 
  (add-to-list 'flymake-allowed-file-name-masks 
               '("\\.py\\'" flymake-pyflakes-init))) 

(add-hook 'find-file-hook 'flymake-find-file-hook)
(load-library "flymake-cursor")  ;在minibuffer显示错误信息
(global-set-key (kbd "<f11>") 'flymake-start-syntax-check)
(global-set-key (kbd "<s-up>") 'flymake-goto-prev-error)
(global-set-key (kbd "<s-down>") 'flymake-goto-next-error)

(custom-set-faces
     '(flymake-errline ((((class color)) (:underline "red"))))
     '(flymake-warnline ((((class color)) (:underline "yellow1")))))
(setq flymake-no-changes-timeout 600)
