这里存放模型评估(使用特定的模型进行测试，并对测试的结果的pixel accuracy和mean IoU进行计算)相关的代码、模型等文件

- 最终直接执行的脚本是run.sh，它调用eval_all.m和eval_acc.m，调整这两个文件中的配置可以指定模型文件、图片列表等
- model文件夹下存放训练得到的模型文件
- mc_result文件夹下存放得到图片结果