% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{CSUBachelor}[2020/01/16 2.0 Zhongnan University Thesis Template for Bachelor Degree]
\LoadClass[zihao=-4,a4paper,oneside]{ctexbook}
\setmainfont{Times New Roman}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions

\newcommand\degree{^\circ}			%用degree代替上标的角度的单位°，类似于宏定义？？
% 这部分不需要ctex提供了\zihao指令
\newcommand{\chuhao}{\fontsize{42.2pt}{\baselineskip}\selectfont}
\newcommand{\xiaochu}{\fontsize{36.1pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26.1pt}{\baselineskip}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24.1pt}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{22.1pt}{\baselineskip}\selectfont}
\newcommand{\xiaoer}{\fontsize{18.1pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16.1pt}{\baselineskip}\selectfont}
\newcommand{\xiaosan}{\fontsize{15.1pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14.1pt}{\baselineskip}\selectfont}
\newcommand{\xiaosi}{\fontsize{12.1pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaowu}{\fontsize{9.0pt}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaoliu}{\fontsize{6.5pt}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{\baselineskip}\selectfont}
\newcommand{\bahao}{\fontsize{5.0pt}{\baselineskip}\selectfont}

%------------------------ Page layout ----------------------------------
% \RequirePackage{fancyhdr,hyperref,CJKfntef,ulem,array}
% TODO:其余包都在csuthesis.cls require
\RequirePackage{CJKfntef,ulem}

% 设置超链接打印
\hypersetup{pdfencoding=auto} 
 \ifprint
 \hypersetup{hidelinks}
 \else
\hypersetup{citecolor=magenta,linkcolor=blue}
\fi
\RequirePackage[top=2.7truecm,bottom=2.2truecm,left=3truecm,right=3truecm,includefoot,xetex]{geometry}    % 页面设置%

\newtoks\StudentNumber       %学号
\newtoks\miji            %密级
\newtoks\Cmajor          %学科专业中文名
\newtoks\Emajor          %学科专业英文名
\newtoks\Edate           %英文日期
\newtoks\Etitle          %英文题目
\newtoks\Eauthor         %作者英文名
\newtoks\Esupervisor     %指导教师英文名
\newtoks\Csupervisor     %指导教师中文名
\newtoks\Eschoolname      %学院英文名
\newtoks\Cschoolname      %学院中文名
\newtoks\Eclassname      %专业班级英文名
\newtoks\Cclassname      %专业班级中文名

%------------------------------------- 页眉  页脚 -------------------------------------------
%\RequirePackage{ifthen}	%第一页页眉与其他页不同
%fancyhdr宏包来设置页眉和页脚，默认每章的第一页的page style是plain，需要单独处理。
% 设置 plain 的属性
\fancypagestyle{plain}
{
\fancyhf{} 						 %清除以前对页眉页脚的设置
% 设置页眉 (head)
\fancyhead[RE,RO]{\heiti \xiaowu \@title}			%自定义标题，奇数页偶数页均
\fancyhead[LE,LO]{\includegraphics[scale=0.15]{coverCSU.png}}			
\renewcommand{\headrulewidth}{0.7pt} 	% 页眉与正文之间的水平线粗细
% 设置页脚(foot)
\renewcommand{\footrulewidth}{0pt}		 %隐藏页脚横线
\fancyfoot[C]{-\,\thepage\,-}		 	%正文页脚格式-1-
}

% 设置 fancy 的属性
\pagestyle{fancy}
{
\fancyhf{} 					
\fancyhead[RE,RO]{\heiti \xiaowu \@title}			%自定义标题
\fancyhead[LE,LO]{\includegraphics[scale=0.1]{coverCSU.png}}	
\renewcommand{\headrulewidth}{0pt}                              	
\fancyfoot[C]{-\,\thepage\,-}
}

%----------------------------------------封面--------------------------------------------
\RequirePackage{makecell}	%表格内换行

\def\maketitle{%
  \thispagestyle{empty}%
  \begin{center}\

  \begin{figure}[ht]					%开始图片
  \centering 						
  \includegraphics[scale=0.5]{coverCSU.png}		
  \label{fig:good}					
  \end{figure}	

%\setlength{\parskip}{2em} %设置段落间距

   \vspace*{24pt}		%两行，小四号空白12pt
    {
    \noindent
    %\setlength{\lineskip}{26pt} %设置行间距
    \heiti\fontsize{45pt}{45pt} \makebox[9cm][c]{本科毕业设计（论文）}\\
     \vspace{26pt}		%一行，一号空白26pt
    \heiti\yihao \makebox[9cm][c]{GRADUATION DESIGN(THESIS)}
    }
    \par
    \vspace*{48pt}		%四行，小四号空白12pt

        {\heiti \xiaoer
    \begin{tabular}{ccc}		%\CJKunderline   \the\  中南大学本科毕业设计~\LaTeX~模板
      %{\makebox[3.2cm][s]{题\hfill 目：}} & {\uline\kaishu \xiaoer \makebox[8cm][c]{ \@title}  }& \\[2ex]
      {\makebox[3.2cm][s]{题\hfill 目：}} & {\uline{\kaishu \xiaoer \makebox[8cm]{\shortstack[c]{中南大学本科毕业设计 \\ ~\LaTeX~模板}}}   }& \\[2ex]
      %此处感谢网友	http://blog.sina.com.cn/s/blog_665f991f0100q7j9.html
      {\makebox[3.2cm][s]{学\hfill 生\hfill 姓\hfill 名：}} & {\kaishu \xiaoer\uline{\makebox[8cm][c]{\@author}}}& \\[2ex]
      {\makebox[3.2cm][s]{指\hfill 导\hfill 教\hfill 师：}} & {\kaishu \xiaoer\uline{\makebox[8cm][c]{\the\Csupervisor}}}& \\[2ex]
      {\makebox[3.2cm][s]{学\hfill 院：}}  & {\kaishu \xiaoer\uline{\makebox[8cm][c]{\the\Cschoolname}}}& \\[3ex]
      {\makebox[3.2cm][s]{专\hfill 业\hfill 班\hfill 级：}} & {\kaishu \xiaoer\uline{\makebox[8cm][c]{\the\Cclassname}}}& \\[2ex]
     \end{tabular}
    } 
    
    \par
    \vspace{72pt}		%6行，小四号空白12pt
    {
    \heiti \erhao 本科生院制\\
    \heiti \xiaoer \@date \par
    }
  \end{center}
% \null
% \cleardoublepage
  }

%--------------------------------------- Abstract & Keywords -------------------------------------------
\setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}
\renewcommand*{\songti}{\CJKfamily{zhsong}}			%解决宋体无法加粗的问题

