# Emacs 基础 #
[参考资料](http://www.jesshamrick.com/2012/09/10/absolute-beginners-guide-to-emacs/)

# Ubuntu下 Emacs 的安装 #
* 设置update manager可以允许安装pre-released updates和Usupported updates

* 添加ppa软件源

>ppa全称为personal package archives(个人软件包档案), 是Ubuntu Launchpad网站

>提供的一项服务, 不仅限于Launchpad. 通常ppa源里的软件是官方源里没有的, 或者是

>最新版本的软件. 相对于deb安装包来说, 使用ppa的好处是, 一旦软件有更新, 可以通

>过sudo apt-get upgrade这样的命令可以直接升级到新版本.

1.可以在google里搜索 软件名称关键词+ ppa,或者到[launchpad官网](https://launchpad.net/)搜索

2.搜索到之后，使用命令sudo apt-add-repository ppa-url添加

3.ppa-url的获取， 在搜索结果也中，形如 ppa:xx 的应该就是ppa-url了

4.执行sudo apt-get update, sudo aptitude install softname就可以安装了

# Emacs配置 #
## Emacs 使用sogo输入法 ##
* .bashrc/.zshrc等文件中，输入如下代码: export LC_CTYPE=zh_CN.UTF-8, 从终端启动emacs即可.

## Emacs24软件包设置 ##
* [marmalade网址](http://marmalade-repo.org/)

* emacs24 设置如下:

>(require 'package)

>(add-to-list 'package-archives 

>   '("marmalade" .

>      "http://marmalade-repo.org/packages/"))

>   (package-initialize)

* 如果不是emacs24以上的版本， 需要先安装package.el

* emacs 添加 elpa，代码如下:

>(add-to-list 'package-archives '("elpa". "http://tromey.com/elpa/"))

## EMAC配置evil ##
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

## Emacs markdown ##
* pandoc 的安装

> sudo aptitude install pandoc

> 在/usr/bin目录下建立一个markdown文件，赋予可执行权限，文件内容如下:

>> pandoc -f markdown -t html -s --mathjax --highlight-style pygments $1

* emacs 启用markdown

> [markdown下载地址](http://jblevins.org/projects/markdown-mode/)

* 设置emacs配置文件如下:

> (add-to-list 'load-path "markdown-mode/path")

> (autoload 'markdown-mode "markdown-mode"

>     "Major mode for editing Markdown files" t)

> (add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))

> (add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))

* [在emacs中显示markdown里的本地文件](http://everet.org/2013/01/emacs-markdown-display-image.html)

## emacs 插件安装 ##
[参考资料](http://docs.huihoo.com/homepage/shredderyin/emacs_elisp.html)

### autocomplete 安装 ##
[autocomplete地址](http://cx4a.org/software/auto-complete/index.html)

* 安装方法

> 下载autocomplete, 使用命令make install DIR=$HOME/.emacs.d/xxpath

> 将命令的输出添加到eamcs配置文件中即可

### yasnippet 安装 ###
[yasnippet主页](https://github.com/capitaomorte/yasnippet)

* 安装方法

> cd $HOME/.emacs.d

> git clone --recursive https://github.com/capitaomorte/yasnippet

>  (add-to-list 'load-path "~/.emacs.d/yasnippet")

>  (require 'yasnippet)

>  (yas-global-mode 1)

## 安装cedet, ecb ##
* [cedet下载地址](http://cedet.sourceforge.net/)=>release1.1

* 编译 make EMACS=emacs

* .emacs配置文件添加如下内容:

>(load-file "xx/cedet-1.1/common/cedet.el")

>(global-ede-mode 1)

>(semantic-load-enable-code-helpers)

>(global-srecode-minor-mode 1)

* 安装ecb, [ecb下载地址](http://ecb.sourceforge.net/)

> 在.emacs中添加如下内容

>(add-to-list 'load-path "xx/ecb-2.40")

>(require 'ecb)

>(require 'ecb-autoloads)

* 在 emacs的tool->start code browser启动ECB

### ecb 错误解决 ###
1. if symbol's value as variable is void stack-trace-on-error

>(setq stack-trace-on-error t)

2. 如果打开emacs后弹出提示ecb-tip-of-the day的弹框

>(setq ecb-tip-of-the-day nil)

3. CB can only be used with [1.0pre6, 1.0.9]! Please install it and restart Emacs!
进入到ecb目录下, 打开文件ecb-upgrade.el, 将ecb-check-requirements函数中的
如下代码注释:

>;; check if vedet-version is correct

>      when (or (not (boundp 'cedet-version))

>        (ecb-package-version-list< 

>        (ecb-package-version-str2list cedet-version)

>        ecb-required-cedet-version-min)

>        (ecb-package-version-list<

>        ecb-required-cedet-version-max

>        (ecb-package-version-str2list cedet-version)))

>        (setq version-error (concat "cedet [" 

>        cedet-required-version-str-min

>        ", " 

>        cedet-required-version-str-max

>        "]")))

## emacs ido模式使用 ##
* C-s, C-r, 左右键在匹配的文件之间来回旋转

* 按上下键可以在目录名之间旋转

* C-k: 删除一个文件, 此时会给出提示

* C-p: 启动部分匹配, 而不是严格的前缀匹配

* C-t: 切换到正则表达式匹配

* C-b: 切换到buffer模式

* C-d: 进入Dired

* C-j: 在需要创建新文件时，但是目录中有前缀匹配的文件或目录，此时用C-j可以跳过, 如果没有直接回车就能创建

* M-s: 如果不能匹配是，可以将所有路径合并，并找到匹配文件

## emacs 常用的快捷键 ##
* C-x C-q: 让当前buffer在只读和可编辑状态中改变

* M-q: 如果鼠标所在行超过规定的长度则会换行

* alt + |: 在mini buffer中执行shell命令

* C-x Esc Esc: 调出上一条执行的命令

* M-X global-set-key RET: 交互绑定键，根据提示操作

### emacs python mode 下的快捷键 ###
* 在安装pymacs, ropemacs后，可以使用如下的快捷键

>C-c d: 可以调出帮助文档，显示在mini buffer中

>C-c g: 跳转到定义

>C-c C-c: 将当前buffer中的代码发送到ipython中执行

>C-c !: 新建一个ipython的交互窗口

> M-/: 设置rope的根目录

### emacs markdown mode 下的快捷键 ###
* C-c C-c m:转化为HTML，在另一个buffer中预览

* C-c C-c p:转化为html，在浏览器中预览

* C-c C-a l:插入[]()形式的连接，

* C-c C-a L:插入[linktext][label]形式的连接，该形式下，会在minibuffer中提示输入信息

* C-c C-i i / C-c C-i I:插入图片, 中括号中的内容会显示在页面，如果需要给图片添加alt信息，

* 则只需要在连接后面接一个空格和对应的信息即可,例如: ![](pic url "titlt"), 图片连接不能

* 使用""包起来

* 列表可以用: *, +, -, 如果是有数字的列表则使用数字加上英文的小数点

* \#h1#:与html中的h1等价

* \#\#h2##:与html中的h2等价， 前导的#个数是1-6，后面#的个数不一定要与前一致，但至少需要一个

* \#多余6个就不会当做h标签了。

* 多个标签之间需要使用多余的空行来隔开，否则显示会有问题

* 标题下加====等价与h1

* 标题下加----等价与h2

# Emacs 参考资料 #
* [资料1](http://mad4a.me/2012/07/31/emacs-summary/)

* [资料2](http://mad4a.me/2012/08/02/emacs-summary-cont/)
