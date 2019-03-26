# Visulization-DecisionTree-in-HTS

HMM参数语音合成（HTS版本）

在trees文件中可以看到tree_sd_cmp.inf文件，它包含了两个信息

* 属性问题集文件
* 决策树聚类完毕后，决策树的叶子节点信息以及分类信息

## 使用方法

visual1文件夹(叶子节点颜色统一)
>运行`python gen_pdf.pdf`即可，注意需要graphviz库

visual2文件夹(叶子节点颜色根据落到该叶子节点音素单元的数量上色)
>运行`python gen_pdf.pdf`即可，注意需要graphviz库和mathematica
（其中ChangeColor.wl需要设置绝对路径，因为相对路径搞不清在wl文件中怎么设置）
