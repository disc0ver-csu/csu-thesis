# CSUThesis Latex 模板

![CSUThesis Github Release](https://img.shields.io/github/v/release/disc0ver-csu/csu-thesis?label=github%20release)
[![Overleaf](https://img.shields.io/badge/overleaf-v0.1.3dev-green.svg)](https://www.overleaf.com/latex/templates/csuthesis-v0-dot-1-3dev/hcsjpbsfvcdx)
![Release Date](https://img.shields.io/github/release-date/disc0ver-csu/csu-thesis?color=yellow&label=github%20release%20date)
[![](https://img.shields.io/badge/language-TeX-orange.svg)](https://github.com/disc0ver-csu/csu-thesis)
[![QQGroup](https://img.shields.io/badge/QQGroup-1102036265-blue.svg)]()

## 模板说明

本模板是中南大学论文 Latex 模板 **CSUThesis**，即 **C**entral **S**outh **U**niversity **Thesis** LaTeX Template.

学校的指导文件仅提供大致的格式描述与 word 示例，并没有提供官方的 LaTeX 模板，本项目意在维护一个学位论文的非官方标准（De facto standard），创建符合指导文件要求的 LaTeX 模板，供所有本科生研究生使用。

## 获取模板

### 下载至本地

![CSUThesis Github Release](https://img.shields.io/github/v/release/disc0ver-csu/csu-thesis?label=github%20release)

由于目前模板更新频繁，我们强烈建议您使用**稳定的发布版本**，同时请确保**您已经阅读了示例文档**。

下载途径：

目前仅提供克隆完整 Github 仓库和获取打包的稳定发布版本两个途径

- Github Repository:

  ```shell
  git clone https://github.com/disc0ver-csu/csu-thesis.git
  ```

  如果 clone 速度过慢，我们建议您使用代理并添加`--depth`参数。

  ```shell
  git clone https://github.com/disc0ver-csu/csu-thesis.git --depth=1
  ```

- Github Releases:

  [Release 页面](https://github.com/disc0ver-csu/csu-thesis/releases)

### Overleaf

[![Overleaf](https://img.shields.io/badge/overleaf-v0.1.3dev-green.svg)](https://www.overleaf.com/latex/templates/csuthesis-v0-dot-1-3dev/hcsjpbsfvcdx)

我们同时提供了[Overleaf 模板](https://www.overleaf.com/latex/templates/csuthesis-v0-dot-1-3dev/hcsjpbsfvcdx)，习惯在 Overleaf 上进行写作的同学可以从上面的模板链接创建自己的项目。

:warning: 目前 Overleaf 上为测试版本，仍然存在 Linux 系统适配的问题。另外由于学校写作指导文件要求的部分商用字体（比如 Times New Romance）不可在 Linux 上使用，我们采取的方案是进行相近字体的替换。所以即便你的写作过程是在 Linux 或者 macOS 上完成的，我们仍**强烈建议**您在 Windows 操作系统上编译最终版论文。

## 环境配置

如果希望在本地使用本模板，除了获取模板文件以外，您还需要自行配置 TeX 排版系统环境。我们常说的 TeX 并不是一个单独的程序，而是一套由排版引擎，编译程序，各类宏包与说明文档等构成的复杂排版系统，被称为 [Tex document production system](https://www.tug.org/)。为了方便用户使用，软件开发者们开发了 TeX 的发行版，提供了整套系统以及便捷的配置方式。

我们**推荐**使用[Tex Live](https://www.tug.org/texlive/)和[MiKTeX](https://miktex.org/)的最新版，因为这两种发行版，对 GNU/Linux，macOS 以及 Windows 都提供了较好的支持。需要说明的是，我们**不建议**使用[CTeX 套装](http://www.ctex.org/CTeX)，该套装对 Windows 环境下 MikTeX 基础上增加了中文的支持，但是 2012 年后不再更新，已经相对过时，故不推荐使用（一些使用过 CTeX 的同学在配置环境时会出现冲突导致编译失败）。

下图是一些常见的 TeX 发行版以及支持的操作系统

| TeX 发行版 | GNU/Linux          | macOS              | Windows            |
| :--------- | :----------------- | :----------------- | :----------------- |
| TeX Live   | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| MiKTeX     | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| MacTeX     | :x:                | :heavy_check_mark: | :x:                |
| CTeX       | :x:                | :x:                | :heavy_check_mark: |

## 模板使用

在`content` 目录下撰写文章内容，之后使用如下方式编译生成 pdf 格式文件。我们希望模板使用者有基本的 latex 撰写经验以及命令行使用能力，模板也配置了一些相关工具来帮助编译。

### GUI 界面

如果你使用的开发环境是 Visual Studio Code + (Tex Live | MiKTex)，我们在 `.vscode` 目录中提供了对应的 LaTeX 插件的配置。需要你在 Visual Studio Code 中安装 [LateX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件，然后将 `.vscode` 目录中 `setting.json` 文件中的配置，拷贝添加至用户配置（ `Ctrl+p` 然后点击 `设置 (json)` ）中，该配置全局有效，类似教程可参考[配置 VSCode 作为 LaTeX 编辑器](http://eddyblog.oss-cn-shenzhen.aliyuncs.com/LaTeX/csu_thesis_1.gif)。

完成配置后，在任意的 `.tex` 文件下执行倒数第二个 recipe，即 `▷ Recipe: xelatex -> biber -> xelatex` 即可编译你的论文。

![csu_thesis_1.gif](http://eddyblog.oss-cn-shenzhen.aliyuncs.com/LaTeX/csu_thesis_1.gif)

如果你需要令配置文件仅对本项目生效，可以 `setting.json` 将重命名为 `settings.json` ，再在 Visual Studio Code 中按 `ctrl + p`，输入 `reload win`，回车，重载 Visual Studio Code 即可。

**注意**，第一次编译时需要下载大量宏包，请不要担心，耐心等待一段时间。编译过程正式开始时，Visual Studio Code 的底部将会出现一个字符绘制的进度条。如果等待时间过长，请考虑配置 Tex Live | MiKTeX 的软件源，或者配置代理服务器。

### 命令行

- Windows 用户

  你可以在项目目录使用`latexmk`进行编译，推荐`latexmk`是因为参考文献等带来的交叉引用问题需要多次编译（使用`xelatex`和`biber`），而`latexmk`可以帮助我们免除此苦恼。相关配置在`latexmkrc`中。你可以按如下方式使用该工具。

  ```shell
  latexmk                     # 编译生成 csuthesis_main.pdf
  latexmk csuthesis_main.tex  # 给出完整参数，编译生成 csuthesis_main.pdf
  latexmk -c                  # 删除除 pdf 文件外的生成文件
  latexmk -C                  # 删除包含 pdf 文件在内的所有生成文件
  ```

  你也可以直接使用`xelatex`和`biber`来进行编译，一般而言这是不必要的，但是如果你改动了模板参数想要进行测试，或者希望编译生成没有参考文献的文件，这种方式可以提供更多帮助。

  ```shell
  xelatex -interaction=nonstopmode -file-line-error csuthesis_main.tex  # 编译生成无目录与参考文献的文件
  biber csuthesis_main.tex                                              # 编译参考文献
  xelatex -interaction=nonstopmode -file-line-error csuthesis_main.tex  # 再次编译
  ```

- Linux 和 macOS 用户

  由于写作指导所要求的 Times New Roman 等字体在 Linux 下并不可用，虽然模板会替换字体为对应环境下其他字体，我们**强烈建议模板使用者在 Windows 系统环境下进行最终版本文章的编译**。

  你可以使用模板提供的`Makefile`工具进行编译：

  ```shell
  make all                      # 编译生成 csuthesis_main.pdf
  make clean                    # 删除除 pdf 文件外的生成文件
  make cleanall                 # 删除包含 pdf 文件在内的所有生成文件
  make wordcount                # 字数统计
  ```

  当然你也可以使用`latexmk`或者`xelatex`配合`biber`编译生成 pdf 文件。

## 参与维护

欢迎大家参与项目维护！

请阅读 `docs` 目录中的[项目开发者指导](./docs/DEVELOPER_MANUAL.md)等文档，明确开发流程和注意事项 😉。

## 其他

### 关于 LaTeX

> LaTeX is not a word processor! Instead, LaTeX encourages authors not to worry too much about the appearance of their documents but to concentrate on getting the right content.

TeX 作为一个优秀的排版软件，在学术界特别是数学、物理学和计算机科学界十分流行，而建立在其上的 LaTeX 也成为国外许多出版商一直在使用的工具。Office Word 虽然具备强大的功能与灵活性，但对于形式固定的论文，排版、编号、参考文献等简单事务反而会带来很多困难与麻烦，对于一些需要通篇修改的问题，要想达到 LaTeX 的效率，Word 对使用者并不算友好。使用 Latex 模板的一大好处是可以避免繁琐的格式设置，使作者可以专注于内容创作。对于全篇格式的修改，仅需要修改 tex 文件所使用的模板一行内容，重新编译便可得到具备新样式的文档，这对于习惯使用 Word 创作的人来说很不可思议。

### 关于项目

清华大学、上海交通大学、中国科学技术大学、中国科学院大学、武汉大学等国内高校都有长期维护、较为稳定的学术论文 LaTeX 模板，相比较之下，中南大学虽有一些前辈做出实践，比如最初设计出[中南大学博士学位论文 LaTeX 模板](https://github.com/CSGrandeur/CSU-Thesis-LaTeX-Template)的[@CSGrandeur](https://github.com/CSGrandeur)，参考武汉大学学术论文自行设计出本科毕业设计论文 LaTeX 模板的[@burst-bao](https://github.com/burst-bao)等。但目前这些在 Github 上可查到的项目多数已有相当时间没有维护，或者缺乏像上述高校的学术论文模板简易、高效且可靠的设计。

本项目在我校各位前辈们设计的模板基础上进行了重构，使用部分 LaTex3 语法，吸收借鉴清华大学、上海交通大学和中国科学技术大学的学术论文 LaTeX 模板设计的经验，并针对最新的《中南大学毕业设计(论文)模版》文件进行修订。项目已从之前的个人转移至 disc0ver 组织下进行维护，希望更多的同学可以贡献力量，一起维护该项目。

### 一些毕业流程上与 word 差异的考虑

- **首要条件**：和你的导师沟通好，如果他知道 Latex 最好，不知道的话询问他是否接受在 PDF 上进行审阅
- **查重** ：未测试生成的 PDF 是否可以被正确识别，有勇士直接使用 PDF 查重失败或成功的可以提 issue 告诉我，附上编译环境和查重系统。变通方法如下：直接打开 Latex 生成的 PDF 文件，word 会提示将 PDF 转为 docx 文件，转换后字体样式可能会回到 word 自带（Linux 下 texlive 使用的宋体和黑体是 Fandol 系列字体,windows 没有）,但是内容全部保留，格式也会保留大部分,直接用该 docx 可以完美通过查重。如果因为各种原因有转为 docx 的需求也可以采用此方法！
- **格式审查**: 各不同院系尺度不同，无法一概而论。

## 更新日志

- 2021/02/07：发布 v0.1.4 版本提供不同选项接口，配置不同的封面。
- 2021/01/29: 添加开发者文档，Git 使用文档，提供 Overleaf 上测试版链接。
- 2021/01/26: 发布 v0.1.2 版本，支持代码段和算法描述，修复附录编号问题，完善 README
- 2021/01/25: Edwardzcn 重构项目，发布 v0.1.1 版本，对照学校指导文件重新修改样式，并修复目录显示的问题
- 2019/12/13: BlurryLight 进行了一些代码更新
- 2019/05/01: BlurryLight 在[CSU-Thesis-Latex-Template](https://github.com/CSGrandeur/CSU-Thesis-LaTeX-Template) 的基础上进行修改出本科学位论文模板

## 致谢

- 感谢最先制作出中南大学博士学位论文 LaTeX 模板的郭大侠[@CSGrandeur](https://github.com/CSGrandeur)
- 感谢添加本科学位论文样式支持的[@BlurryLight](https://github.com/BlurryLight)
- 感谢帮助重构项目并进行测试的[@burst-bao](https://github.com/burst-bao)和[@Wp-Zhang](https://github.com/Wp-Zhang)以及为独立使用 LaTeX 进行毕业论文写作提供宝贵经验的 16 级姜析阅学长
- 感谢[CTeX-kit](https://github.com/CTeX-org/ctex-kit) 提供了 LaTeX 的中文支持
- 感谢上海交通大学学位论文 LaTeX 模板的维护者们[@sjtug](https://github.com/sjtug) 与清华大学学位论文 LaTeX 模板的维护者们[@tuna](https://github.com/tuna/)给予的宝贵设计经验

<!--

## 文件介绍

### `content`目录

所有论文的编辑内容在这里。

`info.tex`：论文的各种信息，标题姓名学院之类的。

`abstactcn.tex`和`abstracten.tex`：中文摘要和英文摘要。

`content.tex`：从绪论到总结的全部正文内容。`\cite`的时候可能因为 tex 文件与主文件分离，LaTeX 环境配置不到位，会有找不到 bib 的提示（Texlive+sublime 会这样），没关系，照常插入需要的 bibkey 即可。

`thanks.tex`：致谢
`additional.tex`：附录(不用时可以注释掉)
`subchapters/` : 内容分章节往里填就可以了

### `csuthesis_main.tex`

论文主文件，正常情况下不用修改这个文件，以这个文件编译论文即可。

在 content 目录提供的页面不足以保证所需内容时，可以修改主文件，引入其他自定义 content 文件。

### `images`目录

。

### `KaiTi_GB2312.tff`

**注意:** 由于学校的论文格式中需要用到该字体，但是可能由于系统的原因，并没有带上该字体，需要自行从网上下载，并命名为`KaiTi_GB2312.tff`放置在与`csuthesis_main.tex`同目录下。

## 编译

### 如果你使用命令行编译

#### 自动化编译

- 可以使用`make`编译
  需要 latexmk 和 wordcount 支持。
  `make {all|wordcount|clean|cleanall|view|zip`

- 也可以直接使用 latexmk
  `latexmk .`

### 如果你使用 TexStudio 等 IDE

- 可以从 content 的任意章节开始编译，也可以从`csuthesis_main.tex`开始。

使用高级文本编辑器，如 sublime 等，否则可能因为 ANSI、UTF-8 等编码格式问题编译失败。

 -->
