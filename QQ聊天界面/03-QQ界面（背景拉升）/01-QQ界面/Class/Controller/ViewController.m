//
//  ViewController.m
//  01-QQ界面
//
//  Created by 倪凡乐 on 16/1/1.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLMessage.h"
#import "NFLMessageFrame.h"
#import "NFLMessageCell.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *message;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        //_tableView.backgroundColor = [UIColor redColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

- (NSMutableArray *)message
{
    if (_message == nil) {
        _message = [NFLMessage message];
    }
    return _message;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    //cell 不可选中
    self.tableView.allowsSelection = NO;
    
    //设置背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
    
    //取消分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

# pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.message.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //声明cell，分配空间，初始化
    NFLMessageCell *cell = [NFLMessageCell messageCellWithTableView:tableView];

    //设定大小位置及内容
    NFLMessageFrame *messageFrame = self.message[indexPath.row];
    cell.messageFrame = messageFrame;
    
    return cell;

}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NFLMessageFrame *messageFrame = self.message[indexPath.row];
    return messageFrame.cellH;
}


@end
