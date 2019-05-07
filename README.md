# 中南大学本科学位论文Tex模版

## 2019年05月01日
本项目fork from [CSU-Thesis-Latex-Template](https://github.com/CSGrandeur/CSU-Thesis-LaTeX-Template). 根据本科生院于18年12月的最新模版(official_documents/附件7：中南大学毕业设计(论文)模版.pdf)修改。
知网查重部分与研究生/论文相同。代码内有大量硕/博论文部分未有清理，忙完后再清理。

注：因为fork的项目是无法被github索引的，所以重开了个代码库。

## Todo List
- 清理大量的源代码库的硕博部分代码
- 注释比较混乱，需要理清注释
- 部分示例不够良好，如有序列表等


## 项目起源

LaTeX利用设置好的模板，可以编译为格式统一的pdf。

目前国内大多出版社与高校仍在使用word，word由于其强大的功能与灵活性，在新手面对形式固定的论文时，排版、编号、参考文献等简单事务反而会带来很多困难与麻烦，对于一些需要通篇修改的问题，要想达到LaTeX的效率，对word使用者来说需要具有较高的技能水平。

为了能把主要精力放在论文撰写上，许多国际期刊和高校都支持LaTeX的撰写与提交，新手不需要关心格式问题，只需要按部就班的使用少数符号标签，即可得到符合要求的文档。且在需要全篇格式修改时，更换或修改模板文件，即可直接重新编译为新的样式文档，这对于word新手使用word的感受来说是不可思议的。

本项目的目的是为了创建一个符合中南大学本科生撰写规范的TeX模板，解决学位论文撰写时格式调整的痛点。

## 主要内容

![title](images/csu.png)

- 封面
- 中文摘要；
- 英文摘要；
- 目录；
- 符号说明（必要时）；
- 论文正文；
- 参考文献；
- 附录（必要时）；
- 致谢。

## 版本状况

完整支持本科论文。


## 文件介绍

### `CSUthesis.cls`

样式文件，一般不需要管这个文件。

其他如涉密、定向之类的，目前本版本没有设计特定的设置功能，需要修改该文件。

对LaTeX有所了解的同学，也可按需修改这个文件。如果这个文件的样式设计有什么bug，欢迎在issue里提出。

### `gbt7714-unsrt.bst`和`gbt7714.sty`两个文件

来自项目[CTeX-org/gbt7714-bibtex-style](https://github.com/CTeX-org/gbt7714-bibtex-style)，是参考文献的样式，与学校论文撰写规范一致。


### `content`目录

所有论文的编辑内容在这里。

`info.tex`：论文的各种信息，标题姓名学院之类的。

`abstactcn.tex`和`abstracten.tex`：中文摘要和英文摘要。

`content.tex`：从绪论到总结的全部正文内容。`\cite`的时候可能因为tex文件与主文件分离，LaTeX环境配置不到位，会有找不到bib的提示（Texlive+sublime会这样），没关系，照常插入需要的bibkey即可。


`additional.tex`：致谢、附录之类的。
`subchapters/` : 内容分章节往里填就可以了


### `csuthesis_main.tex`

论文主文件，正常情况下不用修改这个文件，以这个文件编译论文即可。

在content目录提供的页面不足以保证所需内容时，可以修改主文件，引入其他自定义content文件。

### `images`目录

放图片，模板已经配置了相对路径，所以在文中插图片时，直接用images目录下的相对路径即可，比如`images/csu.png`，在正文中插入只需要`csu.png`。

## 编译

### 如果你使用命令行编译
> 请使用`xelatex`，对`csuthesis_main.tex`文件进行编译。
> 在linux下可以使用`make`编译(MacOS未测试)
> 需要latexmk和wordcount支持。
`make {all|wordcount|clean|cleanall|view|zip`

### 如果你使用TexStudio等IDE
> 可以从content的任意章节开始编译，也可以从`csuthesis_main.tex`开始。


使用高级文本编辑器，如sublime等，否则可能因为ANSI、UTF-8等编码格式问题编译失败。


## 一些毕业流程上与word差异的考虑

尚未毕业，走一步看一步。

### 知网查重
知网查重有识别参考文献的功能，但是不怎么成熟。一般word编译的pdf能识别出来，但是有的识别不出来。这个latex模板的pdf，知网查重会把参考文献标红。

不过不用担心，目前中南查重规则是要去掉参考文献的pdf。



