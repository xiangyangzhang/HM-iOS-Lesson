//
//  ViewController.m
//  01-团购
//
//  Created by 倪凡乐 on 15/12/17.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLGroupBuys.h"
#import "NFLTableFooterView.h"

//导入自定义cell头文件
#import "NFLGroupBuysCellTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,NFLTableFooterViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *groupBuys;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)groupBuys
{
    if (_groupBuys == nil) {
        _groupBuys = [NFLGroupBuys groupBuys];
    }
    return _groupBuys;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    self.tableView.rowHeight = 80;
    
    //调整边距，使表格视图让开状态栏
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    //加载更多
    //footerView的宽度会与表格整体高度一致，只需指定高度
    //self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    //UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 44)];
    //footerView.backgroundColor = [UIColor redColor];
    //self.tableView.tableFooterView = footerView;
    
    NFLTableFooterView *footerView = [[[NSBundle mainBundle]loadNibNamed:@"NFLTableFooterView" owner:nil options:nil]lastObject];
    
    //指定代理
    footerView.delegate = self;
    //自定义cell连接主表格
    self.tableView.tableFooterView =footerView;
    self.tableView.tableHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"NFLTableHeaderView" owner:nil options:nil]lastObject];
    
}

# pragma mark- footerView代理方法
/**
 #if 0
 #endif
 可用于调试
 */
# if 1
- (void)footerViewDidLoadButton:(NFLTableFooterView *)footerView
{
    NSLog(@"努力加载中......");
    NSDictionary * dict = @{@"title":@"小尾羊火锅",@"icon":@"ad_00",@"price":@"230",@"buyCount":@"213"};
    NFLGroupBuys *groupBuy = [NFLGroupBuys groupBuysWithDict:dict];
    [self.groupBuys addObject:groupBuy];
    
    //[self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.groupBuys.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    
    [footerView endRefresh];
}
#endif

# pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupBuys.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //1. 创建cell
    NFLGroupBuysCellTableViewCell *cell = [NFLGroupBuysCellTableViewCell cellWithTableView:self.tableView];
    
    //2. 通过数据模型，设置cell内容，视图控制器不需要了解cell内部的组成
    cell.groupBuys = self.groupBuys[indexPath.row];

    
    return cell;
}

@end
