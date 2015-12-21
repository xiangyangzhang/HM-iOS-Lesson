//
//  ViewController.m
//  01-团购
//
//  Created by 倪凡乐 on 15/12/17.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLGroupBuys.h"

//导入自定义cell头文件
#import "NFLGroupBuysCellTableViewCell.h"

@interface ViewController ()<UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *groupBuys;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)groupBuys
{
    if (_groupBuys == nil) {
        _groupBuys = [NFLGroupBuys groupBuys];
    }
    return _groupBuys;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    self.tableView.rowHeight = 80;
    
    //调整边距，使表格视图让开状态栏
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
//    self.tableView.contentOffset = CGRect;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupBuys.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //1. 创建cell
    NFLGroupBuysCellTableViewCell *cell = [NFLGroupBuysCellTableViewCell cellWithTableView:self.tableView];
    
    //2. 通过数据模型，设置cell内容，视图控制器不需要了解cell内部的组成
    cell.groupBuys = self.groupBuys[indexPath.row];

    
    return cell;
}

@end
