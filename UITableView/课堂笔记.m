监听控件的某些事件
使用代理模式，是为了在程序直接"解耦"

表格可以显示非常丰富的数据，为了达到这一效果，设置表格的"数据源"
@required 	必须实现的方法
@optional	可选的实现方法->不强求实现->如果实现了能得到特殊的效果，如果不实现，也不影响程序的正常运行
	能够增加控件的灵活度

1. UITableView 主要参数，需将UITableView的dataSource与View Controller连线

1> numberOfRowsInSection //每个分组总数，必填
2> cellForRowAtIndexPath //每行cell单元格细节，包含属性section及row，必填
3> initWithStyle //实例化TableViewCell的第一选择
4> numberOfSectionsInTableView //分组组数，默认为1
5> titleForHeaderInSection //分组标题
6> titleForFooterInSection //分组注脚

2. 代理阶段性小结

1）协议
<控件名字+DataSource>   与数据有关的方法
<控件名字+Delegate>     与事件有关的方法，通常用于监听事件
2）代理方法
1> 方法名与控件名称开头（没有类前缀）  -> 方便程序员编写时快速找到协议方法
2> 第一个参数是自己                 -> 意味在协议方法中，直接访问对象的属性或方法
3> 代理方法的返回值                 -> 控制器向控件（委托）发送数据

3. 代码块存放路径

~/Library/Developer/Xcode/UserData/CodeSnippets

换新电脑，直接替换文件夹中的内容即可。


4. 自我思考：
NSMutableArray *m = [NSMutableArray array];//NSMutableArray的方法，用类消息创建对象+初始化
NSMutableArray *m = [[NSMutableArray alloc]init];//NSObject的方法，用对象消息创建对象+初始化
以上两种写法在内存管理方面有差异，参考 http://blog.csdn.net/henry_sea/article/details/6832183

