%
% 本模版根据中南大学本科生学位论文撰写规范创建
% 参考源：http://gra.its.csu.edu.cn/yjsy/pygl/wjtzxq54858_3_6.html
% 论文内容一般应由十一个主要部分组成，依次为：
% 1.封面
% 2.中文摘要；
% 3.英文摘要；
% 4.目录；
% 5.符号说明（必要时）；
% 6.论文正文；
% 7.参考文献；
% 8.致谢。
%
%
% 重构
%
% 原因：原有模板缺乏维护，模板文件(CSUthesis.cls)缺少注释解释what和why，缺乏适配各种情形（科研报告、本、硕、博论文）的模板选项。
% 需求：有越来越多20届和21届应届毕业生需要一份“开箱可用”的学术论文模板（学士、硕士、博士）
%
% 参考本校多位学长（包括最初的模板作者郭大侠）编写的模板，以及SJTU Thesis和WHU Thesis Latex模板进行重构。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 基本信息
%
% 指定模板使用的 Latex 版本，标识输出模板名
% 提供报错信息
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csuthesis}[2020/01/21 v1.4.9-dev by Edwardzcn edwardzcn98@gmail.com]
% 加载xparse宏包，LaTeX3支持
\RequirePackage{xparse}
% 报错与警告
\NewDocumentCommand{\csu@error}{ m o }{
    \ClassError{csuthesis_error}{#1}{#2}
}
\NewDocumentCommand{\csu@warning}{m o }{
    \ClassWarning{csuthesis_warning}{#1}{#2}
}
% 引擎执行判断宏包
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex
    % Pass
\else
    \csu@error{Please use xelatex driver instead of pdflatex.}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 选项定义
%
% 提供模板可使用的选项
% 提供报错信息
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\hyphenation{CSU-Thesis}
\def\csuthesis{CSUThesis}
\def\version{0.1.4}

% 定义一些命令用于写文档
% /cs 在ltxdoc 包中也提供，剩下是自定义的
% 借鉴自thuthesis和ustcthesis模板
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\DeclareRobustCommand\file{\nolinkurl}
\DeclareRobustCommand\env{\textsf}
\DeclareRobustCommand\pkg{\textsf}
\DeclareRobustCommand\cls{\textsf}
\RequirePackage{hologo}
\newcommand{\XeTeX}{\hologo{XeTeX}}
\newcommand{\BibLaTeX}{\textsc{Bib}\LaTeX}

\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=csu,
  prefix=csu@,
  setkeys=\kvsetkeys}
% 提供接口，支持 key-value 的方式来设置。
\newcommand\csusetup[1]{
  \kvsetkeys{csu}{#1}
}
\newcommand\csu@define@key[1]{
  \kvsetkeys{csu@key}{#1}
}
\kv@set@family@handler{csu@key}{
  % 处理未知key使用宏 kv set family hanlder, 使用的key为#1,value为#2
  \@namedef{csu@#1@@name}{#1}
  % defaul是定义key时默认值
  \def\csu@@default{}
  \def\csu@@choices{}
  % 可以用 <name> 设置别称，为了方便宏名字带特殊字符的调用，比如key = math-style，
  \kv@define@key{csu@value}{name}{
    \@namedef{csu@#1@@name}{##1}
  }
  % 由于在定义接口时，\csu@⟨key⟩@@code 不一定有定义，而且在文档类/宏包中还有可能
  % 对该 key 的 code 进行添加。所以 \csu@⟨key⟩@@code 会检查如果在定义文档类/宏包时则
  % 推迟执行，否则立即执行。
  % BUG double @
  % \@namedef{csu@#1@check}{}
  % \@namedef{csu@#1@code}{}
  \@namedef{csu@#1@@check}{}
  \@namedef{csu@#1@@code}{}
  % 保存下choices = {} 定义的内容，在定义 \csu@<name>后再执行
  \kv@define@key{csu@value}{choices}{
    \def\csu@@choices{##1}
    \@namedef{csu@#1@@reset}{}
    % 这里 % 不能乱删
    \@namedef{csu@#1@@check}{%
      \@ifundefined{%
        ifcsu@\@nameuse{csu@#1@@name}@\@nameuse{csu@\@nameuse{csu@#1@@name}}%
      }{%
        \csu@error{Invalid value "#1 = \@nameuse{csu@\@nameuse{csu@#1@@name}}"}%
      }%
      \@nameuse{csu@#1@@reset}%
      \@nameuse{csu@\@nameuse{csu@#1@@name}@\@nameuse{csu@\@nameuse{csu@#1@@name}}true}%
    }%
  }%
  \kv@define@key{csu@value}{default}{
    \def\csu@@default{##1}
  }
  \kvsetkeys{csu@value}{#2}
  \@namedef{csu@\@nameuse{csu@#1@@name}}{}
  % 第一个 <choice> 设为 <default> ，并且对每个<choice>定义 ifcsu@<name>@choice
  \kv@set@family@handler{csu@choice}{
    \ifx\csu@@default\@empty
      \def\csu@@default{##1}
    \fi
    % TODO
    \expandafter\newif\csname ifcsu@\@nameuse{csu@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname csu@#1@@reset\endcsname{
      \@nameuse{csu@\@nameuse{csu@#1@@name}@##1false}
    }
  }
  \kvsetkeys@expandafter{csu@choice}{\csu@@choices}
  % 将 <default> 赋值到 \csu@<name>， 如果非空则执行相应的代码。
  \expandafter\let\csname csu@\@nameuse{csu@#1@@name}\endcsname\csu@@default
  \expandafter\ifx\csname csu@\@nameuse{csu@#1@@name}\endcsname\@empty\else
    \@nameuse{csu@#1@@check}%
  \fi
  % 定义 \csusetup接口
  \kv@define@key{csu}{#1}{
    \@namedef{csu@\@nameuse{csu@#1@@name}}{##1}
    \@nameuse{csu@#1@@check}
    \@nameuse{csu@#1@@code}
  }
}
% 定义接口向 key 添加 code
\newcommand\csu@option@hook[2]{
  \expandafter\g@addto@macro\csname csu@#1@@code\endcsname{#2}
}
\csu@define@key{
  type = {
    choices = {
      bachelor,
      master,
      doctor,
      postdoc,
      course,
      translation,
    },
    default = doctor,
  },
  % degree-type = {
  %   choices = {
  %     academic,
  %     professional,
  %   },
  %   name = degree@type,
  % },
  % 语言
  language = {
    choices = {
      chinese,
      english,
    },
  },
  % 选择打印版还是用于上传的电子版。
  output = {
    choices = {
      print,
      electronic,
    },
    default = print,
  },
}
\newif\ifcsu@type@graduate
\newcommand\csu@set@graduate{
  \csu@type@graduatefalse
  \ifcsu@type@doctor
    \csu@type@graduatetrue
  \fi
  \ifcsu@type@master
    \csu@type@graduatetrue
  \fi
}
\csu@set@graduate
\csu@option@hook{type}{
  \csu@set@graduate
}
% 定义致谢环境，盲审下隐藏致谢
% \newif\ifcsu@review
% \csu@reviewfalse
\DeclareBoolOption[false]{review}
\DeclareBoolOption[false]{continuous}
% 注意openany和oneside参数，默认是无空白页不区分双面印。
\DeclareBoolOption[false]{openright}
\DeclareComplementaryOption{openany}{openright}
\DeclareBoolOption[true]{raggedbottom}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\ifcsu@openright
  \PassOptionsToClass{openright}{book}
\else
  \PassOptionsToClass{openany}{book}
\fi
% 使用 \XeTeX{} 引擎时，\pkg{fontspec} 宏包会被 \pkg{xeCJK} 自动调用。传递给
% \pkg{fontspec} 宏包 \opt{no-math} 选项，避免部分数学符号字体自动调整为 CMR。
% 并使用 \opt{quiet} 忽略警告。
\PassOptionsToPackage{no-math, quiet}{fontspec}
% 读取基类
\LoadClass[UTF8,a4paper,oneside,zihao=-4]{ctexbook}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 加载宏包
%
% 加载必要的宏包
% 部分宏包再前面由于需要已经加载（或顺序限制）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 支持中文的 ctex 宏包
\RequirePackage{ctex}
% 页面布局
\RequirePackage{geometry}
% 使用 \pkg{amsmath} 处理数学公式
\RequirePackage{amsmath}
% 下面的数学宏包和unicode-math 冲突
% \RequirePackage{amsfonts}
% \RequirePackage{amssymb}
% \RequirePackage{bm}
% 使用 \pkg{unicode-math} 处理数学字体
\RequirePackage{unicode-math}
% 算法排版宏包
\RequirePackage[chapter]{algorithm}
\RequirePackage{algorithmic}
\floatname{algorithm}{算法}

% 自定义关键词
\RequirePackage{pgfkeys}
% 设置目录
% v0.1.4 考虑到兼容性问题，不适用titletoc和titilesrc
% \RequirePackage{titletoc}
% \RequirePackage{titlesec}
\RequirePackage[titles]{tocloft}
% 设置字体
\RequirePackage{fontenc}
% 设置颜色
\RequirePackage{xcolor}
% 设置页眉和页脚
\RequirePackage{fancyhdr}
% 代码高亮
% 注：该包依赖python环境Pygments语法高亮显示工具包
% 并且需要 -shell-escape参数
% TODO: 日后需要修改为可配置

% 超链接 hyperref 的设置
% 提供书签与链接
\RequirePackage{hyperref}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{array}
% 长表格
\RequirePackage{longtable}
% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
% multirow 支持在表格中跨行
\RequirePackage{multirow}
% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
%在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆弱命令
\RequirePackage{cprotect}
% 设置代码高亮
% \RequirePackage{minted}
% 设置代码环境
\RequirePackage{listings}
\lstset{
  breaklines,
  columns=fixed,       
  numbers=none,                                        % 在左侧显示行号
  numberstyle=\tiny\color{gray},                       % 设定行号格式
  frame=single,                                        % 不显示背景边框
  rulecolor=\color{black},                             % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
  % backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
  keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
  numberstyle=\footnotesize\color{darkgray},           
  commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
  stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
  showstringspaces=false,                              % 不显示字符串中的空格
  language=c++,                                        % 设置语言
  aboveskip=20pt
}


% jing: ccaption宏包不能出现在 caption 宏包之后
% 设置浮动体的标题
\RequirePackage[justification=centering]{caption}
\RequirePackage[justification=centering]{subcaption}
% 定制列表环境
\RequirePackage{enumitem}
% 提供\AtBeginEnvironment以方便全局调整一些结构的设置
\RequirePackage{etoolbox}
% 确定宏定义的位置
\RequirePackage{filehook}
% 枚举
\RequirePackage{enumitem}
% 末尾页
\RequirePackage{lastpage}
% 
% \RequirePackage{hypdoc}





\AtEndOfClass{
  % 根据模板类型加载不同配置
  \ifcsu@type@graduate
      \input{graduate.cls}
  \else
      \input{undergraduate.cls}
  \fi
}

% 参考SJTU Thesis进行不同环境的英文字体配置
% 字体配置
\let\csu@font@family@xits\@empty
\newcommand\csu@font@set@xits@names{%
  \ifx\csu@font@family@xits\@empty
    \IfFontExistsTF{XITSMath-Regular.otf}{%
      \gdef\csu@font@family@xits{XITS}%
      \gdef\csu@font@style@xits@rm{Regular}%
      \gdef\csu@font@style@xits@bf{Bold}%
      \gdef\csu@font@style@xits@it{Italic}%
      \gdef\csu@font@style@xits@bfit{BoldItalic}%
      \gdef\csu@font@name@xits@math@rm{XITSMath-Regular}%
      \gdef\csu@font@name@xits@math@bf{XITSMath-Bold}%
    }{%
      \gdef\csu@font@family@xits{xits}%
      \gdef\csu@font@style@xits@rm{regular}%
      \gdef\csu@font@style@xits@bf{bold}%
      \gdef\csu@font@style@xits@it{italic}%
      \gdef\csu@font@style@xits@bfit{bolditalic}%
      \gdef\csu@font@name@xits@math@rm{xits-math}%
      \gdef\csu@font@name@xits@math@bf{xits-mathbold}%
    }%
  \fi
}
\let\csu@font@family@libertinus\@empty
\newcommand\csu@font@set@libertinus@names{%
  \ifx\csu@font@family@libertinus\@empty
    \IfFontExistsTF{LibertinusSerif-Regular.otf}{%
      \gdef\csu@font@family@libertinus@serif{LibertinusSerif}%
      \gdef\csu@font@family@libertinus@sans{LibertinusSans}%
      \gdef\csu@font@name@libertinus@math{LibertinusMath-Regular}%
      \gdef\csu@font@style@libertinus@rm{Regular}%
      \gdef\csu@font@style@libertinus@bf{Bold}%
      \gdef\csu@font@style@libertinus@it{Italic}%
      \gdef\csu@font@style@libertinus@bfit{BoldItalic}%
    }{%
      \gdef\csu@font@family@libertinus@serif{libertinusserif}%
      \gdef\csu@font@family@libertinus@sans{libertinussans}%
      \gdef\csu@font@name@libertinus@math{libertinusmath-regular}%
      \gdef\csu@font@style@libertinus@rm{regular}%
      \gdef\csu@font@style@libertinus@bf{bold}%
      \gdef\csu@font@style@libertinus@it{italic}%
      \gdef\csu@font@style@libertinus@bfit{bolditalic}%
    }%
  \fi
}
\newcommand\csu@set@font@xits{%
  \csu@font@set@xits@names
  \setmainfont{\csu@font@family@xits}[
    Extension      = .otf,
    UprightFont    = *-\csu@font@style@xits@rm,
    BoldFont       = *-\csu@font@style@xits@bf,
    ItalicFont     = *-\csu@font@style@xits@it,
    BoldItalicFont = *-\csu@font@style@xits@bfit,
  ]
}
\newcommand\csu@set@font@times{%
  \setmainfont{Times New Roman}[Ligatures = Rare]
  \setsansfont{Arial}
  \setmonofont{Courier New}[Scale = MatchLowercase]
}
\newcommand\csu@set@font@stix{%
  \setmainfont{STIX2Text}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]
}
\newcommand\csu@set@font@step{%
  \setmainfont{STEP}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]
}
\newcommand\csu@set@font@source@sans@mono{%
  \setsansfont{SourceSansPro}[
    Extension      = .otf,
    UprightFont    = *-Regular ,
    ItalicFont     = *-RegularIt ,
    BoldFont       = *-Bold ,
    BoldItalicFont = *-BoldIt,
  ]
  \setmonofont{SourceCodePro}[
    Extension      = .otf,
    UprightFont    = *-Regular ,
    ItalicFont     = *-RegularIt ,
    BoldFont       = *-Bold ,
    BoldItalicFont = *-BoldIt,
    Scale          = MatchLowercase,
  ]
}
\newcommand\csu@set@font@termes{%
  \setmainfont{texgyretermes}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\csu@set@font@pagella{%
  \setmainfont{texgyrepagella}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\csu@set@font@texgyre@sans@mono{%
  \setsansfont{texgyreheros}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setmonofont{texgyrecursor}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\csu@set@font@cambria{%
  \setmainfont{Cambria}
  \setsansfont{Calibri}
  \setmonofont{Consolas}[Scale = MatchLowercase]
}
\newcommand\csu@set@font@libertinus{%
  \csu@font@set@libertinus@names
  \setmainfont{\csu@font@family@libertinus@serif}[
    Extension      = .otf,
    UprightFont    = *-\csu@font@style@libertinus@rm,
    BoldFont       = *-\csu@font@style@libertinus@bf,
    ItalicFont     = *-\csu@font@style@libertinus@it,
    BoldItalicFont = *-\csu@font@style@libertinus@bfit,
  ]%
  \setsansfont{\csu@font@family@libertinus@sans}[
    Extension      = .otf,
    UprightFont    = *-\csu@font@style@libertinus@rm,
    BoldFont       = *-\csu@font@style@libertinus@bf,
    ItalicFont     = *-\csu@font@style@libertinus@it,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\newcommand\csu@set@font@lm{%
  \setmainfont{lmroman10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setsansfont{lmsans10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
% 使用 \pkg{unicode-math} 配置数学字体。
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\newcommand\csu@set@math@font@xits{%
  \csu@font@set@xits@names
  \setmathfont{\csu@font@name@xits@math@rm}[
    Extension    = .otf,
    BoldFont     = \csu@font@name@xits@math@bf,
    StylisticSet = 8,
  ]%
  \setmathfont{\csu@font@name@xits@math@rm}[
    Extension    = .otf,
    BoldFont     = \csu@font@name@xits@math@bf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\csu@set@math@font@stix{%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 8,
  ]%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\csu@set@math@font@step{%
  \setmathfont{STEPMath-Regular}[
    Extension    = .otf,
    BoldFont     = STEPMath-Bold,
    StylisticSet = 8,
  ]%
  \setmathfont{STEPMath-Regular}[
    Extension    = .otf,
    BoldFont     = STEPMath-Bold,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\csu@set@math@font@termes{%
  \setmathfont{texgyretermes-math.otf}
}
\newcommand\csu@set@math@font@pagella{%
  \setmathfont{texgyrepagella-math.otf}
}
\newcommand\csu@set@math@font@cambria{%
  \setmathfont{Cambria Math}
}
\newcommand\csu@set@math@font@libertinus{%
  \csu@font@set@libertinus@names
  \setmathfont{\csu@font@name@libertinus@math .otf}%
}
\newcommand\csu@set@math@font@lm{%
  \setmathfont{latinmodern-math.otf}%
}
%    \end{macrocode}
%
% 设置西文字体集。
%    \begin{macrocode}
\newcommand\csu@load@fontset@xits{%
  \csu@set@font@xits
  \csu@set@font@source@sans@mono
  \csu@set@math@font@xits
}
\newcommand\csu@load@fontset@times{%
  \csu@set@font@times
  \csu@set@math@font@xits
}
\newcommand\csu@load@fontset@stix{%
  \csu@set@font@stix
  \csu@set@font@source@sans@mono
  \csu@set@math@font@stix
}
\newcommand\csu@load@fontset@step{%
  \csu@set@font@step
  \csu@set@font@source@sans@mono
  \csu@set@math@font@step
}
\newcommand\csu@load@fontset@termes{%
  \csu@set@font@termes
  \csu@set@font@texgyre@sans@mono
  \csu@set@math@font@termes
}
\newcommand\csu@load@fontset@pagella{%
  \csu@set@font@pagella
  \csu@set@font@texgyre@sans@mono
  \csu@set@math@font@pagella
}
\newcommand\csu@load@fontset@cambria{%
  \csu@set@font@cambria
  \csu@set@math@font@cambria
}
\newcommand\csu@load@fontset@libertinus{%
  \csu@set@font@libertinus
  \csu@set@math@font@libertinus
}
\newcommand\csu@load@fontset@lm{%
  \csu@set@font@lm
  \csu@set@math@font@lm
}
\newcommand\csu@load@fontset@none{\relax}
%    \end{macrocode}
%
% 载入西文字体集。
%    \begin{macrocode}
% \newcommand\csu@load@fontset{%
%   \@nameuse{csu@load@fontset@\csu@latinfontset}
% }
% latinfontset 是csu的key 使用 对应的kv接口调用  现在没有实现
% \csu@load@fontset@latinfontset
% Windows系统请使用 times 字体集
\csu@load@fontset@times
% linux系统请使用 stix 字体集
% \csu@load@fontset@stix
% \csu@option@hook{csu}{latinfontset}{%
%   \csu@load@fontset
% }


\newcommand\csu@pdfbookmark[2]{}
% 定义通用的chapter命令
\NewDocumentCommand{\csu@chapter}{s m}{
  \if@openright\cleardoublepage\else\clearpage\fi
%   \addcontentsline{toc}{chapter}{#1}%
%   \csu@pdfbookmark{0}{#1}
  \IfBooleanTF{#1}{
      \csu@pdfbookmark{0}{#2}
  }{
      \addcontentsline{toc}{chapter}{#2}
  }
  \chapter*{#2}
}


\AtEndOfPackageFile*{hyperref}{
  \hypersetup{
    linktoc            = all,
    bookmarksdepth     = 2,
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    unicode            = true,
    psdextra           = true,
    breaklinks         = true,
    plainpages         = false,
    pdfdisplaydoctitle = true,
    hidelinks,
  }
  \newcounter{csu@bookmark}
  \renewcommand\csu@pdfbookmark[2]{%
    \phantomsection
    \stepcounter{csu@bookmark}%
    \pdfbookmark[#1]{#2}{csuchapter.\thecsu@bookmark}%
  }
%   \renewcommand\csu@phantomsection{%
%     \phantomsection
%   }
%   \pdfstringdefDisableCommands{%
%     \let\\\@empty
%     \let\quad\@empty
%     \let\hspace\@gobble
%   }
%   \@ifpackagelater{hyperref}{2019/04/27}{}{%
%     \g@addto@macro\psdmapshortnames{\let\mu\textmu}
%   }%
%   \AtBeginDocument{%
%     \hypersetup{
%       pdftitle    = \csu@info@title,
%       pdfsubject  = \csu@name@subject,
%       pdfkeywords = \csu@info@keywords,
%       pdfauthor   = \csu@info@author,
%       pdfcreator  = {LaTeX with csuThesis \version}
%     }
%   }%
}


\endinput
