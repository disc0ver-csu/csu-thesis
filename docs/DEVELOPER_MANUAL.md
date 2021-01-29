# 开发者文档

## 代码提交规范

- PR 请提交至 dev 分支。特别是涉及 LaTeX 模板内容变化的，必须合入 dev 分支，master 分支的改动最好都从 dev 分支流入。

- git commit message 的编写风格请使用[Angular Commit Format](https://www.ruanyifeng.com/blog/2016/01/commit_message_change_log.html)

## 文档命名规范

- 说明文档

  项目说明文档，除`README.md`外均放置在`docs`目录下。不建议使用 plain txt 方式编辑文件，请使用 Markdown 语法。文件命名规则为大写字母加下划线，如`DEVELOPER_MANUAL.md`。

- 其他文件

  请使用小写字母+下划线形式，如`csuthesis_main.tex`。

```txt
<修改类型>(<影响范围>): <不多于20字的标题>
<--空行-->
[正文]
<--空行-->
[页脚]

###############
    example:
---------------
feat(本科生模板): 添加页码

封面不计入页码，正文之前采用罗马页码，正文采用阿拉伯数字页码
###############
```

## 项目结构

```txt
csu-thesis
├─.vscode   // vscode配置文件
├─content   // 论文正文
│  └─chapters   // 按章节存放的正文.tex文件
├─docs      // 项目文档
├─images    // 论文中用到的图像
└─word      // word模板
```
