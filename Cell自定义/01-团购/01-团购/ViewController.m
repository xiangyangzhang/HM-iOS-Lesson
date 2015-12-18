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
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupBuys.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    
    //自定义cell类型
    NFLGroupBuysCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        //从XIB加载自定义视图
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NFLGroupBuysCell" owner:nil options:nil]lastObject];
        
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    NFLGroupBuys *groupBuys = self.groupBuys[indexPath.row];
    //cell.textLabel.text = groupBuys.title;
    //cell.imageView.image = [UIImage imageNamed:groupBuys.icon];
    //cell.detailTextLabel.text =  [NSString stringWithFormat:@"￥%@                已有%@购买",groupBuys.price,groupBuys.buyCount];
    cell.titleLabel.text = groupBuys.title;
    cell.iconView.image = [UIImage imageNamed:groupBuys.icon];
    cell.priceLabel.text =  [NSString stringWithFormat:@"￥%@",groupBuys.price];
    cell.buyCountLabel.text =[NSString stringWithFormat:@"已有%@人购买",groupBuys.buyCount];
    
    return cell;
}

@end
