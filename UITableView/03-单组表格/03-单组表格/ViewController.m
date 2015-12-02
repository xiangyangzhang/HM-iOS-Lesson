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
@property (nonatomic, strong)NSArray *LOLHeroes;


@end

@implementation ViewController

- (NSArray *)LOLHeroes
{
    if (_LOLHeroes == nil) {
        _LOLHeroes = [Hero LOLHeroes];
    }
    return _LOLHeroes;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        //实例化，必须制定UITableViewStyle
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        //指定数据源，相当于连线
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];

}

# pragma mark - 数据源方法

//每个分组中的数据总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.LOLHeroes.count;
}

//每个单元格的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //取出英雄对象
    Hero *LOLH = self.LOLHeroes[indexPath.row];
    
    cell.textLabel.text = LOLH.name;
    
    return cell;
    
}

@end


