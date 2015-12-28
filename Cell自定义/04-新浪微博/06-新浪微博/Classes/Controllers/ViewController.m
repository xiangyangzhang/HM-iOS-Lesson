//
//  ViewController.m
//  06-新浪微博
//
//  Created by 倪凡乐 on 15/12/21.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLStatus.h"
#import "NFLStatusCell.h"

@interface ViewController ()

@property (nonatomic, strong)NSArray *statuses;


@end

@implementation ViewController

- (NSArray *)statuses
{
    if (_statuses == nil) {
        _statuses = [NFLStatus statuses];
    }
    return _statuses;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 200;
}


# pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    NFLStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[NFLStatusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.status = self.statuses[indexPath.row];
    
    return cell;
}


#pragma mark - 代理方法
/** 计算单元格行高*/
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //此方法执行时，cell还没实例化
    //但是行高计算是在cell实例化时，通过设置status属性得到行高
    //如何在cell实例化之前获得行高
    return 200;
}


@end
