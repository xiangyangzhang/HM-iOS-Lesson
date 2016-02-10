//
//  ITLBaseController.m
//  
//
//  Created by 倪凡乐 on 16/2/10.
//
//

#import "ITLBaseController.h"

#import "ITLSettingItem.h"
#import "ITLSettingGroup.h"
#import "ITLSettingCell.h"
#import "ITLSettingArrowItem.h"
#import "ITLSettingSwitchItem.h"


@interface ITLBaseController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *baseTableView;

@end

@implementation ITLBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self baseTableView];
    
}

- (UITableView *)settingTableView
{
    if (_baseTableView == nil) {
        
        _baseTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _baseTableView.delegate = self;
        _baseTableView.dataSource = self;
        
        [self.view addSubview:_baseTableView];
        
    }
    return _baseTableView;
}

- (NSMutableArray *)datalist
{
    if (_datalist == nil) {
        _datalist = [NSMutableArray array];
        
    }
    return _datalist;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.datalist.count;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ITLSettingGroup *group = self.datalist[section];
    return group.items.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITLSettingCell *cell =[[ITLSettingCell class]cellWithTableView:tableView];
    
    ITLSettingGroup *group = self.datalist[indexPath.section];
    ITLSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    return cell;
    
}

//分组头部
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ITLSettingGroup *group = self.datalist[section];
    return group.header;
}

//分组脚注
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ITLSettingGroup *group = self.datalist[section];
    return group.footer;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITLSettingGroup *group = self.datalist[indexPath.section];
    ITLSettingItem *item = group.items[indexPath.row];
    
    //4. 调用代码块
    if (item.option) {
        item.option();
        return;
    }
    
    
    if ([item isKindOfClass:[ITLSettingArrowItem class]]) {//需要跳转控制器
        
        ITLSettingArrowItem *arrowItem = (ITLSettingArrowItem *)item;
        
        //创建跳转控制器
        if (arrowItem.destVcClass) {
            UIViewController *vc = [[arrowItem.destVcClass alloc]init];
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
            NSLog(@"%s",__func__);
        }
    }
    
    
}



@end
