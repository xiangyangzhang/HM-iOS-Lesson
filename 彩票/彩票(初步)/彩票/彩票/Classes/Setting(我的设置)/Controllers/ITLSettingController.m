//
//  ITLSettingController.m
//  
//
//  Created by 倪凡乐 on 16/2/1.
//
//

#import "ITLSettingController.h"
#import "ITLSettingItem.h"
#import "ITLSettingGroup.h"
#import "ITLSettingCell.h"
#import "ITLSettingArrowItem.h"
#import "ITLSettingSwitchItem.h"
#import "ITLTestViewController.h"
#import "ITLProductController.h"

#import "MBProgressHUD+MJ.h"

@interface ITLSettingController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *settingTableView;
@property (nonatomic, strong)NSMutableArray *datalist;


@end

@implementation ITLSettingController

- (UITableView *)settingTableView
{
    if (_settingTableView == nil) {
        
        _settingTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _settingTableView.delegate = self;
        _settingTableView.dataSource = self;
        
        [self.view addSubview:_settingTableView];
    
    }
    return _settingTableView;
}

- (NSMutableArray *)datalist
{
    if (_datalist == nil) {
        _datalist = [NSMutableArray array];
        
        //0组
        
        ITLSettingArrowItem *pushNotice = [ITLSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" devtVcClass:[ITLTestViewController class]];
        /**
         *  此处思考了多态的问题，多态有助于写调用类的方法，不用给每个派生类都写调用方法，便于扩展。
         *  参考http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386820044406b227b3e751cc4d5190420d17a2dc6353000
         */
        ITLSettingItem *shake = [ITLSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇"];
        ITLSettingItem *soundEffect = [ITLSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];

        ITLSettingGroup *group0 = [[ITLSettingGroup alloc]init];
        group0.items = @[pushNotice,shake,soundEffect];

        
        //1组
        ITLSettingItem *newVersion = [ITLSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
        //3. 实现代码块
        //保存一段检查更新的功能
        newVersion.option = ^{
            
            //显示蒙版
            [MBProgressHUD showMessage:@"正在检查ing……"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                //隐藏蒙版
                [MBProgressHUD hideHUD];
                
                //提示用户    
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有更新版本" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
                
                [alert show];
                
            });
            
        };
        
        ITLSettingItem *help = [ITLSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" devtVcClass:[ITLTestViewController class]];
        ITLSettingItem *share = [ITLSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" devtVcClass:[ITLTestViewController class]];
        ITLSettingItem *moreMessage = [ITLSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" devtVcClass:[ITLTestViewController class]];
        ITLSettingItem *moreNetease = [ITLSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" devtVcClass:[ITLProductController class]];
        ITLSettingItem *moreAbout = [ITLSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" devtVcClass:[ITLTestViewController class]];
        
        ITLSettingGroup *group1 = [[ITLSettingGroup alloc]init];
        group1.items = @[newVersion,help,share,moreMessage,moreNetease,moreAbout];
        group1.header = @"帮助";
        
        [_datalist addObject:group0];
        [_datalist addObject:group1];
    
    }
    return _datalist;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self settingTableView];
    
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
            [self.navigationController pushViewController:vc animated:YES];
            NSLog(@"%s",__func__);
        }
    }
    
    
}


@end
