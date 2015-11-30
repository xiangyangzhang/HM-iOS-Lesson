//
//  ViewController.m
//  03-单组表格
//
//  Created by 倪凡乐 on 15/11/30.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *heroes;


@end

@implementation ViewController

- (NSArray *)heroes
{
    if (_heroes == nil) {
        _heroes = [Hero heroes];
    }
    return _heroes;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        //实例化，必须制定UITableViewStyle
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

@end