\newcommand\cnabstractname{摘要} 
\newcommand\enabstractname{ABSTRACT}

\newcommand\cnkeywords[1]{ {\noindent\bfseries\songti\zihao{-4}\cnkeywordsname: }#1}
\newcommand\cnkeywordsname{关键词}

\newcommand\enkeywords[1]{ {\noindent\bfseries\zihao{-4}\enkeywordsname: }#1}
\newcommand\enkeywordsname{Key words}



\newenvironment{cnabstract}{
  \newpage
    \begin{center}
      \heiti \xiaoer 
      \vspace*{1em}	%空一行
      \@title\\
      \vspace*{1em}	%空一行
      {\heiti\zihao{3}\cnabstractname}
      \vspace*{1em}	%空一行
    \end{center}
   \songti\zihao{-4}
}



\newenvironment{enabstract}{
    \newpage
      \begin{center}
      \heiti \xiaoer 
      \vspace*{1em}	%空一行
      \the\Etitle\\
      \vspace*{1em}	%空一行
      {\heiti\zihao{3}\enabstractname}
      \vspace*{1em}	%空一行
    \end{center}
    \songti\zihao{-4}
}
    % {\par}

%-------------------------------------常用宏包----------------------------------------
\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,thmmarks]{ntheorem}% AMSLaTeX宏包.
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色
%\RequirePackage{mathrsfs}   % 不同于\mathcal or \mathfrak 之类的英文花体字体
\RequirePackage{url}
\RequirePackage{enumerate}


%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
\theorempreskip{0pt}
\theorempostskip{0pt}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}

