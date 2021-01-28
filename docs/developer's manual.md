# 开发者文档

## 代码提交规范
- PR请提交至dev分支。特别是涉及LaTeX模板内容变化的，必须合入dev分支，master分支的改动最好都从dev分支流入。

- git commit message 的编写风格请使用[Angular Commit Format](https://www.ruanyifeng.com/blog/2016/01/commit_message_change_log.html)
```
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
```
csu-thesis
├─.vscode   // vscode配置文件
├─content   // 论文正文
│  └─chapters   // 按章节存放的正文.tex文件
├─docs      // 项目文档
├─images    // 论文中用到的图像
└─word      // word模板
```

