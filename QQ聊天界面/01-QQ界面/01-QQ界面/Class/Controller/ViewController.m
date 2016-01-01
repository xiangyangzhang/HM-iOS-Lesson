//
//  ViewController.m
//  01-QQ界面
//
//  Created by 倪凡乐 on 16/1/1.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLMessage.h"
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
}

# pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.message.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NFLMessageCell *cell = [NFLMessageCell messageCellWithTableView:tableView];
    cell.imageView.image = [UIImage imageNamed:@"Jobs.png"];
    return cell;

}


@end