\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}  %自定义新命令\upcite, 使参考文献引用以上标出现

%---------------------- suppress extra inter-line spacing in \list environments--------------------
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
            \parsep 0pt
            \topsep \parsep
            \itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
     \else \global\advance\@listdepth\@ne \fi
  \rightmargin \z@ \listparindent2\ccwd \itemindent \z@
  \csname @list\romannumeral\the\@listdepth\endcsname
  \def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
  \@trivlist
  \parskip\parsep \parindent\listparindent
  \advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
  \advance\@totalleftmargin \leftmargin
  \parshape \@ne \@totalleftmargin \linewidth
  \ignorespaces}

\makeatother
%-----------------------------------------------------------------------------------------------------------------
\newcommand\acknowledgement{\chapter*{\ziju{0}结束语(或致谢)}}

%--------------------------------------- 章节标题设置 -------------------------------------------------
\RequirePackage{ctex,indentfirst}

\ctexset{chapter={format+={\heiti\zihao{3}},afterskip={12pt},beforeskip={-12pt},number={\arabic{chapter}},name={第,章}}}
\ctexset{section={format+={\heiti\zihao{-4}\raggedright},indent={2em},afterskip={0pt},beforeskip={0pt}}}
\ctexset{subsection={format+={\kaishu\zihao{-4}\raggedright},indent={2em}}}
\ctexset{subsubsection={format={\zihao{-4}\bf\raggedright}}}

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

%-----------------------------------------图表标题设置 ---------------------------------------
\RequirePackage[labelsep=quad]{caption} 	%序号之后空一格写标题
\captionsetup[table]{textfont=bf} 		 %设置表格标题字体为黑体  。2016.06.07

\renewcommand\figurename{\heiti\zihao{5} 图}
\renewcommand\tablename{\heiti\zihao{5} 表} 

%-----------------------------------------目录设置-------------------------------------------

\RequirePackage{titletoc}
\ctexset{contentsname={目录}}

\RequirePackage{tocloft} 		%\usepackage[subfigure]{tocloft} %模板中用了subfigure，不加此选项会产生冲突
\renewcommand\cfttoctitlefont{\hfill\heiti\zihao{3}}
\renewcommand\cftaftertoctitle{\hfill}

\renewcommand\cftdotsep{1} 			% change the space between dots

\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}%类似的，report类中为section补上引导点

\renewcommand\cftbeforetoctitleskip{0pt}
\renewcommand\cftaftertoctitleskip{0pt}

\renewcommand\cftchapfont{\songti\xiaosi}
\renewcommand\cftchappagefont{\songti\xiaosi}	%将章节后面默认的加粗给去掉
\renewcommand\cftsecfont{\songti\xiaosi}
\renewcommand\cftsubsecfont{\songti\xiaosi}
 
%---------------------------------------------参考文献---------------------------------------------------
\bibliographystyle{abbrv}        % 参考文献样式,  plain,unsrt,alpha,abbrv,chinesebst 等等
%----------------------------------------------------------------------------------------------
\graphicspath{{figures/}}        % 图片文件路径
%----------------------------------------------------------------------------------------------
\allowdisplaybreaks

\endlinechar `\^^M
\endinput
%-----------------------------------------附录，代码------------------------------
\RequirePackage{listings}			%对代码进行抄录环境的宏包
\lstset{columns=flexable,numbers=left,numberstyle=\footnotesize,escapechar=`}%设置·为转义字符，这样才可以显示汉语
