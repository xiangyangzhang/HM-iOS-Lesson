//
//  ViewController.m
//  01-表格控件
//
//  Created by 倪凡乐 on 15/11/18.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark - 数据源方法
//分组数，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//每组内总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else if (section ==1){
        return 6;
    }else{
        return 12;
    }
}

//每个单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //实例化UITableViewCell时用initWithStyle
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text =[NSString stringWithFormat:@"黑马学员 第 %2ld 期  %4ld 学员", indexPath.section,indexPath.row];
    
    
    NSLog(@"%s",__func__);

    return cell;
}

//分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"黑马00期";
    }else if(section == 1){
        return @"黑马01期";
    }else{
        return @"黑马02期";
    }
}

//分组注脚
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"慢慢学习";
}

@end
