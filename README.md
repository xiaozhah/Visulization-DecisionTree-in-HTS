# Visulization-DecisionTree-in-HTS

可视化HMM参数语音合成（HTS版本）的决策树（分HMM状态和基频、频谱两种类型）

在trees文件中可以看到tree_sd_cmp.inf文件，它包含了这些信息

* 属性问题集文件
* 决策树聚类完毕后，决策树的叶子节点信息以及分类信息

## 使用方法

### 叶子节点颜色统一
visual1文件夹
>运行`python gen_pdf.pdf`即可

依赖软件graphviz库

### 叶子节点按值上色
visual2文件夹(叶子节点颜色根据落到该叶子节点音素单元的数量上色)
>运行`python gen_pdf.pdf`即可

依赖软件 graphviz库和mathematica
