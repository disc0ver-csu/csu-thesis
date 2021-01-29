# Git 使用指引

## :bulb: 第一次上手 Git

### 安装 git

| 平台    | 方法                                                                 |
| ------- | -------------------------------------------------------------------- |
| Windows | [下载安装包](https://git-scm.com/download/win)                       |
| Linux   | `sudo apt install git`                                               |
| Mac     | 安装 Xcode _或者_ 利用[Homebrew](https://brew.sh/)`brew install git` |

### 注册 GitHub 账号

点击当前页面右上角的`Sign up`，注册账号

### 使用 https 方式克隆本仓库

该方法与 [README.md - 下载至本地](https://github.com/disc0ver-csu/csu-thesis#%E4%B8%8B%E8%BD%BD%E8%87%B3%E6%9C%AC%E5%9C%B0) 中所述一致，请参考之。

### 使用 ssh 方式克隆本仓库

#### 注意事项

使用 ssh 方式的优点在于，向远端 push 时无需输入账号和密码。

注意：这里的 `git clone` 命令有别于仓库根目录 `README.md` 中使用 https 方式克隆仓库的命令。此处命令使用 ssh 方式克隆仓库，如果你已经使用 https 方式克隆了仓库，可以考虑执行

`git config remote.origin.url git@github.com:disc0ver-csu/csu-thesis.git`

从而使用 ssh 方式与远端通信。

#### 准备工作

如果你决定使用 ssh 方式与远端通信，且这是你第一次使用 Gtihub，你将需要上传自己的 RSA 公钥文件。

请检查本地是否存在 RSA 公钥文件，例如 `~/.ssh/id_rsa.pub` 。若无此类文件，请执行 `ssh-keygen` ，并一路回车，直到程序运行结束。此时你将得到 `~/.ssh/id_rsa.pub` 文件。

现在，点击页面右上角的个人头像，选择 `Settings`，在接下来显示的页面左边菜单中选择 `SSH and GPG keys`，点击页面右侧上方绿色的 `New SSH key` 按钮，将 `~/.ssh/id_rsa.pub` 文件中的内容复制到 `key` 文本框中，并且自定义一个好记的名字，填入 `Title` 文本框中，最后点击页面下方绿色的 `Add SSH key` 按钮，完成公钥上传工作。

#### 开始克隆

现在，你已经准备好克隆仓库了。请切换到合适的目录，执行以下命令：

```shell
git clone git@github.com:disc0ver-csu/csu-thesis.git
```

#### :congratulations: YOU ARE READY TO GO! :congratulations:

## 📖 参考资料

第一次上手 Git，往往感到摸不着头脑。但这不要紧，请看这篇简明 Git 教程 - [猴子都能懂的 git 入门](https://backlog.com/git-tutorial/cn/)

读完教程，可以在线实战 Git 操作。这个交互式练习网站提供了从易到难的 Git 实操环境，可以帮助你快速习惯使用 Git - [交互式 Git 练习](https://learngitbranching.js.org/)

在参与项目协作时，你可能需要编辑 Markdown 文档，这是一种简单的标记语言，很好学习：Markdown 语法教程 - [基本语法大全](https://markdown.com.cn/basic-syntax/) [菜鸟教程之 markdown 语法](https://www.runoob.com/markdown/md-tutorial.html)
