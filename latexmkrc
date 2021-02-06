# Latexmk configuration file.
# Latexmk 配置文件，命名为 `latexmkrc` 或者 `.latexmkrc`


# 设置个选项执行的命令
$pdflatex = "pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S";
$xelatex = "xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S";
$bibtex = "bibtex %O %S";
$biber = "biber %O %S";

# Use xelatex with latexmk
# 使用 xelatex 引擎编译
# 设置pdf生成模式，有 0 1 2 3 4 5
# 0 代表不生成 pdf
# 1 代表使用 $pdfltex 选项的命令
# 2 代表使用 $ps2pdf
# 3 代表使用 $dvipdf
# 4 代表使用 $lualatex；
# 5 代表使用 $xelatex
$pdf_mode = 5;

# Configure files to clean
# 执行 latexmk -c 或 latexmk -C 时会清空 latex 程序生成的文件（-C 更强，会清空pdf）
$clean_ext = "aux bbl bcf blg idx ind lof lot out toc acn acr alg glg glo gls ist fls log fdb_latexmk synctex.gz run.xml thm xdv"