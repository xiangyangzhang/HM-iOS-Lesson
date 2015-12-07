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
    
//    设置行高
//    self.tableView.rowHeight = 60;

}

# pragma mark - 数据源方法

//每个分组中的数据总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //取出英雄对象
    Hero *LOLH = self.LOLHeroes[indexPath.row];
    
    //标题
    cell.textLabel.text = LOLH.name;
    
    //明细信息
    cell.detailTextLabel.text = LOLH.intro;
    
    //图像
    cell.imageView.image = [UIImage imageNamed:LOLH.icon];
    
    return cell;
    
}

# pragma mark - 计算行高
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row % 2)?60:44;
}

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


