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
#import "ITLPushNoticeController.h"

#import "MBProgressHUD+MJ.h"

@interface ITLSettingController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation ITLSettingController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addGroup0];
    [self addGroup1];
    
    
}

- (void)addGroup0
{
    
    ITLSettingArrowItem *pushNotice = [ITLSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" devtVcClass:[ITLPushNoticeController class]];
    /**
     *  此处思考了多态的问题，多态有助于写调用类的方法，不用给每个派生类都写调用方法，便于扩展。
     *  参考http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386820044406b227b3e751cc4d5190420d17a2dc6353000
     */
    ITLSettingItem *shake = [ITLSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇"];
    ITLSettingItem *soundEffect = [ITLSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    ITLSettingGroup *group0 = [[ITLSettingGroup alloc]init];
    group0.items = @[pushNotice,shake,soundEffect];
    
    [self.datalist addObject:group0];

    
}

- (void)addGroup1
{
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
    
    [self.datalist addObject:group1];

}

@end
