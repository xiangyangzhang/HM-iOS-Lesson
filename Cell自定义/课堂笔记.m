1. 问题分析

1>	图太大
2>	字太小
3>	钱数&购买人数不整齐
4>	图片太紧，没有间隙，大小不一致
......

默认的表格样式通常不能满足正常的开发需要

解决方法 —— 自定义Cell
1>	XIB（团购）
2>	纯代码(微博)
3>	StoryBoard

XIB的定义步骤
-----------------------------------------------
1>	新建HMTgCell.xib
2>  拽一个需要自定义的控件，摆放其他子控件
3>	新建一个类（.h .m）
*	类名要与XIB的名字保持一致,如团购例子为HMTgCell
*	继承自的子类要与XIB中的根节点的类型一致，如团购例子建立的是UITableViewCell
4>	要连线之前，需要将XIB的根节点类名修改为刚刚新建的类名，如团购例子，选择为HMTgCell
5>	连线,名字建议为plist中的key名+类型名
6>	在XIB的属性面板，指定可重用标示符

自定义cell的delegate的定义步骤
-----------------------------------------------
自定义控件中定义协议
1>	在头文件(.h)导入自身类class：@class NFLTableFooterView;
2>  定义protocol协议名：@protocol NFLTableFooterViewDelegate <NSObject>
3>  在协议中指定协议方法：- (void)footerViewDidLoadButton:(NFLTableFooterView *)footerView;
4>  在@interface下定义协议属性：@property (nonatomic,weak) id <NFLTableFooterViewDelegate>delegate;
5>  在@implementation下在定义事件发生时调用协议方法：[self.delegate footerViewDidLoadButton:self];
委托方：「拟协议」「找谁做」「做什么」 -> 代理方

ViewController中设置协议
1>  指定代理方：footerView.delegate = self;
2>  声明遵守协议：@interface ViewController ()<UITableViewDataSource,NFLTableFooterViewDelegate>
3>  实现代理方法：- (void)footerViewDidLoadButton:(NFLTableFooterView *)footerView{...}
代理方：「被指定」「被遵守」「被命令」

思考：协议方法与代理方法的关系-在协议中指定的协议方法即为代理方法，不过协议方法不指定具体执行内容。


将StoryBoard默认的UIViewController改为UITableViewController
-----------------------------------------------
1>  在StoryBoard中UIViewController删掉，拖入UITableViewController
2>  在头文件修改继承关系:@interface ViewController : UITableViewController
3>  在在StoryBoard右侧中指定UITableViewController的类：ViewController
4>  不用定义tableView并懒加载了，直接可使用

问题：Failed to instantiate the default view controller for UIMainStoryboardFile 'Main' - perhaps the designated entry point is not set?
解决：在 Is Intial View Controller 前打个勾，详见：http://my.oschina.net/u/936286/blog/316565?fromerr=6KIVu7Ua

代码创建Cell的步骤
-----------------------------------------------
1>	创建自定义Cell，继承自UITableViewCell
2>	根据需求，确定控件，并定义属性
3>	用getter方法完成控件的实例化，只创建并添加到contentView，不处理位置
4>  定义一个模型属性，通过setter方法，设置cell的显示

-----------------------------------------------
1. cellHeight 可以通过Status计算
解决方法：statusFrame模型，通过setter方法计算行高！

目前存在什么问题？

所有的单元格控件的计算都是重复的，而且每次表格滚动，设置内容都会重新计算。

解决这个问题：
statusFrame模型中，已经包含了status属性。

目前控制器中的数组保存的是status模型，将status模型替换为statusFrame模型{status，所有控件的位置}，同样具有status模型

解决步骤
1. 将原有的status模型替换为statusFrame模型
*** 只是修改视图控制器中的代码，暂时不要动cell。

*** 重构代码一定要小步来

问题：
cell中的控件的位置计算，依然是自己计算的。
解决办法：将cell中的status替换为statusFrame就可以拿到控件位置


-----------------------------------------------
代理模式：是父控件(视图控制器)监听子控件的事件，当子控件发生某些事情时，通知父控件工作！

*	footView => controller 去工作，使用代理
*	controller => footView 去工作，直接调用footView的方法即可
