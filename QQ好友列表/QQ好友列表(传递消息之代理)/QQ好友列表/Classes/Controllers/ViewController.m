//
//  ViewController.m
//  QQ好友列表
//
//  Created by 倪凡乐 on 16/1/6.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLFriendsGroupModel.h"
#import "NFLFriendsModel.h"
#import "NFLHeaderView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,NFLHeaderViewDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *friendsGroup;


@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)friendsGroup
{
    if (_friendsGroup == nil) {
        _friendsGroup = [NFLFriendsGroupModel friendsGroup];
    }
    return _friendsGroup;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self tableView];
    
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

# pragma mark - 表格数据源方法

//分组总数，需设置datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friendsGroup.count;
    
}

//分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NFLFriendsGroupModel *group = self.friendsGroup[section];
    return group.name;
}

//单元格总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NFLFriendsGroupModel *group = self.friendsGroup[section];
    if (group.isOpen) {
        return group.friends.count;
    }else{
        return 0;
    }
        
}

//单元格明细
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"friend";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    //1. 取出模型数据
    NFLFriendsGroupModel *group = self.friendsGroup[indexPath.section];
    NFLFriendsModel *friends = group.friends[indexPath.row];
    
    //2. 设置模型数据
    cell.imageView.image = [UIImage imageNamed:friends.icon];
    cell.textLabel.text = friends.name;
    //会员为红色
    cell.textLabel.textColor = friends.vip?[UIColor redColor]:[UIColor blackColor];
    cell.detailTextLabel.text = friends.intro;
    
    return cell;
}

#pragma mark - 表格代理方法
//头部行高,需设置delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

//设置表格头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NFLHeaderView *header = [NFLHeaderView headerViewWith:tableView];
    
    NFLFriendsGroupModel *group = self.friendsGroup[section];
    
    header.group = group;
    
    //让控制器充当headerView的代理
    header.delegate = self;
    
    return header;
}

#pragma mark - header代理方法
- (void)headerViewIsOpen:(NFLHeaderView *)view
{
    [self.tableView reloadData];
}

@end

