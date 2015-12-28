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
#import "NFLStatusFrame.h"

@interface ViewController ()

/** 保存statusFrame模型的数组 */
@property (nonatomic, strong) NSArray *statusFrames;

@end

@implementation ViewController

static NSString *ID = @"Cell";

- (NSArray *)statusFrames
{
    if (_statusFrames == nil) _statusFrames = [NFLStatusFrame statusFrames];
    return _statusFrames;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 为tableView注册可重用单元格
    [self.tableView registerClass:[NFLStatusCell class] forCellReuseIdentifier:ID];
}


# pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //NFLStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // unable to dequeue a cell with identifier Cell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard
    // 使用这个方法，要求一定注册可重用单元格，否则就会崩溃！
    // 官方建议使用以下方法，利用程序的崩溃，及时发现问题

    
    NFLStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    // 一旦在注册了可重用Cell，以上两个方法是等价的

//
//    if (cell == nil) {
//        cell = [[NFLStatusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
    
    // 赋值
    // 取出StatusFrame模型
    NFLStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    cell.statusFrame = statusFrame;

    return cell;
}


#pragma mark - 代理方法
/** 计算单元格行高*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //此方法执行时，cell还没实例化
    //但是行高计算是在cell实例化时，通过设置status属性得到行高
    //如何在cell实例化之前获得行高
    //解决方法：通过status可以计算得到行高！->再建立一个模型，专门计算所有控件的位置
    NFLStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    
    return statusFrame.cellHeight;

}


@end
