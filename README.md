# README

## 使用方法

1. 在命令行调用 `show()` 函数，等待 GUI 界面弹出。**注意，应当是`show()`而不是`show`**

2. 点击 GUI 左侧的添加 xx 图添加图片，可以在 `./十套测试数据` 文件夹下选择相应的样例进行添加。图片的命名对应的视角如下表

   | 图片命名 | 对应视角 |
   | :------: | :------: |
   |   back   |  后视图  |
   |   down   |  仰视图  |
   |  front   |  主视图  |
   |   left   |  左视图  |
   |  right   |  右视图  |
   |    up    |  俯视图  |

3. 添加图片完成后点击“识别图像”。

4. 待右侧相继出现识别结果后，点击“生成魔方”。

   [CubeSolution/1.png at main · biganabc/CubeSolution (github.com)](https://github.com/biganabc/CubeSolution/blob/main/readmeImgs/1.png)

5. 点击“开始旋转”调用魔方求解程序，提示图片消失表示求解完成，将自动展示旋转过程。

   [CubeSolution/2.png at main · biganabc/CubeSolution (github.com)](https://github.com/biganabc/CubeSolution/blob/main/readmeImgs/2.png)

6. 最后给出复原结果：

   [CubeSolution/3.png at main · biganabc/CubeSolution (github.com)](https://github.com/biganabc/CubeSolution/blob/main/readmeImgs/3.png)

## 代码结构

源代码文件中，各个 .m 文件的具体作用如下表（按字典序排列）：

|       文件名称        |                           实现功能                           | 所属步骤 |
| :-------------------: | :----------------------------------------------------------: | :------: |
|      applyMove.m      |                         执行一步转动                         | 魔方求解 |
|  calculateFaceAxis.m  |                      计算面顶点偏移矩阵                      | GUI 界面 |
|     createCube.m      |                         创建魔方个体                         | GUI 界面 |
|    executeRotate.m    |                         执行旋转操作                         | GUI 界面 |
| generateColorMatrix.m |                         生成颜色矩阵                         | GUI 界面 |
|      getBorder.m      |                         获取图片边框                         | CV 识别  |
|      getColors.m      |                      获取各个色块的颜色                      | CV 识别  |
|    getColorTypes.m    |                 获取魔方六个面中心色块的颜色                 | CV 识别  |
|        getId.m        |                     计算魔方当前状态的ID                     | 魔方求解 |
|       inverse.m       |                   求一步转动的反向操作序号                   | 魔方求解 |
|  isMoveApplicable.m   |                判断一步操作在当前阶段是否合法                | 魔方求解 |
|        main.m         |                        CV 识别的入口                         | CV 识别  |
|      num2alpha.m      |              将 CV 识别的数字矩阵转化为字母矩阵              | 数据结构 |
|     prepareCube.m     |                  CV 进入魔方求解部分的接口                   | 数据结构 |
|      readColor.m      |                利用余弦相似求图片中某点的颜色                | CV 识别  |
|        show.m         | GUI界面<br/>	pushbutton1_Callback函数包括了CV部分代码；<br/>	pushbutton2_Callback函数包括了魔方求解与旋转调用接口；<br/>	pushbutton3_Callback函数包括了魔方建模部分接口； | GUI 界面 |
|    solution2str.m     |                  算法求解和可视化展示的接口                  | 数据结构 |
|      solveCube.m      |                     求解魔方，输出解序列                     | 魔方求解 |
|    takeColorXYP.m     |                      图像黑白二值化处理                      | CV 识别  |
|        wait.m         |                         展示等待图片                         | GUI 界面 |

