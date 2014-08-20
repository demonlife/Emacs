# Emacs配置 #
## Emacs配置evil ##
[evil官网](http://www.emacswiki.org/emacs/Evil)

evil下载地址: git clone git://gitorious.org/evil/evil.git

[evil的使用技巧](http://dnquark.com/blog/2012/02/emacs-evil-ecumenicalism/)

[Michael Markert的Evil配置](https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-evil.el)

## emacs其他的vim插件
1.evil-surround, 用来模拟surround.vim，[github地址](https://github.com/timcharper/evil-surround)

2.evil-leader, 模拟vim的mapleader， [github地址](https://github.com/cofi/evil-leader)

## emacs配置python环境 ##

1.[rope的github地址](https://github.com/python-rope/rope)

2.[rope介绍](http://rope.sourceforge.net/)

>rope的安装方法
>下载rope源码，之后执行python setup.py install

3.[pymacs的github地址](https://github.com/pinard/Pymacs)

>pymacs安装方法
>下载源码，执行python setup.py install
>注意，对于pymacs 0.25以上的版本，运行sudo make install 进行安装

4.[ropemacs介绍地址](http://rope.sourceforge.net/ropemacs.html)

5.[ropemacs下载地址](https://pypi.python.org/pypi/ropemacs)

> ropemacs安装方法

> 下载源码，执行python setup.py install

> 安装完以上3个软件，在.emacs中添加如下内容

>> (add-to-list 'load-path "~/.emacs.d/plugins/rope")

>> (add-to-list 'load-path "~/.emacs.d/plugins/Pymacsv025")

>> (add-to-list 'load-path "~/.emacs.d/plugins/ropemacs-0.7")

>> (add-to-list 'load-path "~/.emacs.d/init_config")

>> (autoload 'pymacs-apply "pymacs")

>> (autoload 'pymacs-call "pymacs")

>> (autoload 'pymacs-eval "pymacs" nil t)

>> (autoload 'pymacs-exec "pymacs" nil t)

>> (autoload 'pymacs-load "pymacs" nil t)

>> (pymacs-load "ropemacs" "rope-")

>> (setq ropemacs-enable-autoimport t)

6.pycomplete的安装， [介绍](http://www.rwdev.eu/articles/emacspyeng)

> 安装方法如下：

> 拷贝[python-modle.el](http://www.rwdev.eu/python/pycomplete/python-mode.el)和 [pycomplete.el](http://www.rwdev.eu/python/pycomplete/pycomplete.el)到emacs的load-path中

> 拷贝[pycomplete.py](http://www.rwdev.eu/python/pycomplete/pycomplete.py)到python的PYTHONPATH中，例如，拷贝到/usr/local/lib/python2.7/dist-packages 中

7.以上的所以操作都可以在python的虚拟环境中进行安装。

8.检查python语法错误

> 安装方法如下：

> 首先配置emacs， 添加如下内容：

> (require 'package)

> (add-to-list 'package-archives 

>             '("marmalade" .

>               "http://marmalade-repo.org/packages/"))
               
>(package-initialize)

>(add-to-list 'package-archives '("elpa". "http://tromey.com/elpa/"))

>> 该段代码最好添加在emacs的最开始处，否则可能会出现一些问题

>之后使用在emacs中使用Alt+x，输入package-list-packages安装flymake和flymake-python-pyflakes插件

>使用pip 安装pyflakes

>最后在emacs的配置文件中添加如下内容：

>> (require 'flymake-python-pyflakes)

>> (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

>> 如果提示无法加载flymake-python-pyflakes文件，则添加load-path


