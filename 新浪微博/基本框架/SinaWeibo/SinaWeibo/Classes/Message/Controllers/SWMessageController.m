//
//  SWMessageController.m
//  
//
//  Created by 倪凡乐 on 16/2/28.
//
//

#import "SWMessageController.h"

@interface SWMessageController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *msgTableView;

@end

@implementation SWMessageController

- (UITableView *)msgTableView
{
    if (_msgTableView == nil) {
        _msgTableView = [[UITableView alloc]init];
        _msgTableView.dataSource = self;
        _msgTableView.delegate = self;
    }
    return _msgTableView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self tableView];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"CELL";
    
    // 此处应注意默认的 forIndexPath:indexPath
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"MESSAGE";
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.title = @"test";
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
