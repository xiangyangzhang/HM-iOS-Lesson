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

4. cell的initWithStyle种类
UITableViewCellStyleDefault    默认，标题+可选图像
UITableViewCellStyleValue1     标题+明细+图像
UITableViewCellStyleValue2     不显示图像，标题+明细
UITableViewCellStyleSubtitle   标题+明细+图像，运用广泛

5. 表格行高属性使用代理实现
方法一：
self.tableView.rowheight = 60；//所有行指定同一高度，性能高，优先级低
方法二：
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//不同行指定不同高度，性能低，优先级高

6. 表格执行顺序
1> 知道总共有多少数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
2> 计算每行行高
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
tableView继承自scrollView，要知道contentSize才能滚动，行高默认为44
3> 加载明细，懒加载，只显示要显示的表格行


7. cell.accessoryType、cell.accessoryView及代理方法设置

8. reveal的使用，按照视频方法配置还是出错，可参考 http://www.ruanman.net/archives/7249.html

9. 缓存池的概念

10. 自我思考：
NSMutableArray *m = [NSMutableArray array];//NSMutableArray的方法，用类消息创建对象+初始化
NSMutableArray *m = [[NSMutableArray alloc]init];//NSObject的方法，用对象消息创建对象+初始化
以上两种写法在内存管理方面有差异，参考 http://blog.csdn.net/henry_sea/article/details/6832183
UIView的类中可放UI开头的类，如：
    UISwitch *swither = [[UISwitch alloc]init];
    cell.accessoryView = swither;

