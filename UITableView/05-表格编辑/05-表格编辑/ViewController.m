//
//  ViewController.m
//  05-表格编辑
//
//  Created by 倪凡乐 on 15/12/17.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataList;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithObjects:@"aa",@"bb",@"c",@"das",@"adasddadsa",@"bb",@"c",@"das",@"aa",@"bb",@"c",@"das",@"aa",@"bb",@"c",@"das",@"adasddadsa",@"bb",@"c",@"das",@"aa",@"bb",@"c",@"das",nil];
    }
    return _dataList;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource =self;
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    //开始编辑，一旦editing == YES就默认开启删除模式
    self.tableView.editing = YES;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataList[indexPath.row];

    return cell;
}

//MVC中的数据存储在模型中
//一旦写入这个方法名，视图即可手势拖拽删除，但模型中的数据需写具体实现语句
/**
 UITableViewCellEditingStyleNone
 UITableViewCellEditingStyleDelete  删除
 UITableViewCellEditingStyleInsert  添加
 */

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"删除");
        
        //1. 删除self.datalist中indexPath对应的数据
        [self.dataList removeObjectAtIndex:indexPath.row];
        
        //2. 刷新表格(重载数据)
        //[self.tableView reloadData];
        //deleteRowAtIndexPaths删除表格对应行
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }else if(editingStyle == UITableViewCellEditingStyleInsert){
        NSLog(@"增加");
        
        [self.dataList insertObject:@"add-item" atIndex:indexPath.row+1];
        
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        
        //注意此处与「删除」不同，参数为path
        //insertRowAtIndexPaths让表哥控件动画在指定indexPath添加指定行
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
    }
}

//移动表格行
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //1. 将源从数组中取出
    //2. 将源从数组中删除
    //3. 将源从数组中插入
    id source = self.dataList[sourceIndexPath.row];
    [self.dataList removeObjectAtIndex:sourceIndexPath.row];
    [self.dataList insertObject:source atIndex:destinationIndexPath.row];
    
    NSLog(@"%@",self.dataList);
}
# pragma mark - 代理方法
//代理方法，返回编辑样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //增加
    return UITableViewCellEditingStyleInsert;
    
    //删除
    //return UITableViewCellEditingStyleDelete;
}


@end
