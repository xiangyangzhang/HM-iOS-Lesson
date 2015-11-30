//
//  ViewController.m
//  01-表格控件
//
//  Created by 倪凡乐 on 15/11/18.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong)NSArray *dataList;

@end

@implementation ViewController

- (NSArray *)dataList
{
    if (_dataList == nil) {
        
        Student *stu1 = [[Student alloc] init];
        stu1.title = @"黑马1期";
        stu1.desc = @"厉害";
        
        //?
        NSMutableArray *arrayM1 = [NSMutableArray array];
        for (int i = 0; i < 4; i++) {
            [arrayM1 addObject:[NSString stringWithFormat:@"%@ - %4d",stu1.title,i+1]];
        }
        stu1.students = arrayM1;
        
        Student *stu2 = [[Student alloc] init];
        stu2.title = @"黑马2期";
        stu2.desc = @"非常厉害";
        
        NSMutableArray *arrayM2 = [NSMutableArray array];
        for (int i = 0; i < 9; i++) {
            [arrayM2 addObject:[NSString stringWithFormat:@"%@ - %4d",stu2.title,i+1]];
        }
        stu2.students = arrayM2;

        _dataList = @[stu1,stu2];
    }
    return _dataList;
}

#pragma mark - 数据源方法
//分组数，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}

//每组内总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //数组中的元素数量
    //取出数组中学员信息
    Student *stu = self.dataList[section];
    return stu.students.count;

}

//每个单元格内容
//NSIndexPath包含以下两个变量
//@property(nonatomic,readonly) NSInteger section;  分组
//@property(nonatomic,readonly) NSInteger row;      行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //实例化UITableViewCell时用initWithStyle
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //取出indexPath对应的数据
    Student *stu = self.dataList[indexPath.section];
    
    NSLog(@"%ld",(long)indexPath.section);
    
    cell.textLabel.text = stu.students[indexPath.row];
    
    return cell;
}

//分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Student *stu = self.dataList[section];
    return stu.title;
    
}

//分组注脚
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    Student *stu = self.dataList[section];
    return stu.desc;
    //从数组中取出的对象为ID类型，不能使用点语法，只能使用getter语法
    //return [self.dataList[section] desc];
}

@end
