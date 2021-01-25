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
% 声明部分（Identification）
%
% 指定模板使用的 Latex 版本，标识输出模板名
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csuthesis}[2020/01/21 v1.4.9-dev by Edwardzcn edwardzcn98@gmail.com]
\ProcessOptions\relax
\RequirePackage{xparse}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 预先定义（Preliminary declarations）
% 
% 定义kv对，在模板文件中使用的指令并引入依赖的包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 报错与警告
\NewDocumentCommand{\csu@error}{ m o }{
    \ClassError{csuthesis_error}{#1}{#2}
}
\NewDocumentCommand{\csu@warning}{m o }{
    \ClassWarning{csuthesis_warning}{#1}{#2}
}

% 模板类型选取
\newif\ifcsu@type@bachelor
\csu@type@bachelortrue
\newif\ifcsu@type@master
\csu@type@masterfalse
\newif\ifcsu@type@doctor
\csu@type@doctorfalse
\newif\ifcsu@type@course
\csu@type@coursefalse

\newif\ifcsu@type@graduate
\csu@type@graduatefalse
\ifcsu@type@master
    \csu@type@graduatetrue
\fi
\ifcsu@type@doctor
    \csu@type@graduatetrue
\fi

% 定义致谢环境，盲审下隐藏致谢
\newif\ifcsu@review
\csu@reviewfalse




% 读取基类
% \LoadClass[a4paper,12pt]{article}
\LoadClass[UTF8,openany,a4paper,oneside,zihao=-4]{ctexbook}
% 注意openany和oneside参数，默认是无空白页不区分双面印。

% 加载宏包
% 引擎执行判断宏包
\RequirePackage{ifxetex}

\RequireXeTeX
\ifxetex
    % Pass
\else
    \csu@error{Please use xelatex driver instead of pdflatex.}
\fi

% 支持中文的 ctex 宏包
\RequirePackage{ctex}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
% 自定义关键词
\RequirePackage{pgfkeys}
% 设置目录
\RequirePackage{titletoc}
% 设置字体
\RequirePackage{fontenc}
% 设置颜色
\RequirePackage{xcolor}
% 设置页眉和页脚
\RequirePackage{fancyhdr}
% UPDATE: 由ctex设置代替
% 设置标题格式
% \RequirePackage{titlesec}
% \newcommand{\sectionbreak}{\clearpage}
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
% 设置代码环境
\RequirePackage{listings}
% UPDATE: 由ctex设置代替
% 首行缩进
% \RequirePackage{indentfirst}


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

% 参考文献格式 GB/T7714-2015
% 来自https://github.com/hushidong/biblatex-gb7714-2015
\RequirePackage[backend=biber,gbpub=false, style=gb7714-2015]{biblatex}


% 根据模板类型加载不同配置
\ifcsu@type@graduate
    \input{graduate.cls}
\else
    \input{undergraduate.cls}
    % \input{test.cls}
\fi

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
%   \renewcommand\sjtu@phantomsection{%
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
%       pdftitle    = \sjtu@info@title,
%       pdfsubject  = \sjtu@name@subject,
%       pdfkeywords = \sjtu@info@keywords,
%       pdfauthor   = \sjtu@info@author,
%       pdfcreator  = {LaTeX with SJTUThesis \version}
%     }
%   }%
}

\endinput
