//
//  ViewController.m
//  03-单组表格
//
//  Created by 倪凡乐 on 15/11/30.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *LOLHeroes;

@end

@implementation ViewController

- (NSArray *)LOLHeroes
{
    if (_LOLHeroes == nil) {
        _LOLHeroes = [Hero LOLHeroes];
    }
    return _LOLHeroes;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        //实例化，必须制定UITableViewStyle
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        //指定数据源，相当于连线
        _tableView.dataSource = self;
        
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    //设置统一行高
    self.tableView.rowHeight = 100;
    
    //设置分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor colorWithRed:0 green:255.0/255.0 blue:0 alpha:0.8];
    
    //tableHeaderView，表格最顶部，通常放置图片轮播器
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    headerView.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = headerView;
    
    //tableFooterView，通常用于网络刷新
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    footerView.backgroundColor = [UIColor redColor];
    self.tableView.tableFooterView = footerView;

}

# pragma mark - 数据源方法

//每个分组中的数据总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"数据总数");
    return self.LOLHeroes.count;
}

/**
 UITableViewCellStyleDefault    默认，标题+可选图像
 UITableViewCellStyleValue1     标题+明细+图像
 UITableViewCellStyleValue2     不显示图像，标题+明细
 UITableViewCellStyleSubtitle   标题+明细+图像，运用广泛
 */

//每个单元格的明细信息
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.可重用标示符字符串
    //static静态变量，一个变量只存在一个内存地址中，不会被释放，直到应用结束
    static NSString *cellID = @"cell";
    
    //2.取出缓存池中可重用的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    //3.如果没有找到，实例化单元格,通用的属性写在if语句中
    if (cell == nil) {
        NSLog(@"实例化单元格");
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
        //设置单元格背景颜色
        //cell.backgroundColor = [UIColor greenColor];
        
        //未选中单元格背景视图，图片自动填充，实际开发中应用较多
        //UIImage *BGImage = [UIImage imageNamed:@"img_01"];
        //cell.backgroundView = [[UIImageView alloc] initWithImage:BGImage];
        
        //选中单元格的背景视图
        //UIImage *seletedBGImage = [UIImage imageNamed:@"img_01.jpg"];
        //cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:seletedBGImage];
    }
    
    //取出英雄对象
    Hero *LOLH = self.LOLHeroes[indexPath.row];
    
    //标题
    cell.textLabel.text = LOLH.name;
    
    //明细信息
    cell.detailTextLabel.text = LOLH.intro;
    
    //图像
    cell.imageView.image = [UIImage imageNamed:LOLH.icon];
    
    //表格右侧控件定义
    //1、UITableViewCellAccessoryNone
    //2、UITableViewCellAccessoryDisclosureIndicator 数据行操作
    //3、UITableViewCellAccessoryDetailDisclosureButton 信息按钮及数据行均可操作
    //4、UITableViewCellAccessoryDetailButton 信息按钮
    //4、UITableViewCellAccessoryCheckmark 打勾，表示该行数据设置完毕，用的较少
    //cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    
    //指定自定义控件
    /**
     通常accessoryType不能满足要求时，才使用自定义控件
     但需自行定义监听方法，通常写在cell中，不要写在视图控制器中
     */
    UISwitch *swither = [[UISwitch alloc]init];
    
    [swither addTarget:self action:@selector(swithChanged:) forControlEvents:UIControlEventValueChanged];
    
    cell.accessoryView = swither;
    
    NSLog(@"单元格明细%ld",(long)indexPath.row);
    
    return cell;
    
}

# pragma mark - 代理方法

//开关方法
- (void)swithChanged:(UISwitch *)sender
{
    NSLog(@"%s",__func__);
}

//选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
}

//信息按钮显示
//此方法不会触发行选中
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
}

//代理,设置不同行高
//
//-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return (indexPath.row % 2)?60:44;
//}

/**
 表格执行顺序
 1> 知道总共有多少数据
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 2> 计算每行行高
 -(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 tableView继承自scrollView，要知道contentSize才能滚动，行高默认为44
 3> 加载明细，懒加载，只显示要显示的表格行

 */


@end


